from __future__ import annotations

from fastapi import Query
from pydantic import BaseModel, Field

from backend.libs.database import PostgreSQLClient, RedisCommands, get_postgresql, get_redis


def get_postgresql_client() -> PostgreSQLClient:
    return get_postgresql()


def get_redis_client() -> RedisCommands:
    return get_redis()


class PaginationParams(BaseModel):
    page: int = Field(default=1, ge=1)
    page_size: int = Field(default=20, ge=1, le=100)


def pagination_params(
    page: int = Query(default=1, ge=1),
    page_size: int = Query(default=20, ge=1, le=100),
) -> PaginationParams:
    return PaginationParams(page=page, page_size=page_size)
