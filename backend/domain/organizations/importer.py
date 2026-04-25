from __future__ import annotations

import json
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any

from backend.domain.taxonomies.constants import TaxonomyName

from .repository import (
    OrganizationContactPayload,
    OrganizationImportRepository,
    OrganizationLocationPayload,
    OrganizationUpsertPayload,
)
from .validators import (
    RecordValidationError,
    clean_text,
    normalize_email,
    normalize_lookup_key,
    normalize_phone,
    normalize_tax_code,
    parse_bool,
    parse_year,
)


@dataclass(slots=True)
class ImportErrorRecord:
    record_index: int
    external_code: str | None
    field_name: str
    error_code: str
    error_message: str


@dataclass(slots=True)
class ImportSummary:
    source_name: str
    source_path: str
    total_records: int
    inserted_count: int
    updated_count: int
    skipped_count: int
    error_count: int
    status: str
    dry_run: bool
    errors: list[ImportErrorRecord]


class OrganizationImportService:
    REQUIRED_TAXONOMIES: tuple[TaxonomyName, ...] = (
        TaxonomyName.PROVINCES,
        TaxonomyName.OPERATIONAL_STATUSES,
        TaxonomyName.ORGANIZATION_TYPES,
        TaxonomyName.INDUSTRY_SECTORS,
        TaxonomyName.ENVIRONMENTAL_IMPACT_AREAS,
        TaxonomyName.PRODUCT_TYPES,
    )

    def __init__(self, repository: OrganizationImportRepository) -> None:
        self._repository = repository

    def import_file(
        self,
        dataset_path: Path,
        *,
        source_name: str | None = None,
        dry_run: bool = False,
    ) -> ImportSummary:
        payload = json.loads(dataset_path.read_text(encoding="utf-8"))
        records = payload.get("organizations") or []
        if not isinstance(records, list):
            raise ValueError(f"Dataset has invalid organizations list: {dataset_path}")

        resolved_source_name = source_name or dataset_path.stem
        lookups = self._repository.load_taxonomy_lookups(self.REQUIRED_TAXONOMIES)
        errors: list[ImportErrorRecord] = []
        inserted_count = 0
        updated_count = 0
        skipped_count = 0
        import_run_id: int | None = None

        if not dry_run:
            import_run_id = self._repository.create_import_run(
                source_name=resolved_source_name,
                source_type="json",
                source_path=str(dataset_path),
                total_records=len(records),
            )

        try:
            for record_index, raw_record in enumerate(records, start=1):
                external_code = clean_text(raw_record.get("id")) if isinstance(raw_record, dict) else None
                try:
                    normalized = self._normalize_record(raw_record, lookups)
                    if dry_run:
                        continue

                    result = self._repository.upsert_organization(
                        normalized,
                        import_run_id=import_run_id,
                        source_name=resolved_source_name,
                        source_path=str(dataset_path),
                        source_record_id=external_code,
                    )
                    if result.operation == "inserted":
                        inserted_count += 1
                    else:
                        updated_count += 1
                except RecordValidationError as exc:
                    skipped_count += 1
                    errors.append(
                        ImportErrorRecord(
                            record_index=record_index,
                            external_code=external_code,
                            field_name=exc.field_name,
                            error_code=exc.error_code,
                            error_message=exc.message,
                        )
                    )
                    if import_run_id is not None:
                        self._repository.record_import_error(
                            import_run_id=import_run_id,
                            record_index=record_index,
                            external_code=external_code,
                            field_name=exc.field_name,
                            error_code=exc.error_code,
                            error_message=exc.message,
                            payload=raw_record if isinstance(raw_record, dict) else {"raw_record": raw_record},
                        )

            status = "dry_run" if dry_run else ("completed_with_errors" if errors else "completed")
            if import_run_id is not None:
                self._repository.finish_import_run(
                    import_run_id=import_run_id,
                    status=status,
                    inserted_count=inserted_count,
                    updated_count=updated_count,
                    skipped_count=skipped_count,
                    error_count=len(errors),
                )

            return ImportSummary(
                source_name=resolved_source_name,
                source_path=str(dataset_path),
                total_records=len(records),
                inserted_count=inserted_count,
                updated_count=updated_count,
                skipped_count=skipped_count,
                error_count=len(errors),
                status=status,
                dry_run=dry_run,
                errors=errors,
            )
        except Exception:
            if import_run_id is not None:
                self._repository.finish_import_run(
                    import_run_id=import_run_id,
                    status="failed",
                    inserted_count=inserted_count,
                    updated_count=updated_count,
                    skipped_count=skipped_count,
                    error_count=len(errors),
                )
            raise

    def _normalize_record(
        self,
        raw_record: dict[str, Any],
        lookups: dict[str, dict[str, int]],
    ) -> OrganizationUpsertPayload:
        if not isinstance(raw_record, dict):
            raise RecordValidationError(
                field_name="record",
                error_code="invalid_record",
                message="Organization record must be an object.",
            )

        general = raw_record.get("general") or {}
        classification = raw_record.get("classification") or {}
        if not isinstance(general, dict) or not isinstance(classification, dict):
            raise RecordValidationError(
                field_name="record",
                error_code="invalid_record",
                message="Organization record must contain general and classification objects.",
            )

        location = general.get("location") or {}
        contacts = general.get("contacts") or {}
        if not isinstance(location, dict) or not isinstance(contacts, dict):
            raise RecordValidationError(
                field_name="record",
                error_code="invalid_record",
                message="Organization record has invalid contact or location blocks.",
            )

        trade_name = clean_text(general.get("tradeName"))
        registered_name = clean_text(general.get("registeredName"))
        if trade_name is None and registered_name is None:
            raise RecordValidationError(
                field_name="general",
                error_code="missing_name",
                message="At least one of tradeName or registeredName is required.",
            )

        primary_sector_id = self._resolve_taxonomy(
            lookups,
            taxonomy_name=TaxonomyName.INDUSTRY_SECTORS,
            raw_value=classification.get("primaryIndustrySector"),
            field_name="classification.primaryIndustrySector",
            required=True,
        )
        secondary_sector_ids = self._resolve_many(
            lookups,
            taxonomy_name=TaxonomyName.INDUSTRY_SECTORS,
            raw_values=classification.get("otherIndustrySectors"),
            field_name="classification.otherIndustrySectors",
            max_items=3,
        )
        secondary_sector_ids = [value for value in secondary_sector_ids if value != primary_sector_id]

        environmental_impact_area_ids = self._resolve_many(
            lookups,
            taxonomy_name=TaxonomyName.ENVIRONMENTAL_IMPACT_AREAS,
            raw_values=classification.get("environmentalImpactAreas"),
            field_name="classification.environmentalImpactAreas",
            max_items=4,
        )

        return OrganizationUpsertPayload(
            external_code=clean_text(raw_record.get("id")),
            trade_name=trade_name,
            registered_name=registered_name or trade_name,
            tax_code=normalize_tax_code(general.get("taxCode")),
            founded_year=parse_year(general.get("foundedYear"), field_name="general.foundedYear"),
            operational_status_id=self._resolve_taxonomy(
                lookups,
                taxonomy_name=TaxonomyName.OPERATIONAL_STATUSES,
                raw_value=general.get("operationalStatus"),
                field_name="general.operationalStatus",
                required=True,
            ),
            closed_year=parse_year(general.get("closedYear"), field_name="general.closedYear"),
            organization_type_id=self._resolve_taxonomy(
                lookups,
                taxonomy_name=TaxonomyName.ORGANIZATION_TYPES,
                raw_value=classification.get("organizationType"),
                field_name="classification.organizationType",
                required=True,
            ),
            primary_industry_sector_id=primary_sector_id,
            has_positive_social_impact=parse_bool(
                classification.get("hasPositiveSocialImpact"),
                field_name="classification.hasPositiveSocialImpact",
            ),
            primary_product_type_id=self._resolve_taxonomy(
                lookups,
                taxonomy_name=TaxonomyName.PRODUCT_TYPES,
                raw_value=classification.get("primaryProductType"),
                field_name="classification.primaryProductType",
                required=True,
            ),
            other_product_type_id=self._resolve_taxonomy(
                lookups,
                taxonomy_name=TaxonomyName.PRODUCT_TYPES,
                raw_value=classification.get("otherProductType"),
                field_name="classification.otherProductType",
                required=False,
            ),
            source_status="imported",
            contact=OrganizationContactPayload(
                website=clean_text(contacts.get("website")),
                email=normalize_email(contacts.get("email")),
                phone=normalize_phone(contacts.get("phone")),
            ),
            location=OrganizationLocationPayload(
                province_id=self._resolve_taxonomy(
                    lookups,
                    taxonomy_name=TaxonomyName.PROVINCES,
                    raw_value=location.get("province"),
                    field_name="general.location.province",
                    required=False,
                ),
                ward_name=clean_text(location.get("ward")),
                full_address=None,
                latitude=None,
                longitude=None,
                location_precision="unknown",
                geocode_source=None,
            ),
            secondary_industry_sector_ids=secondary_sector_ids,
            environmental_impact_area_ids=environmental_impact_area_ids,
            raw_payload=raw_record,
        )

    def _resolve_taxonomy(
        self,
        lookups: dict[str, dict[str, int]],
        *,
        taxonomy_name: TaxonomyName,
        raw_value: Any,
        field_name: str,
        required: bool,
    ) -> int | None:
        cleaned_value = clean_text(raw_value)
        if cleaned_value is None:
            if required:
                raise RecordValidationError(
                    field_name=field_name,
                    error_code="missing_taxonomy",
                    message=f"{field_name} is required.",
                )
            return None

        key = normalize_lookup_key(cleaned_value)
        taxonomy_lookup = lookups.get(taxonomy_name.value, {})
        matched_id = taxonomy_lookup.get(key or "")
        if matched_id is None:
            raise RecordValidationError(
                field_name=field_name,
                error_code="unknown_taxonomy_value",
                message=f"{field_name} does not match any seeded {taxonomy_name.value} value: {cleaned_value}",
            )
        return matched_id

    def _resolve_many(
        self,
        lookups: dict[str, dict[str, int]],
        *,
        taxonomy_name: TaxonomyName,
        raw_values: Any,
        field_name: str,
        max_items: int,
    ) -> list[int]:
        if raw_values is None:
            return []
        if not isinstance(raw_values, list):
            raise RecordValidationError(
                field_name=field_name,
                error_code="invalid_array",
                message=f"{field_name} must be an array.",
            )

        items = [clean_text(value) for value in raw_values]
        values = [value for value in items if value is not None]
        if len(values) > max_items:
            raise RecordValidationError(
                field_name=field_name,
                error_code="too_many_items",
                message=f"{field_name} supports at most {max_items} non-empty values.",
            )

        resolved: list[int] = []
        seen: set[int] = set()
        for value in values:
            resolved_value = self._resolve_taxonomy(
                lookups,
                taxonomy_name=taxonomy_name,
                raw_value=value,
                field_name=field_name,
                required=True,
            )
            if resolved_value is not None and resolved_value not in seen:
                resolved.append(resolved_value)
                seen.add(resolved_value)
        return resolved


def summary_to_dict(summary: ImportSummary) -> dict[str, Any]:
    return {
        **asdict(summary),
        "errors": [asdict(error) for error in summary.errors],
    }
