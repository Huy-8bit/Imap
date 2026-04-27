from __future__ import annotations

from datetime import datetime

from fastapi import Query
from pydantic import BaseModel, Field

from backend.domain.organizations.schemas import PaginationMeta


class NewsListParams(BaseModel):
    page: int = Field(default=1, ge=1)
    page_size: int = Field(default=10, ge=1, le=100)
    tag: str | None = None


class NewsArticlePayload(BaseModel):
    title: str = Field(min_length=3)
    slug: str | None = None
    summary: str | None = None
    body: str | None = None
    cover_image_url: str | None = None
    tags: list[str] = Field(default_factory=list)
    status: str = "published"
    published_at: datetime | None = None
    metadata: dict = Field(default_factory=dict)


class NewsArticle(BaseModel):
    id: int
    slug: str
    title: str
    summary: str | None = None
    body: str | None = None
    cover_image_url: str | None = None
    tags: list[str] = Field(default_factory=list)
    status: str
    published_at: datetime | None = None
    created_at: datetime
    updated_at: datetime


class NewsListEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: list[NewsArticle]
    meta: PaginationMeta


class NewsArticleEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: NewsArticle
    meta: dict | None = None


class NewsDeleteEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: dict[str, bool]
    meta: dict | None = None


def news_list_params(
    page: int = Query(default=1, ge=1),
    page_size: int = Query(default=10, ge=1, le=100),
    tag: str | None = Query(default=None),
) -> NewsListParams:
    return NewsListParams(page=page, page_size=page_size, tag=tag)
