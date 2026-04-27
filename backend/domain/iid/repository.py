from __future__ import annotations

import json

from backend.libs.database import PostgreSQLClient

from .schemas import IidAboutPayload

ABOUT_PAGE_SLUG = "iid_about"


class IidRepository:
    def __init__(self, db: PostgreSQLClient) -> None:
        self._db = db

    def get_about_page(self) -> dict | None:
        return self._db.fetch_one(
            """
            SELECT slug, title, summary, body, status, updated_at
            FROM cms_pages
            WHERE slug = %s
            LIMIT 1
            """,
            (ABOUT_PAGE_SLUG,),
        )

    def upsert_about_page(self, payload: IidAboutPayload, *, user_id: int) -> dict:
        existing = self.get_about_page()
        if existing is None:
            self._db.execute(
                """
                INSERT INTO cms_pages (
                    slug,
                    title,
                    summary,
                    body,
                    status,
                    metadata,
                    created_by_user_id,
                    updated_by_user_id,
                    published_at
                )
                VALUES (
                    %(slug)s,
                    %(title)s,
                    %(summary)s,
                    %(body)s,
                    %(status)s,
                    %(metadata)s::jsonb,
                    %(user_id)s,
                    %(user_id)s,
                    CASE WHEN %(status)s = 'published' THEN NOW() ELSE NULL END
                )
                """,
                {
                    "slug": ABOUT_PAGE_SLUG,
                    "title": payload.title,
                    "summary": payload.summary,
                    "body": payload.body,
                    "status": payload.status,
                    "metadata": json.dumps(payload.metadata, ensure_ascii=False),
                    "user_id": user_id,
                },
            )
        else:
            self._db.execute(
                """
                UPDATE cms_pages
                SET
                    title = %(title)s,
                    summary = %(summary)s,
                    body = %(body)s,
                    status = %(status)s,
                    metadata = %(metadata)s::jsonb,
                    updated_by_user_id = %(user_id)s,
                    published_at = CASE
                        WHEN %(status)s = 'published' THEN coalesce(published_at, NOW())
                        ELSE published_at
                    END
                WHERE slug = %(slug)s
                """,
                {
                    "slug": ABOUT_PAGE_SLUG,
                    "title": payload.title,
                    "summary": payload.summary,
                    "body": payload.body,
                    "status": payload.status,
                    "metadata": json.dumps(payload.metadata, ensure_ascii=False),
                    "user_id": user_id,
                },
            )
        return self.get_about_page()

    def list_team_members(self) -> list[dict]:
        return self._db.fetch_all(
            """
            SELECT
                id,
                full_name,
                role_title,
                biography,
                avatar_url,
                website,
                email,
                sort_order
            FROM iid_team_members
            WHERE is_active IS TRUE
            ORDER BY sort_order ASC, id ASC
            """
        )

    def list_partners(self) -> list[dict]:
        return self._db.fetch_all(
            """
            SELECT
                id,
                name,
                partner_type,
                description,
                logo_url,
                website,
                sort_order
            FROM iid_partners
            WHERE is_active IS TRUE
            ORDER BY sort_order ASC, id ASC
            """
        )
