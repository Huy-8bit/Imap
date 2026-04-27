from __future__ import annotations

from datetime import date, datetime

from fastapi import Query
from pydantic import BaseModel, Field

from backend.domain.organizations.schemas import (
    DashboardImpactFlowCell,
    EnterpriseFilterParams,
    EnterpriseListItem,
    PaginationMeta,
    StatsOverviewData,
)


class ReportListParams(BaseModel):
    page: int = Field(default=1, ge=1)
    page_size: int = Field(default=20, ge=1, le=100)
    category: str | None = None


class ReportPayload(BaseModel):
    title: str = Field(min_length=3)
    slug: str | None = None
    category: str = "general"
    summary: str | None = None
    description: str | None = None
    preview_text: str | None = Field(default=None, alias="previewText")
    thumbnail_url: str | None = Field(default=None, alias="thumbnailUrl")
    storage_path: str | None = Field(default=None, alias="storagePath")
    download_url: str | None = Field(default=None, alias="downloadUrl")
    status: str = "published"
    is_premium: bool = Field(default=False, alias="isPremium")
    metadata: dict = Field(default_factory=dict)


class ReportSummary(BaseModel):
    id: int
    slug: str
    title: str
    category: str
    summary: str | None = None
    preview_text: str | None = None
    thumbnail_url: str | None = None
    status: str
    is_premium: bool
    published_at: datetime | None = None
    created_at: datetime
    updated_at: datetime


class ReportDetail(ReportSummary):
    description: str | None = None
    storage_path: str | None = None
    download_url: str | None = None
    metadata: dict = Field(default_factory=dict)


class ReportListEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: list[ReportSummary]
    meta: PaginationMeta


class ReportDetailEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: ReportDetail
    meta: dict | None = None


class ReportDownloadEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: dict
    meta: dict | None = None


class ReportAggregateParams(EnterpriseFilterParams):
    pass


class ProvinceReportEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: list[dict]
    meta: dict


class SectorReportEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: list[dict]
    meta: dict


class DueDiligenceReportEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: dict
    meta: dict


class SroiReportEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: dict
    meta: dict


class CustomAnalysisAttachmentInput(BaseModel):
    title: str | None = None
    file_name: str | None = Field(default=None, alias="fileName")
    file_url: str | None = Field(default=None, alias="fileUrl")
    storage_path: str | None = Field(default=None, alias="storagePath")
    metadata: dict = Field(default_factory=dict)


class CustomAnalysisCreateRequest(BaseModel):
    enterprise_id: int | None = Field(default=None, alias="enterpriseId", ge=1)
    requester_name: str = Field(alias="requesterName", min_length=2)
    requester_email: str = Field(alias="requesterEmail", min_length=3)
    requester_phone: str | None = Field(default=None, alias="requesterPhone")
    subject: str = Field(min_length=3)
    request_type: str = Field(default="custom_analysis", alias="requestType")
    brief: str | None = None
    desired_due_date: date | None = Field(default=None, alias="desiredDueDate")
    attachments: list[CustomAnalysisAttachmentInput] = Field(default_factory=list)
    metadata: dict = Field(default_factory=dict)


class CustomAnalysisListParams(BaseModel):
    page: int = Field(default=1, ge=1)
    page_size: int = Field(default=20, ge=1, le=100)
    status: str | None = None


class CustomAnalysisUpdateRequest(BaseModel):
    status: str
    admin_notes: str | None = Field(default=None, alias="adminNotes")
    quote_amount: float | None = Field(default=None, alias="quoteAmount")
    quote_currency: str | None = Field(default=None, alias="quoteCurrency")
    note: str | None = None


class CustomAnalysisRequestItem(BaseModel):
    id: int
    requester_name: str
    requester_email: str
    requester_phone: str | None = None
    subject: str
    request_type: str
    brief: str | None = None
    status: str
    attachment_count: int
    desired_due_date: date | None = None
    admin_notes: str | None = None
    quote_amount: float | None = None
    quote_currency: str | None = None
    created_at: datetime
    updated_at: datetime


class CustomAnalysisListEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: list[CustomAnalysisRequestItem]
    meta: PaginationMeta


class CustomAnalysisEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: CustomAnalysisRequestItem
    meta: dict | None = None


def report_list_params(
    page: int = Query(default=1, ge=1),
    page_size: int = Query(default=20, ge=1, le=100),
    category: str | None = Query(default=None),
) -> ReportListParams:
    return ReportListParams(page=page, page_size=page_size, category=category)


def report_aggregate_params(
    province: str | None = Query(default=None),
    operational_status: str | None = Query(default=None, alias="operationalStatus"),
    organization_type: str | None = Query(default=None, alias="organizationType"),
    primary_industry_sector: str | None = Query(default=None, alias="primaryIndustrySector"),
    has_positive_social_impact: bool | None = Query(default=None, alias="hasPositiveSocialImpact"),
    environmental_impact_area: str | None = Query(default=None, alias="environmentalImpactArea"),
) -> ReportAggregateParams:
    return ReportAggregateParams(
        province=province,
        operational_status=operational_status,
        organization_type=organization_type,
        primary_industry_sector=primary_industry_sector,
        has_positive_social_impact=has_positive_social_impact,
        environmental_impact_area=environmental_impact_area,
    )


def custom_analysis_list_params(
    page: int = Query(default=1, ge=1),
    page_size: int = Query(default=20, ge=1, le=100),
    status: str | None = Query(default=None),
) -> CustomAnalysisListParams:
    return CustomAnalysisListParams(page=page, page_size=page_size, status=status)
