from __future__ import annotations

from datetime import datetime
import json

from backend.domain.organizations.validators import clean_text
from backend.libs.database import PostgreSQLClient

from .schemas import CertificationApplyRequest, CertificationDirectoryParams, CertificationUpgradeRequest


def _taxonomy_json(alias: str) -> str:
    return (
        f"CASE WHEN {alias}.id IS NULL THEN NULL "
        f"ELSE jsonb_build_object('id', {alias}.id, 'code', {alias}.code, 'display_name', {alias}.display_name) END"
    )


class CertificationRepository:
    def __init__(self, db: PostgreSQLClient) -> None:
        self._db = db

    def get_certification_level_by_code(self, code: str) -> dict | None:
        return self._db.fetch_one(
            """
            SELECT id, code, display_name
            FROM certification_levels
            WHERE code = %s
            LIMIT 1
            """,
            (code,),
        )

    def list_directory(self, params: CertificationDirectoryParams) -> tuple[list[dict], int]:
        filters = ["c.directory_visible IS TRUE", "c.status = 'active'"]
        query_params: dict[str, object] = {
            "limit": params.page_size,
            "offset": (params.page - 1) * params.page_size,
        }
        if clean_text(params.province):
            filters.append("p.code = %(province)s")
            query_params["province"] = clean_text(params.province)
        if clean_text(params.organization_type):
            filters.append("ot.code = %(organization_type)s")
            query_params["organization_type"] = clean_text(params.organization_type)
        if clean_text(params.primary_industry_sector):
            filters.append("pis.code = %(primary_industry_sector)s")
            query_params["primary_industry_sector"] = clean_text(params.primary_industry_sector)
        if clean_text(params.certification_level):
            filters.append("cl.code = %(certification_level)s")
            query_params["certification_level"] = clean_text(params.certification_level)
        where_sql = " AND ".join(filters)

        total_row = self._db.fetch_one(
            f"""
            SELECT COUNT(*) AS total
            FROM certifications c
            JOIN organizations o ON o.id = c.organization_id
            LEFT JOIN organization_locations ol ON ol.organization_id = o.id
            LEFT JOIN provinces p ON p.id = ol.province_id
            LEFT JOIN organization_types ot ON ot.id = o.organization_type_id
            LEFT JOIN industry_sectors pis ON pis.id = o.primary_industry_sector_id
            LEFT JOIN certification_levels cl ON cl.id = c.level_id
            WHERE {where_sql}
            """,
            query_params,
        )
        rows = self._db.fetch_all(
            f"""
            SELECT
                o.id AS organization_id,
                o.external_code,
                coalesce(o.trade_name, o.registered_name) AS display_name,
                {_taxonomy_json("p")} AS province,
                {_taxonomy_json("ot")} AS organization_type,
                {_taxonomy_json("pis")} AS primary_industry_sector,
                {_taxonomy_json("cl")} AS certification_level,
                c.status AS certification_status,
                c.issued_at,
                c.expires_at,
                c.directory_visible
            FROM certifications c
            JOIN organizations o ON o.id = c.organization_id
            LEFT JOIN organization_locations ol ON ol.organization_id = o.id
            LEFT JOIN provinces p ON p.id = ol.province_id
            LEFT JOIN organization_types ot ON ot.id = o.organization_type_id
            LEFT JOIN industry_sectors pis ON pis.id = o.primary_industry_sector_id
            LEFT JOIN certification_levels cl ON cl.id = c.level_id
            WHERE {where_sql}
            ORDER BY c.issued_at DESC NULLS LAST, o.updated_at DESC, o.id DESC
            LIMIT %(limit)s OFFSET %(offset)s
            """,
            query_params,
            )
        return rows, int(total_row["total"]) if total_row else 0

    def get_current_certification(self, organization_id: int) -> dict | None:
        return self._db.fetch_one(
            f"""
            SELECT
                c.id,
                {_taxonomy_json("cl")} AS certification_level,
                c.status,
                c.directory_visible,
                c.issued_at,
                c.expires_at,
                c.public_note
            FROM certifications c
            LEFT JOIN certification_levels cl ON cl.id = c.level_id
            WHERE c.organization_id = %s
            LIMIT 1
            """,
            (organization_id,),
        )

    def list_applications(self, organization_id: int) -> list[dict]:
        return self._db.fetch_all(
            f"""
            SELECT
                ca.id,
                {_taxonomy_json("cl")} AS requested_level,
                ca.status,
                ca.application_note,
                ca.review_note,
                ca.submitted_at,
                ca.decided_at
            FROM certification_applications ca
            LEFT JOIN certification_levels cl ON cl.id = ca.requested_level_id
            WHERE ca.organization_id = %s
            ORDER BY ca.submitted_at DESC, ca.id DESC
            """,
            (organization_id,),
        )

    def list_documents_by_application_ids(self, application_ids: list[int]) -> list[dict]:
        if not application_ids:
            return []
        return self._db.fetch_all(
            """
            SELECT
                id,
                application_id,
                document_type,
                title,
                file_name,
                file_url,
                storage_path,
                created_at
            FROM certification_documents
            WHERE application_id = ANY(%s)
            ORDER BY application_id ASC, id ASC
            """,
            (application_ids,),
        )

    def create_application(
        self,
        *,
        organization_id: int,
        applicant_user_id: int,
        requested_level_id: int | None,
        application_note: str | None,
        metadata: dict,
    ) -> int:
        row = self._db.fetch_one(
            """
            INSERT INTO certification_applications (
                organization_id,
                applicant_user_id,
                requested_level_id,
                status,
                application_note,
                metadata,
                submitted_at
            )
            VALUES (%s, %s, %s, 'submitted', %s, %s, NOW())
            RETURNING id
            """,
            (
                organization_id,
                applicant_user_id,
                requested_level_id,
                application_note,
                json.dumps(metadata, ensure_ascii=False),
            ),
        )
        return int(row["id"])

    def add_documents(self, application_id: int, documents: list[dict]) -> None:
        for document in documents:
            self._db.execute(
                """
                INSERT INTO certification_documents (
                    application_id,
                    document_type,
                    title,
                    file_name,
                    file_url,
                    storage_path,
                    metadata
                )
                VALUES (%(application_id)s, %(document_type)s, %(title)s, %(file_name)s, %(file_url)s, %(storage_path)s, %(metadata)s::jsonb)
                """,
                {
                    "application_id": application_id,
                    "document_type": document["document_type"],
                    "title": document["title"],
                    "file_name": document.get("file_name"),
                    "file_url": document.get("file_url"),
                    "storage_path": document.get("storage_path"),
                    "metadata": json.dumps(document.get("metadata") or {}, ensure_ascii=False),
                },
            )

    def get_application(self, application_id: int) -> dict | None:
        return self._db.fetch_one(
            """
            SELECT id, organization_id, requested_level_id, status
            FROM certification_applications
            WHERE id = %s
            LIMIT 1
            """,
            (application_id,),
        )

    def review_application(
        self,
        *,
        application_id: int,
        action: str,
        status_after: str,
        reviewer_user_id: int,
        comment: str | None,
        public_note: str | None,
    ) -> None:
        self._db.execute(
            """
            INSERT INTO certification_reviews (
                application_id,
                reviewer_user_id,
                action,
                status_after,
                comment
            )
            VALUES (%s, %s, %s, %s, %s)
            """,
            (application_id, reviewer_user_id, action, status_after, comment),
        )
        self._db.execute(
            """
            UPDATE certification_applications
            SET
                status = %(status_after)s,
                review_note = %(comment)s,
                decided_at = CASE
                    WHEN %(status_after)s IN ('approved', 'rejected') THEN NOW()
                    ELSE decided_at
                END,
                updated_at = NOW()
            WHERE id = %(application_id)s
            """,
            {
                "application_id": application_id,
                "status_after": status_after,
                "comment": comment,
            },
        )

        application = self.get_application(application_id)
        if application is None:
            return
        if status_after != "approved":
            return

        current = self.get_current_certification(int(application["organization_id"]))
        level_id = application.get("requested_level_id")
        if current is None:
            row = self._db.fetch_one(
                """
                INSERT INTO certifications (
                    organization_id,
                    application_id,
                    level_id,
                    status,
                    directory_visible,
                    issued_at,
                    public_note
                )
                VALUES (%s, %s, %s, 'active', TRUE, NOW(), %s)
                RETURNING id
                """,
                (
                    application["organization_id"],
                    application_id,
                    level_id,
                    public_note,
                ),
            )
            certification_id = int(row["id"])
            previous_level_id = None
            previous_status = None
        else:
            certification_id = int(current["id"])
            previous_level = current.get("certification_level")
            previous_level_id = previous_level["id"] if previous_level else None
            previous_status = current["status"]
            self._db.execute(
                """
                UPDATE certifications
                SET
                    application_id = %(application_id)s,
                    level_id = %(level_id)s,
                    status = 'active',
                    directory_visible = TRUE,
                    issued_at = coalesce(issued_at, NOW()),
                    public_note = %(public_note)s
                WHERE id = %(certification_id)s
                """,
                {
                    "application_id": application_id,
                    "level_id": level_id,
                    "public_note": public_note,
                    "certification_id": certification_id,
                },
            )

        self._db.execute(
            """
            INSERT INTO certification_status_history (
                certification_id,
                previous_level_id,
                new_level_id,
                previous_status,
                new_status,
                changed_by_user_id,
                reason
            )
            VALUES (%s, %s, %s, %s, 'active', %s, %s)
            """,
            (
                certification_id,
                previous_level_id,
                level_id,
                previous_status,
                reviewer_user_id,
                comment,
            ),
        )

    def get_certification_by_id(self, certification_id: int) -> dict | None:
        return self._db.fetch_one(
            """
            SELECT id, organization_id, status
            FROM certifications
            WHERE id = %s
            LIMIT 1
            """,
            (certification_id,),
        )

    def upgrade_certification(
        self,
        *,
        certification_id: int,
        level_id: int,
        status: str,
        directory_visible: bool,
        public_note: str | None,
        expires_at: datetime | None,
        changed_by_user_id: int,
        reason: str | None,
    ) -> None:
        current = self.get_current_certification_by_certification_id(certification_id)
        if current is None:
            return
        previous_level = current.get("certification_level")
        previous_status = current["status"]
        self._db.execute(
            """
            UPDATE certifications
            SET
                level_id = %(level_id)s,
                status = %(status)s,
                directory_visible = %(directory_visible)s,
                public_note = %(public_note)s,
                expires_at = %(expires_at)s,
                upgraded_at = NOW()
            WHERE id = %(certification_id)s
            """,
            {
                "certification_id": certification_id,
                "level_id": level_id,
                "status": status,
                "directory_visible": directory_visible,
                "public_note": public_note,
                "expires_at": expires_at,
            },
        )
        self._db.execute(
            """
            INSERT INTO certification_status_history (
                certification_id,
                previous_level_id,
                new_level_id,
                previous_status,
                new_status,
                changed_by_user_id,
                reason
            )
            VALUES (%s, %s, %s, %s, %s, %s, %s)
            """,
            (
                certification_id,
                previous_level["id"] if previous_level else None,
                level_id,
                previous_status,
                status,
                changed_by_user_id,
                reason,
            ),
        )

    def get_current_certification_by_certification_id(self, certification_id: int) -> dict | None:
        return self._db.fetch_one(
            f"""
            SELECT
                c.id,
                c.organization_id,
                {_taxonomy_json("cl")} AS certification_level,
                c.status,
                c.directory_visible,
                c.issued_at,
                c.expires_at,
                c.public_note
            FROM certifications c
            LEFT JOIN certification_levels cl ON cl.id = c.level_id
            WHERE c.id = %s
            LIMIT 1
            """,
            (certification_id,),
        )
