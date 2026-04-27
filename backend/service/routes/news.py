from __future__ import annotations

from fastapi import APIRouter, Depends, Path

from backend.domain.auth.schemas import AuthenticatedUser
from backend.domain.news import NewsRepository, NewsService
from backend.domain.news.schemas import (
    NewsArticleEnvelope,
    NewsArticlePayload,
    NewsDeleteEnvelope,
    NewsListEnvelope,
    NewsListParams,
    news_list_params,
)
from backend.libs.database import PostgreSQLClient
from backend.service.dependencies import get_postgresql_client, require_roles

router = APIRouter(prefix="/news", tags=["news"])


@router.get("", response_model=NewsListEnvelope)
async def list_news(
    params: NewsListParams = Depends(news_list_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> NewsListEnvelope:
    return NewsService(NewsRepository(db)).list_news(params)


@router.post("", response_model=NewsArticleEnvelope)
async def create_news(
    payload: NewsArticlePayload,
    user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> NewsArticleEnvelope:
    return NewsService(NewsRepository(db)).create_article(payload, user_id=user.id)


@router.put("/{article_id}", response_model=NewsArticleEnvelope)
async def update_news(
    payload: NewsArticlePayload,
    article_id: int = Path(..., ge=1),
    user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> NewsArticleEnvelope:
    return NewsService(NewsRepository(db)).update_article(article_id, payload, user_id=user.id)


@router.delete("/{article_id}", response_model=NewsDeleteEnvelope)
async def delete_news(
    article_id: int = Path(..., ge=1),
    user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> NewsDeleteEnvelope:
    return NewsService(NewsRepository(db)).delete_article(article_id)
