from __future__ import annotations

import json

from backend.libs.database import PostgreSQLClient

from .schemas import NewsArticlePayload, NewsListParams


class NewsRepository:
    def __init__(self, db: PostgreSQLClient) -> None:
        self._db = db

    def list_news(self, params: NewsListParams) -> tuple[list[dict], int]:
        filters = ["status = 'published'"]
        query_params: dict[str, object] = {
            "limit": params.page_size,
            "offset": (params.page - 1) * params.page_size,
        }
        if params.tag:
            filters.append("%(tag)s = ANY(tags)")
            query_params["tag"] = params.tag

        where_sql = " AND ".join(filters)
        total_row = self._db.fetch_one(
            f"SELECT COUNT(*) AS total FROM news_articles WHERE {where_sql}",
            query_params,
        )
        rows = self._db.fetch_all(
            f"""
            SELECT
                id,
                slug,
                title,
                summary,
                body,
                cover_image_url,
                tags,
                status,
                published_at,
                created_at,
                updated_at
            FROM news_articles
            WHERE {where_sql}
            ORDER BY published_at DESC NULLS LAST, created_at DESC, id DESC
            LIMIT %(limit)s OFFSET %(offset)s
            """,
            query_params,
        )
        return rows, int(total_row["total"]) if total_row else 0

    def get_article(self, article_id: int) -> dict | None:
        return self._db.fetch_one(
            """
            SELECT
                id,
                slug,
                title,
                summary,
                body,
                cover_image_url,
                tags,
                status,
                published_at,
                created_at,
                updated_at
            FROM news_articles
            WHERE id = %s
            LIMIT 1
            """,
            (article_id,),
        )

    def get_article_by_slug(self, slug: str) -> dict | None:
        return self._db.fetch_one(
            """
            SELECT id
            FROM news_articles
            WHERE slug = %s
            LIMIT 1
            """,
            (slug,),
        )

    def create_article(self, payload: NewsArticlePayload, *, slug: str, user_id: int) -> dict:
        row = self._db.fetch_one(
            """
            INSERT INTO news_articles (
                slug,
                title,
                summary,
                body,
                cover_image_url,
                tags,
                status,
                published_at,
                metadata,
                created_by_user_id,
                updated_by_user_id
            )
            VALUES (
                %(slug)s,
                %(title)s,
                %(summary)s,
                %(body)s,
                %(cover_image_url)s,
                %(tags)s,
                %(status)s,
                %(published_at)s,
                %(metadata)s::jsonb,
                %(user_id)s,
                %(user_id)s
            )
            RETURNING id
            """,
            {
                "slug": slug,
                "title": payload.title,
                "summary": payload.summary,
                "body": payload.body,
                "cover_image_url": payload.cover_image_url,
                "tags": payload.tags,
                "status": payload.status,
                "published_at": payload.published_at,
                "metadata": json.dumps(payload.metadata, ensure_ascii=False),
                "user_id": user_id,
            },
        )
        return self.get_article(int(row["id"])) if row is not None else None

    def update_article(self, article_id: int, payload: NewsArticlePayload, *, slug: str, user_id: int) -> dict | None:
        self._db.execute(
            """
            UPDATE news_articles
            SET
                slug = %(slug)s,
                title = %(title)s,
                summary = %(summary)s,
                body = %(body)s,
                cover_image_url = %(cover_image_url)s,
                tags = %(tags)s,
                status = %(status)s,
                published_at = %(published_at)s,
                metadata = %(metadata)s::jsonb,
                updated_by_user_id = %(user_id)s
            WHERE id = %(article_id)s
            """,
            {
                "article_id": article_id,
                "slug": slug,
                "title": payload.title,
                "summary": payload.summary,
                "body": payload.body,
                "cover_image_url": payload.cover_image_url,
                "tags": payload.tags,
                "status": payload.status,
                "published_at": payload.published_at,
                "metadata": json.dumps(payload.metadata, ensure_ascii=False),
                "user_id": user_id,
            },
        )
        return self.get_article(article_id)

    def delete_article(self, article_id: int) -> bool:
        self._db.execute("DELETE FROM news_articles WHERE id = %s", (article_id,))
        return True
