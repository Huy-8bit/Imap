from __future__ import annotations

from fastapi import APIRouter, Depends, Request

from backend.domain.auth import AuthRepository, AuthService
from backend.domain.auth.schemas import (
    AuthMeEnvelope,
    AuthTokenEnvelope,
    LoginRequest,
    LogoutEnvelope,
    LogoutRequest,
    RefreshRequest,
    RegisterRequest,
)
from backend.libs.database import PostgreSQLClient
from backend.service.dependencies import get_current_user, get_postgresql_client

router = APIRouter(prefix="/auth", tags=["auth"])


@router.post("/register", response_model=AuthTokenEnvelope)
async def register(
    payload: RegisterRequest,
    request: Request,
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> AuthTokenEnvelope:
    service = AuthService(AuthRepository(db))
    return service.register(
        payload,
        user_agent=request.headers.get("user-agent"),
        ip_address=request.client.host if request.client else None,
    )


@router.post("/login", response_model=AuthTokenEnvelope)
async def login(
    payload: LoginRequest,
    request: Request,
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> AuthTokenEnvelope:
    service = AuthService(AuthRepository(db))
    return service.login(
        payload,
        user_agent=request.headers.get("user-agent"),
        ip_address=request.client.host if request.client else None,
    )


@router.post("/logout", response_model=LogoutEnvelope)
async def logout(
    payload: LogoutRequest | None = None,
    user=Depends(get_current_user),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> LogoutEnvelope:
    service = AuthService(AuthRepository(db))
    return service.logout(user, payload)


@router.post("/refresh", response_model=AuthTokenEnvelope)
async def refresh(
    payload: RefreshRequest,
    request: Request,
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> AuthTokenEnvelope:
    service = AuthService(AuthRepository(db))
    return service.refresh(
        payload,
        user_agent=request.headers.get("user-agent"),
        ip_address=request.client.host if request.client else None,
    )


@router.get("/me", response_model=AuthMeEnvelope)
async def me(
    user=Depends(get_current_user),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> AuthMeEnvelope:
    service = AuthService(AuthRepository(db))
    return service.me(user)
