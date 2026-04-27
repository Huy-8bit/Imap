from __future__ import annotations

from datetime import datetime
from typing import Any

from backend.libs.database import PostgreSQLClient


USER_CONTEXT_SQL = """
SELECT
    u.id,
    u.email,
    u.full_name,
    ur.code AS role_code,
    u.status,
    u.last_login_at,
    u.created_at,
    CASE
        WHEN oul.id IS NULL THEN NULL
        ELSE jsonb_build_object(
            'id', o.id,
            'external_code', o.external_code,
            'display_name', coalesce(o.trade_name, o.registered_name),
            'tax_code', coalesce(o.tax_code, oul.linked_tax_code),
            'link_status', oul.status
        )
    END AS organization
FROM users u
JOIN user_roles ur ON ur.id = u.role_id
LEFT JOIN LATERAL (
    SELECT *
    FROM organization_user_links x
    WHERE x.user_id = u.id
      AND x.status IN ('active', 'pending')
    ORDER BY CASE WHEN x.status = 'active' THEN 0 ELSE 1 END, x.id ASC
    LIMIT 1
) oul ON TRUE
LEFT JOIN organizations o ON o.id = oul.organization_id
"""


class AuthRepository:
    def __init__(self, db: PostgreSQLClient) -> None:
        self._db = db

    def get_role_by_code(self, code: str) -> dict[str, Any] | None:
        return self._db.fetch_one(
            """
            SELECT id, code, display_name
            FROM user_roles
            WHERE code = %s
            LIMIT 1
            """,
            (code,),
        )

    def get_user_context_by_email(self, email: str) -> dict[str, Any] | None:
        return self._db.fetch_one(
            f"""
            {USER_CONTEXT_SQL}
            WHERE lower(u.email) = lower(%s)
            LIMIT 1
            """,
            (email,),
        )

    def get_user_context_by_id(self, user_id: int) -> dict[str, Any] | None:
        return self._db.fetch_one(
            f"""
            {USER_CONTEXT_SQL}
            WHERE u.id = %s
            LIMIT 1
            """,
            (user_id,),
        )

    def get_user_auth_row_by_email(self, email: str) -> dict[str, Any] | None:
        return self._db.fetch_one(
            """
            SELECT id, email, password_hash, status
            FROM users
            WHERE lower(email) = lower(%s)
            LIMIT 1
            """,
            (email,),
        )

    def create_user(
        self,
        *,
        email: str,
        password_hash: str,
        full_name: str | None,
        role_id: int,
    ) -> int:
        row = self._db.fetch_one(
            """
            INSERT INTO users (
                email,
                password_hash,
                full_name,
                role_id
            )
            VALUES (%(email)s, %(password_hash)s, %(full_name)s, %(role_id)s)
            RETURNING id
            """,
            {
                "email": email,
                "password_hash": password_hash,
                "full_name": full_name,
                "role_id": role_id,
            },
        )
        if row is None:
            raise RuntimeError("failed to create user")
        return int(row["id"])

    def touch_last_login(self, user_id: int) -> None:
        self._db.execute(
            """
            UPDATE users
            SET last_login_at = NOW()
            WHERE id = %s
            """,
            (user_id,),
        )

    def find_organization_by_tax_code(self, tax_code: str) -> dict[str, Any] | None:
        return self._db.fetch_one(
            """
            SELECT id, external_code, trade_name, registered_name, tax_code
            FROM organizations
            WHERE tax_code = %s
            LIMIT 1
            """,
            (tax_code,),
        )

    def upsert_organization_link(
        self,
        *,
        user_id: int,
        organization_id: int | None,
        linked_tax_code: str | None,
        status: str,
        relationship_type: str = "owner",
    ) -> None:
        existing = self._db.fetch_one(
            """
            SELECT id
            FROM organization_user_links
            WHERE user_id = %s
            LIMIT 1
            """,
            (user_id,),
        )
        if existing is None:
            self._db.execute(
                """
                INSERT INTO organization_user_links (
                    user_id,
                    organization_id,
                    linked_tax_code,
                    relationship_type,
                    status
                )
                VALUES (%(user_id)s, %(organization_id)s, %(linked_tax_code)s, %(relationship_type)s, %(status)s)
                """,
                {
                    "user_id": user_id,
                    "organization_id": organization_id,
                    "linked_tax_code": linked_tax_code,
                    "relationship_type": relationship_type,
                    "status": status,
                },
            )
            return

        self._db.execute(
            """
            UPDATE organization_user_links
            SET
                organization_id = %(organization_id)s,
                linked_tax_code = %(linked_tax_code)s,
                relationship_type = %(relationship_type)s,
                status = %(status)s
            WHERE id = %(id)s
            """,
            {
                "id": existing["id"],
                "organization_id": organization_id,
                "linked_tax_code": linked_tax_code,
                "relationship_type": relationship_type,
                "status": status,
            },
        )

    def create_session(
        self,
        *,
        session_id: str,
        user_id: int,
        refresh_token_hash: str,
        expires_at: datetime,
        user_agent: str | None,
        ip_address: str | None,
    ) -> None:
        self._db.execute(
            """
            INSERT INTO user_sessions (
                session_id,
                user_id,
                refresh_token_hash,
                user_agent,
                ip_address,
                expires_at,
                last_used_at
            )
            VALUES (
                %(session_id)s,
                %(user_id)s,
                %(refresh_token_hash)s,
                %(user_agent)s,
                %(ip_address)s,
                %(expires_at)s,
                NOW()
            )
            """,
            {
                "session_id": session_id,
                "user_id": user_id,
                "refresh_token_hash": refresh_token_hash,
                "user_agent": user_agent,
                "ip_address": ip_address,
                "expires_at": expires_at,
            },
        )

    def get_session(self, session_id: str) -> dict[str, Any] | None:
        return self._db.fetch_one(
            """
            SELECT id, session_id, user_id, refresh_token_hash, status, expires_at, revoked_at
            FROM user_sessions
            WHERE session_id = %s
            LIMIT 1
            """,
            (session_id,),
        )

    def mark_session_used(self, session_id: str) -> None:
        self._db.execute(
            """
            UPDATE user_sessions
            SET last_used_at = NOW()
            WHERE session_id = %s
            """,
            (session_id,),
        )

    def revoke_session(self, session_id: str) -> None:
        self._db.execute(
            """
            UPDATE user_sessions
            SET status = 'revoked', revoked_at = NOW()
            WHERE session_id = %s
            """,
            (session_id,),
        )

    def create_default_report_access_policies(self, report_id: int) -> None:
        self._db.execute(
            """
            INSERT INTO report_access_policies (report_id, role_id, can_download)
            SELECT %s, ur.id, CASE WHEN ur.code IN ('premium', 'admin') THEN TRUE ELSE FALSE END
            FROM user_roles ur
            ON CONFLICT (report_id, role_id) DO NOTHING
            """,
            (report_id,),
        )
