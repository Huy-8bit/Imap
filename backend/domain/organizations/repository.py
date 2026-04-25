from __future__ import annotations

import json
from dataclasses import dataclass
from typing import Any

from backend.domain.taxonomies.constants import TAXONOMY_TABLES, TaxonomyName
from backend.libs.database import PostgreSQLClient

from .validators import clean_text, normalize_lookup_key


@dataclass(slots=True)
class OrganizationContactPayload:
    website: str | None
    email: str | None
    phone: str | None


@dataclass(slots=True)
class OrganizationLocationPayload:
    province_id: int | None
    ward_name: str | None
    full_address: str | None
    latitude: float | None
    longitude: float | None
    location_precision: str
    geocode_source: str | None


@dataclass(slots=True)
class OrganizationUpsertPayload:
    external_code: str | None
    trade_name: str | None
    registered_name: str | None
    tax_code: str | None
    founded_year: int | None
    operational_status_id: int | None
    closed_year: int | None
    organization_type_id: int | None
    primary_industry_sector_id: int | None
    has_positive_social_impact: bool | None
    primary_product_type_id: int | None
    other_product_type_id: int | None
    source_status: str
    contact: OrganizationContactPayload
    location: OrganizationLocationPayload
    secondary_industry_sector_ids: list[int]
    environmental_impact_area_ids: list[int]
    raw_payload: dict[str, Any]


@dataclass(slots=True)
class UpsertResult:
    organization_id: int
    operation: str


class OrganizationImportRepository:
    def __init__(self, db: PostgreSQLClient) -> None:
        self._db = db

    def load_taxonomy_lookups(
        self,
        taxonomy_names: tuple[TaxonomyName, ...],
    ) -> dict[str, dict[str, int]]:
        lookups: dict[str, dict[str, int]] = {}
        for taxonomy_name in taxonomy_names:
            table = TAXONOMY_TABLES[taxonomy_name]
            rows = self._db.fetch_all(
                f"""
                SELECT id, code, display_name, display_name_en, display_name_vi, metadata
                FROM {table}
                WHERE is_active = TRUE
                """
            )
            taxonomy_lookup: dict[str, int] = {}
            for row in rows:
                metadata = row.get("metadata") or {}
                aliases = metadata.get("aliases", []) if isinstance(metadata, dict) else []
                candidates = [
                    row.get("code"),
                    row.get("display_name"),
                    row.get("display_name_en"),
                    row.get("display_name_vi"),
                    *aliases,
                ]
                for candidate in candidates:
                    key = normalize_lookup_key(candidate)
                    if key:
                        taxonomy_lookup[key] = row["id"]
            lookups[taxonomy_name.value] = taxonomy_lookup
        return lookups

    def create_import_run(
        self,
        *,
        source_name: str,
        source_type: str,
        source_path: str,
        total_records: int,
    ) -> int:
        row = self._db.fetch_one(
            """
            INSERT INTO organization_import_runs (
                source_name,
                source_type,
                source_path,
                total_records,
                status
            )
            VALUES (%s, %s, %s, %s, 'running')
            RETURNING id
            """,
            (source_name, source_type, source_path, total_records),
        )
        if row is None:
            raise RuntimeError("Failed to create organization import run.")
        return row["id"]

    def record_import_error(
        self,
        *,
        import_run_id: int,
        record_index: int,
        external_code: str | None,
        field_name: str,
        error_code: str,
        error_message: str,
        payload: dict[str, Any],
    ) -> None:
        self._db.execute(
            """
            INSERT INTO organization_import_errors (
                import_run_id,
                record_index,
                external_code,
                field_name,
                error_code,
                error_message,
                payload
            )
            VALUES (%s, %s, %s, %s, %s, %s, %s::jsonb)
            """,
            (
                import_run_id,
                record_index,
                external_code,
                field_name,
                error_code,
                error_message,
                json.dumps(payload, ensure_ascii=False),
            ),
        )

    def finish_import_run(
        self,
        *,
        import_run_id: int,
        status: str,
        inserted_count: int,
        updated_count: int,
        skipped_count: int,
        error_count: int,
    ) -> None:
        self._db.execute(
            """
            UPDATE organization_import_runs
            SET
                status = %s,
                inserted_count = %s,
                updated_count = %s,
                skipped_count = %s,
                error_count = %s,
                finished_at = NOW()
            WHERE id = %s
            """,
            (
                status,
                inserted_count,
                updated_count,
                skipped_count,
                error_count,
                import_run_id,
            ),
        )

    def upsert_organization(
        self,
        payload: OrganizationUpsertPayload,
        *,
        import_run_id: int,
        source_name: str,
        source_path: str,
        source_record_id: str | None,
    ) -> UpsertResult:
        with self._db.cursor() as cursor:
            existing_id = self._find_existing_organization_id(
                cursor,
                tax_code=payload.tax_code,
                registered_name=payload.registered_name,
            )
            operation = "updated" if existing_id is not None else "inserted"
            organization_id = existing_id or self._insert_organization(cursor, payload)
            if existing_id is not None:
                self._update_organization(cursor, organization_id, payload)

            self._upsert_contact(cursor, organization_id, payload.contact)
            self._upsert_location(cursor, organization_id, payload.location)
            self._replace_secondary_industry_sectors(
                cursor,
                organization_id,
                payload.secondary_industry_sector_ids,
            )
            self._replace_environmental_impacts(
                cursor,
                organization_id,
                payload.environmental_impact_area_ids,
            )
            cursor.execute(
                """
                INSERT INTO organization_import_sources (
                    organization_id,
                    import_run_id,
                    source_name,
                    source_path,
                    source_record_id,
                    payload
                )
                VALUES (%s, %s, %s, %s, %s, %s::jsonb)
                """,
                (
                    organization_id,
                    import_run_id,
                    source_name,
                    source_path,
                    source_record_id,
                    json.dumps(payload.raw_payload, ensure_ascii=False),
                ),
            )

        return UpsertResult(organization_id=organization_id, operation=operation)

    def _find_existing_organization_id(
        self,
        cursor,
        *,
        tax_code: str | None,
        registered_name: str | None,
    ) -> int | None:
        if tax_code:
            cursor.execute(
                "SELECT id FROM organizations WHERE tax_code = %s LIMIT 1",
                (tax_code,),
            )
            row = cursor.fetchone()
            if row:
                return row["id"]

        normalized_name = clean_text(registered_name)
        if normalized_name:
            cursor.execute(
                """
                SELECT id
                FROM organizations
                WHERE lower(coalesce(registered_name, '')) = lower(%s)
                ORDER BY id ASC
                LIMIT 1
                """,
                (normalized_name,),
            )
            row = cursor.fetchone()
            if row:
                return row["id"]

        return None

    def _insert_organization(self, cursor, payload: OrganizationUpsertPayload) -> int:
        cursor.execute(
            """
            INSERT INTO organizations (
                external_code,
                trade_name,
                registered_name,
                tax_code,
                founded_year,
                operational_status_id,
                closed_year,
                organization_type_id,
                primary_industry_sector_id,
                has_positive_social_impact,
                primary_product_type_id,
                other_product_type_id,
                source_status
            )
            VALUES (
                %(external_code)s,
                %(trade_name)s,
                %(registered_name)s,
                %(tax_code)s,
                %(founded_year)s,
                %(operational_status_id)s,
                %(closed_year)s,
                %(organization_type_id)s,
                %(primary_industry_sector_id)s,
                %(has_positive_social_impact)s,
                %(primary_product_type_id)s,
                %(other_product_type_id)s,
                %(source_status)s
            )
            RETURNING id
            """,
            self._organization_params(payload),
        )
        return cursor.fetchone()["id"]

    def _update_organization(self, cursor, organization_id: int, payload: OrganizationUpsertPayload) -> None:
        params = self._organization_params(payload)
        params["organization_id"] = organization_id
        cursor.execute(
            """
            UPDATE organizations
            SET
                external_code = %(external_code)s,
                trade_name = %(trade_name)s,
                registered_name = %(registered_name)s,
                tax_code = %(tax_code)s,
                founded_year = %(founded_year)s,
                operational_status_id = %(operational_status_id)s,
                closed_year = %(closed_year)s,
                organization_type_id = %(organization_type_id)s,
                primary_industry_sector_id = %(primary_industry_sector_id)s,
                has_positive_social_impact = %(has_positive_social_impact)s,
                primary_product_type_id = %(primary_product_type_id)s,
                other_product_type_id = %(other_product_type_id)s,
                source_status = %(source_status)s
            WHERE id = %(organization_id)s
            """,
            params,
        )

    def _upsert_contact(self, cursor, organization_id: int, payload: OrganizationContactPayload) -> None:
        cursor.execute(
            """
            INSERT INTO organization_contacts (
                organization_id,
                website,
                email,
                phone
            )
            VALUES (%s, %s, %s, %s)
            ON CONFLICT (organization_id) DO UPDATE
            SET
                website = EXCLUDED.website,
                email = EXCLUDED.email,
                phone = EXCLUDED.phone,
                updated_at = NOW()
            """,
            (
                organization_id,
                payload.website,
                payload.email,
                payload.phone,
            ),
        )

    def _upsert_location(self, cursor, organization_id: int, payload: OrganizationLocationPayload) -> None:
        cursor.execute(
            """
            INSERT INTO organization_locations (
                organization_id,
                province_id,
                ward_name,
                full_address,
                latitude,
                longitude,
                geom,
                location_precision,
                geocode_source
            )
            VALUES (
                %(organization_id)s,
                %(province_id)s,
                %(ward_name)s,
                %(full_address)s,
                %(latitude)s,
                %(longitude)s,
                CASE
                    WHEN %(latitude)s IS NULL OR %(longitude)s IS NULL THEN NULL
                    ELSE ST_SetSRID(ST_MakePoint(%(longitude)s, %(latitude)s), 4326)
                END,
                %(location_precision)s,
                %(geocode_source)s
            )
            ON CONFLICT (organization_id) DO UPDATE
            SET
                province_id = EXCLUDED.province_id,
                ward_name = EXCLUDED.ward_name,
                full_address = EXCLUDED.full_address,
                latitude = EXCLUDED.latitude,
                longitude = EXCLUDED.longitude,
                geom = EXCLUDED.geom,
                location_precision = EXCLUDED.location_precision,
                geocode_source = EXCLUDED.geocode_source,
                updated_at = NOW()
            """,
            {
                "organization_id": organization_id,
                "province_id": payload.province_id,
                "ward_name": payload.ward_name,
                "full_address": payload.full_address,
                "latitude": payload.latitude,
                "longitude": payload.longitude,
                "location_precision": payload.location_precision,
                "geocode_source": payload.geocode_source,
            },
        )

    def _replace_secondary_industry_sectors(
        self,
        cursor,
        organization_id: int,
        secondary_sector_ids: list[int],
    ) -> None:
        cursor.execute(
            "DELETE FROM organization_industry_sectors WHERE organization_id = %s",
            (organization_id,),
        )
        if not secondary_sector_ids:
            return

        for index, sector_id in enumerate(secondary_sector_ids, start=1):
            cursor.execute(
                """
                INSERT INTO organization_industry_sectors (
                    organization_id,
                    industry_sector_id,
                    sort_order
                )
                VALUES (%s, %s, %s)
                """,
                (organization_id, sector_id, index),
            )

    def _replace_environmental_impacts(
        self,
        cursor,
        organization_id: int,
        impact_area_ids: list[int],
    ) -> None:
        cursor.execute(
            "DELETE FROM organization_environmental_impacts WHERE organization_id = %s",
            (organization_id,),
        )
        if not impact_area_ids:
            return

        for index, impact_area_id in enumerate(impact_area_ids, start=1):
            cursor.execute(
                """
                INSERT INTO organization_environmental_impacts (
                    organization_id,
                    environmental_impact_area_id,
                    sort_order
                )
                VALUES (%s, %s, %s)
                """,
                (organization_id, impact_area_id, index),
            )

    def _organization_params(self, payload: OrganizationUpsertPayload) -> dict[str, Any]:
        return {
            "external_code": payload.external_code,
            "trade_name": payload.trade_name,
            "registered_name": payload.registered_name,
            "tax_code": payload.tax_code,
            "founded_year": payload.founded_year,
            "operational_status_id": payload.operational_status_id,
            "closed_year": payload.closed_year,
            "organization_type_id": payload.organization_type_id,
            "primary_industry_sector_id": payload.primary_industry_sector_id,
            "has_positive_social_impact": payload.has_positive_social_impact,
            "primary_product_type_id": payload.primary_product_type_id,
            "other_product_type_id": payload.other_product_type_id,
            "source_status": payload.source_status,
        }
