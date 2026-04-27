from __future__ import annotations

from typing import Callable

from fastapi import Depends, Query
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from pydantic import BaseModel, Field

from backend.domain.auth import AuthRepository, AuthService
from backend.domain.auth.schemas import AuthenticatedUser
from backend.libs.database import PostgreSQLClient, RedisCommands, get_postgresql, get_redis
from backend.libs.http.errors import UnauthorizedError


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


bearer_scheme = HTTPBearer(auto_error=False)


def get_optional_current_user(
    credentials: HTTPAuthorizationCredentials | None = Depends(bearer_scheme),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> AuthenticatedUser | None:
    if credentials is None:
        return None
    service = AuthService(AuthRepository(db))
    return service.get_authenticated_user_from_access_token(credentials.credentials)


def get_current_user(
    user: AuthenticatedUser | None = Depends(get_optional_current_user),
) -> AuthenticatedUser:
    if user is None:
        raise UnauthorizedError("authentication required")
    return user


def require_roles(*roles: str) -> Callable[[AuthenticatedUser], AuthenticatedUser]:
    def dependency(
        user: AuthenticatedUser = Depends(get_current_user),
        db: PostgreSQLClient = Depends(get_postgresql_client),
    ) -> AuthenticatedUser:
        AuthService(AuthRepository(db)).ensure_roles(user, roles)
        return user

    return dependency
