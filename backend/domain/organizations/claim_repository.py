from __future__ import annotations

from typing import Any

from backend.libs.database import PostgreSQLClient


class OrgClaimRepository:
    def __init__(self, db: PostgreSQLClient) -> None:
        self._db = db

    def get_existing_active_claim(self, org_id: int, user_id: int) -> dict | None:
        return self._db.fetch_one(
            """
            SELECT id, org_id, user_id, status, submitted_at, verified_at, reviewed_at, reviewer_note
            FROM org_claims
            WHERE org_id = %s
              AND user_id = %s
              AND status NOT IN ('rejected', 'expired')
            ORDER BY id DESC
            LIMIT 1
            """,
            (org_id, user_id),
        )

    def create_claim(self, org_id: int, user_id: int) -> dict:
        row = self._db.fetch_one(
            """
            INSERT INTO org_claims (org_id, user_id, status)
            VALUES (%s, %s, 'pending_verification')
            ON CONFLICT (org_id, user_id) DO UPDATE
                SET status = 'pending_verification',
                    email_token = NULL,
                    email_token_expires = NULL,
                    verified_at = NULL,
                    reviewed_at = NULL,
                    reviewer_note = NULL,
                    updated_at = NOW()
            RETURNING id, org_id, user_id, status, submitted_at, verified_at, reviewed_at, reviewer_note
            """,
            (org_id, user_id),
        )
        if row is None:
            raise RuntimeError("failed to create org claim")
        return row

    def verify_claim(self, claim_id: int) -> bool:
        row = self._db.fetch_one(
            """
            UPDATE org_claims
            SET status = 'pending_review',
                verified_at = NOW(),
                email_token = NULL,
                email_token_expires = NULL
            WHERE id = %s
              AND status = 'pending_verification'
            RETURNING id
            """,
            (claim_id,),
        )
        return row is not None

    def approve_claim(self, claim_id: int, reviewer_id: int, note: str | None) -> bool:
        row = self._db.fetch_one(
            """
            UPDATE org_claims
            SET status = 'approved',
                reviewed_at = NOW(),
                reviewer_id = %s,
                reviewer_note = %s
            WHERE id = %s
              AND status = 'pending_review'
            RETURNING id
            """,
            (reviewer_id, note, claim_id),
        )
        return row is not None

    def reject_claim(self, claim_id: int, reviewer_id: int, note: str | None) -> bool:
        row = self._db.fetch_one(
            """
            UPDATE org_claims
            SET status = 'rejected',
                reviewed_at = NOW(),
                reviewer_id = %s,
                reviewer_note = %s
            WHERE id = %s
              AND status IN ('pending_verification', 'pending_review')
            RETURNING id
            """,
            (reviewer_id, note, claim_id),
        )
        return row is not None

    def list_pending_claims(self, *, limit: int = 100) -> list[dict[str, Any]]:
        return self._db.fetch_all(
            """
            SELECT id, org_id, user_id, status, submitted_at
            FROM org_claims
            WHERE status IN ('pending_verification', 'pending_review')
            ORDER BY submitted_at ASC
            LIMIT %s
            """,
            (limit,),
        )
