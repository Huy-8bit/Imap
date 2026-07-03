from __future__ import annotations

from datetime import UTC, datetime
from typing import Any

from backend.libs.database import PostgreSQLClient, write_audit_log


class OrgAdminRepository:
    def __init__(self, db: PostgreSQLClient) -> None:
        self._db = db

    def get_org_score(self, org_id: int) -> float | None:
        row = self._db.fetch_one(
            "SELECT ai_composite_score FROM organizations WHERE id = %s",
            (org_id,),
        )
        if row is None:
            return None
        val = row.get("ai_composite_score")
        return float(val) if val is not None else None

    def override_score(
        self,
        org_id: int,
        new_score: float,
        *,
        actor_id: int,
        actor_role: str,
        actor_email: str,
        reason: str,
        session_id: str | None = None,
    ) -> tuple[float | None, int]:
        """UPDATE ai_composite_score và ghi audit_log trong cùng transaction."""
        old_score = self.get_org_score(org_id)
        with self._db.cursor() as cursor:
            cursor.execute(
                """
                UPDATE organizations
                SET ai_composite_score = %s
                WHERE id = %s
                RETURNING id
                """,
                (new_score, org_id),
            )
            if cursor.fetchone() is None:
                from backend.libs.http.errors import NotFoundError
                raise NotFoundError("organization not found")

            audit_id = write_audit_log(
                cursor,
                event_type="SCORE_ADJUSTED",
                actor_id=actor_id,
                actor_role=actor_role,
                actor_email=actor_email,
                org_id=org_id,
                entity_type="organization",
                entity_id=org_id,
                old_value={"ai_composite_score": old_score},
                new_value={"ai_composite_score": new_score},
                reason=reason,
                session_id=session_id,
            )
        return old_score, audit_id

    def issue_certification(
        self,
        org_id: int,
        star_rating: int,
        *,
        certified_at: datetime | None,
        expires_at: datetime | None,
        actor_id: int,
        actor_role: str,
        actor_email: str,
        notes: str | None,
        session_id: str | None = None,
        pending_second_approval: bool = False,
    ) -> tuple[str, int | None]:
        """UPDATE organizations cert fields + upsert certifications.

        Returns (status_string, audit_id) — audit_id là None khi pending_second_approval.
        """
        now = datetime.now(UTC)
        cert_status = "pending_second_approval" if pending_second_approval else "active"
        org_status = "registered" if pending_second_approval else "certified"

        with self._db.cursor() as cursor:
            cursor.execute(
                """
                UPDATE organizations
                SET status = %s::org_status,
                    star_rating = %s,
                    certified_at = CASE WHEN %s THEN %s ELSE certified_at END,
                    expires_at = CASE WHEN %s THEN %s ELSE expires_at END
                WHERE id = %s
                RETURNING id
                """,
                (
                    org_status,
                    star_rating,
                    not pending_second_approval,
                    certified_at or now,
                    not pending_second_approval,
                    expires_at,
                    org_id,
                ),
            )
            if cursor.fetchone() is None:
                from backend.libs.http.errors import NotFoundError
                raise NotFoundError("organization not found")

            cursor.execute(
                """
                INSERT INTO certifications (
                    organization_id, status, issued_at, expires_at,
                    directory_visible, public_note, first_approver_id
                )
                VALUES (%s, %s, %s, %s, %s, %s, %s)
                ON CONFLICT (organization_id) DO UPDATE
                    SET status = EXCLUDED.status,
                        issued_at = EXCLUDED.issued_at,
                        expires_at = EXCLUDED.expires_at,
                        directory_visible = EXCLUDED.directory_visible,
                        public_note = EXCLUDED.public_note,
                        first_approver_id = EXCLUDED.first_approver_id,
                        second_approver_id = NULL,
                        updated_at = NOW()
                """,
                (
                    org_id,
                    cert_status,
                    certified_at or now,
                    expires_at,
                    not pending_second_approval,
                    notes,
                    actor_id,
                ),
            )

            if pending_second_approval:
                return cert_status, None

            audit_id = write_audit_log(
                cursor,
                event_type="CERT_ISSUED",
                actor_id=actor_id,
                actor_role=actor_role,
                actor_email=actor_email,
                org_id=org_id,
                entity_type="certification",
                entity_id=org_id,
                new_value={"star_rating": star_rating, "certified_at": str(certified_at or now)},
                reason=notes,
                session_id=session_id,
            )
        return "certified", audit_id

    def approve_second_certification(
        self,
        org_id: int,
        *,
        actor_id: int,
        actor_role: str,
        actor_email: str,
        session_id: str | None = None,
    ) -> int:
        """Second approver hoàn tất cert ★★★★★ — validate actor khác first_approver."""
        with self._db.cursor() as cursor:
            cursor.execute(
                """
                SELECT id, first_approver_id
                FROM certifications
                WHERE organization_id = %s
                  AND status = 'pending_second_approval'
                LIMIT 1
                """,
                (org_id,),
            )
            row = cursor.fetchone()
            if row is None:
                from backend.libs.http.errors import AppError
                raise AppError("no pending second approval found", status_code=404)

            if int(row["first_approver_id"]) == actor_id:
                from backend.libs.http.errors import AppError
                raise AppError(
                    "second approver must be different from first approver",
                    status_code=409,
                )

            cursor.execute(
                """
                UPDATE certifications
                SET status = 'active',
                    directory_visible = TRUE,
                    second_approver_id = %s,
                    updated_at = NOW()
                WHERE organization_id = %s
                  AND status = 'pending_second_approval'
                """,
                (actor_id, org_id),
            )
            cursor.execute(
                "UPDATE organizations SET status = 'certified' WHERE id = %s",
                (org_id,),
            )
            audit_id = write_audit_log(
                cursor,
                event_type="CERT_ISSUED",
                actor_id=actor_id,
                actor_role=actor_role,
                actor_email=actor_email,
                org_id=org_id,
                entity_type="certification",
                entity_id=org_id,
                new_value={"two_person_rule_completed": True, "second_approver_id": actor_id},
                session_id=session_id,
            )
        return audit_id

    def list_pending_certifications(self, *, limit: int = 100) -> list[dict[str, Any]]:
        return self._db.fetch_all(
            """
            SELECT id, organization_id AS org_id, status, submitted_at
            FROM certification_applications
            WHERE status IN ('submitted', 'in_review')
            ORDER BY submitted_at ASC
            LIMIT %s
            """,
            (limit,),
        )
