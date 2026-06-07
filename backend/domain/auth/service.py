from __future__ import annotations

import secrets
from dataclasses import dataclass
from datetime import UTC, datetime, timedelta
from typing import Any, Iterable

import httpx

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
    GoogleLoginRequest,
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
GOOGLE_ISSUERS = {"accounts.google.com", "https://accounts.google.com"}
GOOGLE_TOKENINFO_URL = "https://oauth2.googleapis.com/tokeninfo"
GOOGLE_TOKENINFO_TIMEOUT_SECONDS = 5.0


@dataclass(frozen=True, slots=True)
class GoogleIdentity:
    sub: str
    email: str
    email_verified: bool
    full_name: str | None
    picture: str | None
    hosted_domain: str | None

    def to_metadata(self) -> dict[str, Any]:
        return {
            "sub": self.sub,
            "email": self.email,
            "email_verified": self.email_verified,
            "full_name": self.full_name,
            "picture": self.picture,
            "hosted_domain": self.hosted_domain,
            "linked_at": datetime.now(UTC).isoformat(),
        }


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

    def login_with_google(
        self,
        payload: GoogleLoginRequest,
        *,
        user_agent: str | None = None,
        ip_address: str | None = None,
    ) -> AuthTokenEnvelope:
        identity = self._verify_google_credential(payload.credential)
        user_id = self._upsert_google_user(identity)
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

    def _upsert_google_user(self, identity: GoogleIdentity) -> int:
        existing_google_user = self._repository.get_user_auth_row_by_google_sub(identity.sub)
        if existing_google_user is not None:
            user_id = int(existing_google_user["id"])
            self._ensure_active_auth_row(existing_google_user)
            self._repository.update_google_identity(
                user_id=user_id,
                google_metadata=identity.to_metadata(),
                full_name=identity.full_name,
            )
            return user_id

        email_user = self._repository.get_user_auth_row_by_email(identity.email)
        if email_user is not None:
            user_id = int(email_user["id"])
            self._ensure_active_auth_row(email_user)
            linked_google_sub = self._extract_linked_google_sub(email_user.get("metadata"))
            if linked_google_sub is not None and linked_google_sub != identity.sub:
                raise ConflictError("email already linked to another google account")

            self._repository.update_google_identity(
                user_id=user_id,
                google_metadata=identity.to_metadata(),
                full_name=identity.full_name,
            )
            return user_id

        role = self._repository.get_role_by_code(ENTERPRISE_ROLE_CODE)
        if role is None:
            raise RuntimeError("enterprise role taxonomy missing")

        return self._repository.create_user(
            email=identity.email,
            password_hash=hash_password(secrets.token_urlsafe(32)),
            full_name=identity.full_name,
            role_id=int(role["id"]),
            metadata={
                "auth_provider": "google",
                "google": identity.to_metadata(),
            },
        )

    def _verify_google_credential(self, credential: str) -> GoogleIdentity:
        if not config.google_client_id:
            raise UnauthorizedError("google authentication is not configured")

        try:
            claims = self._verify_google_credential_with_google_auth(credential)
        except ImportError:
            claims = self._verify_google_credential_with_tokeninfo(credential)

        return self._build_google_identity(claims)

    def _verify_google_credential_with_google_auth(self, credential: str) -> dict[str, Any]:
        try:
            from google.auth.transport import requests as google_requests
            from google.oauth2 import id_token
        except ImportError:
            raise

        try:
            claims = id_token.verify_oauth2_token(
                credential,
                google_requests.Request(),
                config.google_client_id,
            )
        except Exception as exc:
            raise UnauthorizedError("invalid google credential") from exc

        return dict(claims)

    def _verify_google_credential_with_tokeninfo(self, credential: str) -> dict[str, Any]:
        try:
            response = httpx.get(
                GOOGLE_TOKENINFO_URL,
                params={"id_token": credential},
                timeout=GOOGLE_TOKENINFO_TIMEOUT_SECONDS,
            )
        except httpx.HTTPError as exc:
            raise UnauthorizedError("invalid google credential") from exc

        if response.status_code != 200:
            raise UnauthorizedError("invalid google credential")

        try:
            payload = response.json()
        except ValueError as exc:
            raise UnauthorizedError("invalid google credential") from exc

        if not isinstance(payload, dict):
            raise UnauthorizedError("invalid google credential")

        return payload

    def _build_google_identity(self, claims: dict[str, Any]) -> GoogleIdentity:
        aud = claims.get("aud")
        if aud != config.google_client_id:
            raise UnauthorizedError("invalid google audience")

        issuer = claims.get("iss")
        if issuer not in GOOGLE_ISSUERS:
            raise UnauthorizedError("invalid google issuer")

        expires_at = self._coerce_int_claim(claims.get("exp"))
        if expires_at is None or expires_at <= int(datetime.now(UTC).timestamp()):
            raise UnauthorizedError("google credential expired")

        google_sub = clean_text(str(claims.get("sub") or ""))
        if google_sub is None:
            raise UnauthorizedError("invalid google subject")

        email_verified = self._coerce_bool_claim(claims.get("email_verified"))
        if not email_verified:
            raise UnauthorizedError("google email is not verified")

        email = self._normalize_email(str(claims.get("email") or ""), invalid_message="invalid google email")
        full_name = clean_text(str(claims.get("name") or "")) if claims.get("name") else None
        picture = clean_text(str(claims.get("picture") or "")) if claims.get("picture") else None
        hosted_domain = clean_text(str(claims.get("hd") or "")) if claims.get("hd") else None

        return GoogleIdentity(
            sub=google_sub,
            email=email,
            email_verified=email_verified,
            full_name=full_name,
            picture=picture,
            hosted_domain=hosted_domain,
        )

    @staticmethod
    def _ensure_active_auth_row(auth_row: dict[str, Any]) -> None:
        if auth_row["status"] != "active":
            raise UnauthorizedError("user disabled")

    @staticmethod
    def _extract_linked_google_sub(metadata: Any) -> str | None:
        if not isinstance(metadata, dict):
            return None
        google_metadata = metadata.get("google")
        if not isinstance(google_metadata, dict):
            return None
        linked_sub = google_metadata.get("sub")
        return str(linked_sub) if linked_sub else None

    @staticmethod
    def _coerce_bool_claim(value: Any) -> bool:
        if isinstance(value, bool):
            return value
        if isinstance(value, str):
            return value.strip().lower() == "true"
        return False

    @staticmethod
    def _coerce_int_claim(value: Any) -> int | None:
        if isinstance(value, int):
            return value
        if isinstance(value, str):
            try:
                return int(value)
            except ValueError:
                return None
        return None

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
