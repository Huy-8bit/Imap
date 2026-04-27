from __future__ import annotations

from datetime import datetime

from fastapi import Query
from pydantic import BaseModel, Field

from backend.domain.organizations.schemas import PaginationMeta, TaxonomySummary


class CertificationDirectoryParams(BaseModel):
    page: int = Field(default=1, ge=1)
    page_size: int = Field(default=20, ge=1, le=100)
    province: str | None = None
    organization_type: str | None = None
    primary_industry_sector: str | None = None
    certification_level: str | None = None


class CertificationDocumentInput(BaseModel):
    document_type: str
    title: str
    file_name: str | None = None
    file_url: str | None = None
    storage_path: str | None = None
    metadata: dict = Field(default_factory=dict)


class CertificationApplyRequest(BaseModel):
    enterprise_id: int | None = Field(default=None, alias="enterpriseId", ge=1)
    requested_level_code: str | None = Field(default=None, alias="requestedLevelCode")
    application_note: str | None = Field(default=None, alias="applicationNote")
    documents: list[CertificationDocumentInput] = Field(default_factory=list)
    metadata: dict = Field(default_factory=dict)


class CertificationReviewRequest(BaseModel):
    action: str
    comment: str | None = None
    public_note: str | None = Field(default=None, alias="publicNote")


class CertificationUpgradeRequest(BaseModel):
    level_code: str = Field(alias="levelCode")
    status: str = "active"
    public_note: str | None = Field(default=None, alias="publicNote")
    directory_visible: bool = Field(default=True, alias="directoryVisible")
    expires_at: datetime | None = Field(default=None, alias="expiresAt")
    reason: str | None = None


class CertificationDirectoryItem(BaseModel):
    organization_id: int
    external_code: str | None = None
    display_name: str
    province: TaxonomySummary | None = None
    organization_type: TaxonomySummary | None = None
    primary_industry_sector: TaxonomySummary | None = None
    certification_level: TaxonomySummary | None = None
    certification_status: str
    issued_at: datetime | None = None
    expires_at: datetime | None = None
    directory_visible: bool


class CertificationDocument(BaseModel):
    id: int
    document_type: str
    title: str
    file_name: str | None = None
    file_url: str | None = None
    storage_path: str | None = None
    created_at: datetime


class CertificationApplicationSummary(BaseModel):
    id: int
    requested_level: TaxonomySummary | None = None
    status: str
    application_note: str | None = None
    review_note: str | None = None
    submitted_at: datetime
    decided_at: datetime | None = None
    documents: list[CertificationDocument] = Field(default_factory=list)


class CertificationCurrentRecord(BaseModel):
    id: int
    certification_level: TaxonomySummary | None = None
    status: str
    directory_visible: bool
    issued_at: datetime | None = None
    expires_at: datetime | None = None
    public_note: str | None = None


class CertificationDirectoryEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: list[CertificationDirectoryItem]
    meta: PaginationMeta


class CertificationDetailData(BaseModel):
    enterprise_id: int
    current: CertificationCurrentRecord | None = None
    applications: list[CertificationApplicationSummary] = Field(default_factory=list)


class CertificationDetailEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: CertificationDetailData
    meta: dict | None = None


class CertificationMutationEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: CertificationDetailData
    meta: dict | None = None


def certification_directory_params(
    page: int = Query(default=1, ge=1),
    page_size: int = Query(default=20, ge=1, le=100),
    province: str | None = Query(default=None),
    organization_type: str | None = Query(default=None, alias="organizationType"),
    primary_industry_sector: str | None = Query(default=None, alias="primaryIndustrySector"),
    certification_level: str | None = Query(default=None, alias="certificationLevel"),
) -> CertificationDirectoryParams:
    return CertificationDirectoryParams(
        page=page,
        page_size=page_size,
        province=province,
        organization_type=organization_type,
        primary_industry_sector=primary_industry_sector,
        certification_level=certification_level,
    )
