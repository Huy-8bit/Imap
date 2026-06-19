from __future__ import annotations

from fastapi import APIRouter, Depends, Request

from backend.domain.auth import AuthRepository, AuthService
from backend.domain.auth.schemas import (
    AuthMeEnvelope,
    AuthTokenEnvelope,
    GoogleLoginRequest,
    LoginRequest,
    LogoutEnvelope,
    LogoutRequest,
    RefreshRequest,
    RegisterRequest,
    SetupAdminEnvelope,
    SetupAdminRequest,
)
from backend.libs.database import PostgreSQLClient
from backend.service.config import config
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


@router.post("/google", response_model=AuthTokenEnvelope)
async def login_with_google(
    payload: GoogleLoginRequest,
    request: Request,
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> AuthTokenEnvelope:
    service = AuthService(AuthRepository(db))
    return service.login_with_google(
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


@router.post("/setup-admin", response_model=SetupAdminEnvelope)
async def setup_admin(
    payload: SetupAdminRequest,
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> SetupAdminEnvelope:
    """Tạo tài khoản admin đầu tiên. Chỉ hoạt động khi chưa có admin nào và SETUP_ADMIN_SECRET được set."""
    return AuthService(AuthRepository(db)).setup_admin(
        payload,
        expected_secret=config.setup_admin_secret,
    )


@router.get("/me", response_model=AuthMeEnvelope)
async def me(
    user=Depends(get_current_user),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> AuthMeEnvelope:
    service = AuthService(AuthRepository(db))
    return service.me(user)
