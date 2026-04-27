from __future__ import annotations

from backend.domain.organizations.schemas import PaginationMeta
from backend.domain.organizations.validators import clean_text, normalize_lookup_key
from backend.libs.http.errors import ConflictError, NotFoundError

from .repository import NewsRepository
from .schemas import (
    NewsArticle,
    NewsArticleEnvelope,
    NewsArticlePayload,
    NewsDeleteEnvelope,
    NewsListEnvelope,
    NewsListParams,
)


class NewsService:
    def __init__(self, repository: NewsRepository) -> None:
        self._repository = repository

    def list_news(self, params: NewsListParams) -> NewsListEnvelope:
        rows, total = self._repository.list_news(params)
        return NewsListEnvelope(
            data=[NewsArticle.model_validate(row) for row in rows],
            meta=PaginationMeta(
                total=total,
                page=params.page,
                page_size=params.page_size,
                total_pages=-(-total // params.page_size) if params.page_size else 0,
                query=params.tag,
            ),
        )

    def create_article(self, payload: NewsArticlePayload, *, user_id: int) -> NewsArticleEnvelope:
        slug = self._build_slug(payload.slug or payload.title)
        existing = self._repository.get_article_by_slug(slug)
        if existing is not None:
            raise ConflictError("news slug already exists")
        article = self._repository.create_article(payload, slug=slug, user_id=user_id)
        return NewsArticleEnvelope(data=NewsArticle.model_validate(article))

    def update_article(self, article_id: int, payload: NewsArticlePayload, *, user_id: int) -> NewsArticleEnvelope:
        if self._repository.get_article(article_id) is None:
            raise NotFoundError("news article not found")

        slug = self._build_slug(payload.slug or payload.title)
        existing = self._repository.get_article_by_slug(slug)
        if existing is not None and int(existing["id"]) != article_id:
            raise ConflictError("news slug already exists")

        article = self._repository.update_article(article_id, payload, slug=slug, user_id=user_id)
        if article is None:
            raise NotFoundError("news article not found")
        return NewsArticleEnvelope(data=NewsArticle.model_validate(article))

    def delete_article(self, article_id: int) -> NewsDeleteEnvelope:
        if self._repository.get_article(article_id) is None:
            raise NotFoundError("news article not found")
        self._repository.delete_article(article_id)
        return NewsDeleteEnvelope(data={"deleted": True})

    def _build_slug(self, raw: str) -> str:
        normalized = normalize_lookup_key(clean_text(raw))
        if normalized is None:
            raise ConflictError("news slug is required")
        return normalized
