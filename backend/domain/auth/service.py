from __future__ import annotations

from datetime import UTC, datetime, timedelta
from typing import Iterable

from backend.libs.http.errors import ConflictError, ForbiddenError, UnauthorizedError
from backend.service.config import config

from backend.domain.organizations.validators import (
    RecordValidationError,
    clean_text,
    normalize_email,
    normalize_tax_code,
)

from .repository import AuthRepository
from .schemas import (
    AuthMeEnvelope,
    AuthTokenData,
    AuthTokenEnvelope,
    AuthUserProfile,
    AuthenticatedUser,
    LinkedOrganizationSummary,
    LoginRequest,
    LogoutEnvelope,
    LogoutRequest,
    RefreshRequest,
    RegisterRequest,
)
from .security import decode_signed_token, hash_password, hash_token, issue_signed_token, new_session_id, verify_password

ACCESS_TOKEN_TYPE = "access"
REFRESH_TOKEN_TYPE = "refresh"
ADMIN_ROLE_CODE = "admin"
ENTERPRISE_ROLE_CODE = "enterprise"


class AuthService:
    def __init__(self, repository: AuthRepository) -> None:
        self._repository = repository

    def register(
        self,
        payload: RegisterRequest,
        *,
        user_agent: str | None = None,
        ip_address: str | None = None,
    ) -> AuthTokenEnvelope:
        email = self._normalize_email(payload.email)

        if self._repository.get_user_auth_row_by_email(email) is not None:
            raise ConflictError("email already registered")

        role = self._repository.get_role_by_code(ENTERPRISE_ROLE_CODE)
        if role is None:
            raise RuntimeError("enterprise role taxonomy missing")

        normalized_tax_code = self._normalize_tax_code(payload.tax_code) if payload.tax_code is not None else None
        linked_org = (
            self._repository.find_organization_by_tax_code(normalized_tax_code)
            if normalized_tax_code is not None
            else None
        )

        user_id = self._repository.create_user(
            email=email,
            password_hash=hash_password(payload.password),
            full_name=clean_text(payload.full_name),
            role_id=int(role["id"]),
        )

        if normalized_tax_code is not None or linked_org is not None:
            self._repository.upsert_organization_link(
                user_id=user_id,
                organization_id=int(linked_org["id"]) if linked_org is not None else None,
                linked_tax_code=normalized_tax_code,
                status="active" if linked_org is not None else "pending",
            )

        user = self._require_authenticated_user(user_id)
        tokens = self._issue_session_tokens(user, user_agent=user_agent, ip_address=ip_address)
        return AuthTokenEnvelope(data=tokens)

    def login(
        self,
        payload: LoginRequest,
        *,
        user_agent: str | None = None,
        ip_address: str | None = None,
    ) -> AuthTokenEnvelope:
        email = self._normalize_email(payload.email, invalid_message="invalid credentials")

        auth_row = self._repository.get_user_auth_row_by_email(email)
        if auth_row is None or auth_row["status"] != "active":
            raise UnauthorizedError("invalid credentials")

        if not verify_password(payload.password, auth_row["password_hash"]):
            raise UnauthorizedError("invalid credentials")

        user_id = int(auth_row["id"])
        self._repository.touch_last_login(user_id)
        user = self._require_authenticated_user(user_id)
        tokens = self._issue_session_tokens(user, user_agent=user_agent, ip_address=ip_address)
        return AuthTokenEnvelope(data=tokens)

    def refresh(
        self,
        payload: RefreshRequest,
        *,
        user_agent: str | None = None,
        ip_address: str | None = None,
    ) -> AuthTokenEnvelope:
        claims = self.decode_token(payload.refresh_token, expected_type=REFRESH_TOKEN_TYPE)
        session_id = claims["sid"]
        session = self._repository.get_session(session_id)
        if session is None or session["status"] != "active":
            raise UnauthorizedError("refresh session not found")

        if hash_token(payload.refresh_token) != session["refresh_token_hash"]:
            raise UnauthorizedError("refresh token revoked")

        expires_at = session["expires_at"]
        if expires_at is None or expires_at <= datetime.now(UTC):
            self._repository.revoke_session(session_id)
            raise UnauthorizedError("refresh token expired")

        self._repository.revoke_session(session_id)
        user = self._require_authenticated_user(int(session["user_id"]))
        tokens = self._issue_session_tokens(user, user_agent=user_agent, ip_address=ip_address)
        return AuthTokenEnvelope(data=tokens)

    def logout(self, user: AuthenticatedUser, payload: LogoutRequest | None = None) -> LogoutEnvelope:
        revoked = False
        if payload is not None and payload.refresh_token:
            claims = self.decode_token(payload.refresh_token, expected_type=REFRESH_TOKEN_TYPE)
            self._repository.revoke_session(claims["sid"])
            revoked = True

        if user.session_id is not None:
            self._repository.revoke_session(user.session_id)
            revoked = True

        return LogoutEnvelope(data={"revoked": revoked})

    def me(self, user: AuthenticatedUser) -> AuthMeEnvelope:
        context = self._repository.get_user_context_by_id(user.id)
        if context is None:
            raise UnauthorizedError("user not found")
        return AuthMeEnvelope(data=self._build_profile(context))

    def decode_token(self, token: str, *, expected_type: str) -> dict:
        claims = decode_signed_token(token, secret=config.jwt_secret)
        if claims.get("typ") != expected_type:
            raise UnauthorizedError("invalid token type")
        if claims.get("sub") is None or claims.get("sid") is None:
            raise UnauthorizedError("invalid token claims")
        return claims

    def get_authenticated_user_from_access_token(self, token: str) -> AuthenticatedUser:
        claims = self.decode_token(token, expected_type=ACCESS_TOKEN_TYPE)
        session = self._repository.get_session(claims["sid"])
        if session is None or session["status"] != "active":
            raise UnauthorizedError("session revoked")
        if session["expires_at"] <= datetime.now(UTC):
            raise UnauthorizedError("session expired")
        self._repository.mark_session_used(claims["sid"])
        user = self._require_authenticated_user(int(claims["sub"]))
        return user.model_copy(update={"session_id": claims["sid"]})

    @staticmethod
    def ensure_roles(user: AuthenticatedUser, allowed_roles: Iterable[str]) -> None:
        allowed = set(allowed_roles)
        if user.role_code == ADMIN_ROLE_CODE:
            return
        if user.role_code not in allowed:
            raise ForbiddenError("forbidden")

    @staticmethod
    def ensure_organization_access(user: AuthenticatedUser, organization_id: int) -> None:
        if user.role_code == ADMIN_ROLE_CODE:
            return
        if user.organization_id != organization_id:
            raise ForbiddenError("forbidden")

    def _issue_session_tokens(
        self,
        user: AuthenticatedUser,
        *,
        user_agent: str | None,
        ip_address: str | None,
    ) -> AuthTokenData:
        session_id = new_session_id()
        access_token, access_expires_at = issue_signed_token(
            {
                "sub": str(user.id),
                "sid": session_id,
                "typ": ACCESS_TOKEN_TYPE,
                "role": user.role_code,
                "email": user.email,
                "org_id": user.organization_id,
            },
            secret=config.jwt_secret,
            expires_delta=timedelta(minutes=config.jwt_access_ttl_minutes),
        )
        refresh_token, refresh_expires_at = issue_signed_token(
            {
                "sub": str(user.id),
                "sid": session_id,
                "typ": REFRESH_TOKEN_TYPE,
                "role": user.role_code,
                "email": user.email,
                "org_id": user.organization_id,
            },
            secret=config.jwt_secret,
            expires_delta=timedelta(days=config.jwt_refresh_ttl_days),
        )
        self._repository.create_session(
            session_id=session_id,
            user_id=user.id,
            refresh_token_hash=hash_token(refresh_token),
            expires_at=refresh_expires_at,
            user_agent=user_agent,
            ip_address=ip_address,
        )
        return AuthTokenData(
            access_token=access_token,
            refresh_token=refresh_token,
            access_expires_at=access_expires_at,
            refresh_expires_at=refresh_expires_at,
        )

    def _require_authenticated_user(self, user_id: int) -> AuthenticatedUser:
        context = self._repository.get_user_context_by_id(user_id)
        if context is None or context["status"] != "active":
            raise UnauthorizedError("user not found")

        return AuthenticatedUser(
            id=int(context["id"]),
            email=context["email"],
            full_name=context.get("full_name"),
            role_code=context["role_code"],
            status=context["status"],
            organization=LinkedOrganizationSummary.model_validate(context["organization"])
            if context.get("organization") is not None
            else None,
        )

    def _build_profile(self, row: dict) -> AuthUserProfile:
        return AuthUserProfile(
            id=int(row["id"]),
            email=row["email"],
            full_name=row.get("full_name"),
            role=row["role_code"],
            status=row["status"],
            organization=LinkedOrganizationSummary.model_validate(row["organization"])
            if row.get("organization") is not None
            else None,
            last_login_at=row.get("last_login_at"),
            created_at=row["created_at"],
        )

    def _normalize_email(self, raw: str, *, invalid_message: str = "invalid email") -> str:
        try:
            normalized = normalize_email(raw)
        except RecordValidationError as exc:
            raise UnauthorizedError(invalid_message, detail={"field": exc.field_name}) from exc
        if normalized is None:
            raise UnauthorizedError(invalid_message)
        return normalized

    def _normalize_tax_code(self, raw: str) -> str:
        try:
            normalized = normalize_tax_code(raw)
        except RecordValidationError as exc:
            raise UnauthorizedError("invalid tax code", detail={"field": exc.field_name}) from exc
        if normalized is None:
            raise UnauthorizedError("invalid tax code")
        return normalized
