from __future__ import annotations

import json

from backend.domain.organizations.validators import clean_text
from backend.libs.database import PostgreSQLClient

from .schemas import (
    CustomAnalysisCreateRequest,
    CustomAnalysisListParams,
    CustomAnalysisUpdateRequest,
    ReportListParams,
    ReportPayload,
)


class ReportsRepository:
    def __init__(self, db: PostgreSQLClient) -> None:
        self._db = db

    def list_reports(self, params: ReportListParams) -> tuple[list[dict], int]:
        filters = ["status = 'published'"]
        query_params: dict[str, object] = {
            "limit": params.page_size,
            "offset": (params.page - 1) * params.page_size,
        }
        category = clean_text(params.category)
        if category is not None:
            filters.append("category = %(category)s")
            query_params["category"] = category
        where_sql = " AND ".join(filters)
        total_row = self._db.fetch_one(
            f"SELECT COUNT(*) AS total FROM reports WHERE {where_sql}",
            query_params,
        )
        rows = self._db.fetch_all(
            f"""
            SELECT
                id,
                slug,
                title,
                category,
                summary,
                preview_text,
                thumbnail_url,
                status,
                is_premium,
                published_at,
                created_at,
                updated_at
            FROM reports
            WHERE {where_sql}
            ORDER BY published_at DESC NULLS LAST, created_at DESC, id DESC
            LIMIT %(limit)s OFFSET %(offset)s
            """,
            query_params,
        )
        return rows, int(total_row["total"]) if total_row else 0

    def get_report(self, report_id: int) -> dict | None:
        return self._db.fetch_one(
            """
            SELECT
                id,
                slug,
                title,
                category,
                summary,
                description,
                preview_text,
                thumbnail_url,
                storage_path,
                download_url,
                status,
                is_premium,
                metadata,
                published_at,
                created_at,
                updated_at
            FROM reports
            WHERE id = %s
            LIMIT 1
            """,
            (report_id,),
        )

    def get_report_by_slug(self, slug: str) -> dict | None:
        return self._db.fetch_one(
            "SELECT id FROM reports WHERE slug = %s LIMIT 1",
            (slug,),
        )

    def create_report(self, payload: ReportPayload, *, slug: str, user_id: int) -> dict:
        row = self._db.fetch_one(
            """
            INSERT INTO reports (
                slug,
                title,
                category,
                summary,
                description,
                preview_text,
                thumbnail_url,
                storage_path,
                download_url,
                status,
                is_premium,
                metadata,
                created_by_user_id,
                updated_by_user_id,
                published_at
            )
            VALUES (
                %(slug)s,
                %(title)s,
                %(category)s,
                %(summary)s,
                %(description)s,
                %(preview_text)s,
                %(thumbnail_url)s,
                %(storage_path)s,
                %(download_url)s,
                %(status)s,
                %(is_premium)s,
                %(metadata)s::jsonb,
                %(user_id)s,
                %(user_id)s,
                CASE WHEN %(status)s = 'published' THEN NOW() ELSE NULL END
            )
            RETURNING id
            """,
            {
                "slug": slug,
                "title": payload.title,
                "category": payload.category,
                "summary": payload.summary,
                "description": payload.description,
                "preview_text": payload.preview_text,
                "thumbnail_url": payload.thumbnail_url,
                "storage_path": payload.storage_path,
                "download_url": payload.download_url,
                "status": payload.status,
                "is_premium": payload.is_premium,
                "metadata": json.dumps(payload.metadata, ensure_ascii=False),
                "user_id": user_id,
            },
        )
        report_id = int(row["id"])
        self._db.execute(
            """
            INSERT INTO report_access_policies (report_id, role_id, can_download)
            SELECT %s, ur.id, CASE WHEN ur.code IN ('premium', 'admin') THEN TRUE ELSE FALSE END
            FROM user_roles ur
            ON CONFLICT (report_id, role_id) DO NOTHING
            """,
            (report_id,),
        )
        return self.get_report(report_id)

    def role_can_download_report(self, report_id: int, role_code: str) -> bool:
        row = self._db.fetch_one(
            """
            SELECT rap.can_download
            FROM report_access_policies rap
            JOIN user_roles ur ON ur.id = rap.role_id
            WHERE rap.report_id = %s
              AND ur.code = %s
            LIMIT 1
            """,
            (report_id, role_code),
        )
        return bool(row["can_download"]) if row is not None else False

    def log_download(self, report_id: int, *, user_id: int | None, requester_email: str | None, ip_address: str | None) -> None:
        self._db.execute(
            """
            INSERT INTO report_download_logs (report_id, user_id, requester_email, ip_address)
            VALUES (%s, %s, %s, %s)
            """,
            (report_id, user_id, requester_email, ip_address),
        )

    def create_custom_request(
        self,
        payload: CustomAnalysisCreateRequest,
        *,
        requested_by_user_id: int | None,
        organization_id: int | None,
    ) -> int:
        row = self._db.fetch_one(
            """
            INSERT INTO custom_analysis_requests (
                requested_by_user_id,
                organization_id,
                requester_name,
                requester_email,
                requester_phone,
                subject,
                request_type,
                brief,
                attachment_count,
                desired_due_date,
                metadata
            )
            VALUES (
                %(requested_by_user_id)s,
                %(organization_id)s,
                %(requester_name)s,
                %(requester_email)s,
                %(requester_phone)s,
                %(subject)s,
                %(request_type)s,
                %(brief)s,
                %(attachment_count)s,
                %(desired_due_date)s,
                %(metadata)s::jsonb
            )
            RETURNING id
            """,
            {
                "requested_by_user_id": requested_by_user_id,
                "organization_id": organization_id,
                "requester_name": payload.requester_name,
                "requester_email": payload.requester_email,
                "requester_phone": payload.requester_phone,
                "subject": payload.subject,
                "request_type": payload.request_type,
                "brief": payload.brief,
                "attachment_count": len(payload.attachments),
                "desired_due_date": payload.desired_due_date,
                "metadata": json.dumps(payload.metadata, ensure_ascii=False),
            },
        )
        request_id = int(row["id"])
        for attachment in payload.attachments:
            data = attachment.model_dump(mode="json")
            self._db.execute(
                """
                INSERT INTO custom_analysis_attachments (
                    request_id,
                    title,
                    file_name,
                    file_url,
                    storage_path,
                    metadata
                )
                VALUES (%(request_id)s, %(title)s, %(file_name)s, %(file_url)s, %(storage_path)s, %(metadata)s::jsonb)
                """,
                {
                    "request_id": request_id,
                    "title": data.get("title"),
                    "file_name": data.get("file_name"),
                    "file_url": data.get("file_url"),
                    "storage_path": data.get("storage_path"),
                    "metadata": json.dumps(data.get("metadata") or {}, ensure_ascii=False),
                },
            )
        self._db.execute(
            """
            INSERT INTO custom_analysis_status_history (
                request_id,
                previous_status,
                new_status,
                note,
                metadata
            )
            VALUES (%s, NULL, 'submitted', NULL, '{}'::jsonb)
            """,
            (request_id,),
        )
        return request_id

    def get_custom_request(self, request_id: int) -> dict | None:
        return self._db.fetch_one(
            """
            SELECT
                id,
                requester_name,
                requester_email,
                requester_phone,
                subject,
                request_type,
                brief,
                status,
                attachment_count,
                desired_due_date,
                admin_notes,
                quote_amount,
                quote_currency,
                created_at,
                updated_at
            FROM custom_analysis_requests
            WHERE id = %s
            LIMIT 1
            """,
            (request_id,),
        )

    def list_custom_requests(self, params: CustomAnalysisListParams) -> tuple[list[dict], int]:
        filters = ["1 = 1"]
        query_params: dict[str, object] = {
            "limit": params.page_size,
            "offset": (params.page - 1) * params.page_size,
        }
        status = clean_text(params.status)
        if status is not None:
            filters.append("status = %(status)s")
            query_params["status"] = status
        where_sql = " AND ".join(filters)
        total_row = self._db.fetch_one(
            f"SELECT COUNT(*) AS total FROM custom_analysis_requests WHERE {where_sql}",
            query_params,
        )
        rows = self._db.fetch_all(
            f"""
            SELECT
                id,
                requester_name,
                requester_email,
                requester_phone,
                subject,
                request_type,
                brief,
                status,
                attachment_count,
                desired_due_date,
                admin_notes,
                quote_amount,
                quote_currency,
                created_at,
                updated_at
            FROM custom_analysis_requests
            WHERE {where_sql}
            ORDER BY created_at DESC, id DESC
            LIMIT %(limit)s OFFSET %(offset)s
            """,
            query_params,
        )
        return rows, int(total_row["total"]) if total_row else 0

    def update_custom_request(self, request_id: int, payload: CustomAnalysisUpdateRequest, *, user_id: int) -> dict | None:
        existing = self._db.fetch_one(
            "SELECT status FROM custom_analysis_requests WHERE id = %s LIMIT 1",
            (request_id,),
        )
        if existing is None:
            return None
        self._db.execute(
            """
            UPDATE custom_analysis_requests
            SET
                status = %(status)s,
                admin_notes = %(admin_notes)s,
                quote_amount = %(quote_amount)s,
                quote_currency = %(quote_currency)s
            WHERE id = %(request_id)s
            """,
            {
                "request_id": request_id,
                "status": payload.status,
                "admin_notes": payload.admin_notes,
                "quote_amount": payload.quote_amount,
                "quote_currency": payload.quote_currency,
            },
        )
        self._db.execute(
            """
            INSERT INTO custom_analysis_status_history (
                request_id,
                previous_status,
                new_status,
                changed_by_user_id,
                note,
                metadata
            )
            VALUES (%s, %s, %s, %s, %s, '{}'::jsonb)
            """,
            (
                request_id,
                existing["status"],
                payload.status,
                user_id,
                payload.note,
            ),
        )
        return self.get_custom_request(request_id)
