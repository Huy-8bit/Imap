from __future__ import annotations

from datetime import datetime

from pydantic import BaseModel, Field


class IidAboutPage(BaseModel):
    slug: str
    title: str
    summary: str | None = None
    body: str | None = None
    status: str
    updated_at: datetime | None = None


class IidAboutPayload(BaseModel):
    title: str = Field(min_length=3)
    summary: str | None = None
    body: str | None = None
    status: str = "published"
    metadata: dict = Field(default_factory=dict)


class IidTeamMember(BaseModel):
    id: int
    full_name: str
    role_title: str | None = None
    biography: str | None = None
    avatar_url: str | None = None
    website: str | None = None
    email: str | None = None
    sort_order: int


class IidPartner(BaseModel):
    id: int
    name: str
    partner_type: str | None = None
    description: str | None = None
    logo_url: str | None = None
    website: str | None = None
    sort_order: int


class IidAboutEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: IidAboutPage
    meta: dict | None = None


class IidTeamEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: list[IidTeamMember]
    meta: dict[str, int]


class IidPartnersEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: list[IidPartner]
    meta: dict[str, int]
