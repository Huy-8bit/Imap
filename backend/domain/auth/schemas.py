from __future__ import annotations

from datetime import datetime

from pydantic import BaseModel, Field


class LinkedOrganizationSummary(BaseModel):
    id: int | None = None
    external_code: str | None = None
    display_name: str | None = None
    tax_code: str | None = None
    link_status: str | None = None


class AuthenticatedUser(BaseModel):
    id: int
    email: str
    full_name: str | None = None
    role_code: str
    status: str
    session_id: str | None = None
    organization: LinkedOrganizationSummary | None = None

    @property
    def organization_id(self) -> int | None:
        if self.organization is None:
            return None
        return self.organization.id


class RegisterRequest(BaseModel):
    email: str
    password: str = Field(min_length=8)
    full_name: str | None = None
    tax_code: str | None = None


class LoginRequest(BaseModel):
    email: str
    password: str = Field(min_length=8)


class RefreshRequest(BaseModel):
    refresh_token: str


class LogoutRequest(BaseModel):
    refresh_token: str | None = None


class AuthTokenData(BaseModel):
    access_token: str
    refresh_token: str
    token_type: str = "bearer"
    access_expires_at: datetime
    refresh_expires_at: datetime


class AuthUserProfile(BaseModel):
    id: int
    email: str
    full_name: str | None = None
    role: str
    status: str
    organization: LinkedOrganizationSummary | None = None
    last_login_at: datetime | None = None
    created_at: datetime


class AuthTokenEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: AuthTokenData
    meta: dict | None = None


class AuthMeEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: AuthUserProfile
    meta: dict | None = None


class LogoutEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: dict[str, bool]
    meta: dict | None = None
