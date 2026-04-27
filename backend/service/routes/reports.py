from __future__ import annotations

from fastapi import APIRouter, Depends, Path, Request

from backend.domain.auth.schemas import AuthenticatedUser
from backend.domain.organizations import OrganizationCatalogRepository
from backend.domain.reports import ReportsRepository, ReportsService
from backend.domain.reports.schemas import (
    CustomAnalysisCreateRequest,
    CustomAnalysisEnvelope,
    CustomAnalysisListEnvelope,
    CustomAnalysisListParams,
    CustomAnalysisUpdateRequest,
    DueDiligenceReportEnvelope,
    ProvinceReportEnvelope,
    ReportAggregateParams,
    ReportDetailEnvelope,
    ReportDownloadEnvelope,
    ReportListEnvelope,
    ReportListParams,
    ReportPayload,
    SectorReportEnvelope,
    SroiReportEnvelope,
    custom_analysis_list_params,
    report_aggregate_params,
    report_list_params,
)
from backend.libs.database import PostgreSQLClient
from backend.service.dependencies import (
    get_current_user,
    get_optional_current_user,
    get_postgresql_client,
    require_roles,
)

router = APIRouter(prefix="/reports", tags=["reports"])


def _service(db: PostgreSQLClient) -> ReportsService:
    return ReportsService(ReportsRepository(db), OrganizationCatalogRepository(db))


@router.get("", response_model=ReportListEnvelope)
async def list_reports(
    params: ReportListParams = Depends(report_list_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> ReportListEnvelope:
    return _service(db).list_reports(params)


@router.get("/province", response_model=ProvinceReportEnvelope)
async def get_report_by_province(
    params: ReportAggregateParams = Depends(report_aggregate_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> ProvinceReportEnvelope:
    return _service(db).province_report(params)


@router.get("/sector", response_model=SectorReportEnvelope)
async def get_report_by_sector(
    params: ReportAggregateParams = Depends(report_aggregate_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> SectorReportEnvelope:
    return _service(db).sector_report(params)


@router.get("/due-dil", response_model=DueDiligenceReportEnvelope)
async def get_due_diligence_report(
    params: ReportAggregateParams = Depends(report_aggregate_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> DueDiligenceReportEnvelope:
    return _service(db).due_diligence_report(params)


@router.get("/sroi", response_model=SroiReportEnvelope)
async def get_sroi_report(
    params: ReportAggregateParams = Depends(report_aggregate_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> SroiReportEnvelope:
    return _service(db).sroi_report(params)


@router.post("/custom-request", response_model=CustomAnalysisEnvelope)
async def create_custom_request(
    payload: CustomAnalysisCreateRequest,
    current_user: AuthenticatedUser | None = Depends(get_optional_current_user),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> CustomAnalysisEnvelope:
    return _service(db).create_custom_request(payload, current_user=current_user)


@router.get("/custom-request", response_model=CustomAnalysisListEnvelope)
async def list_custom_requests(
    params: CustomAnalysisListParams = Depends(custom_analysis_list_params),
    current_user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> CustomAnalysisListEnvelope:
    return _service(db).list_custom_requests(params, current_user=current_user)


@router.put("/custom-request/{request_id}", response_model=CustomAnalysisEnvelope)
async def update_custom_request(
    payload: CustomAnalysisUpdateRequest,
    request_id: int = Path(..., ge=1),
    current_user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> CustomAnalysisEnvelope:
    return _service(db).update_custom_request(request_id, payload, current_user=current_user)


@router.get("/{report_id}/download", response_model=ReportDownloadEnvelope)
async def download_report(
    request: Request,
    report_id: int = Path(..., ge=1),
    current_user: AuthenticatedUser | None = Depends(get_optional_current_user),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> ReportDownloadEnvelope:
    return _service(db).download_report(
        report_id,
        current_user=current_user,
        ip_address=request.client.host if request.client else None,
    )


@router.get("/{report_id}", response_model=ReportDetailEnvelope)
async def get_report(
    report_id: int = Path(..., ge=1),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> ReportDetailEnvelope:
    return _service(db).get_report(report_id)


@router.post("", response_model=ReportDetailEnvelope)
async def create_report(
    payload: ReportPayload,
    current_user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> ReportDetailEnvelope:
    return _service(db).create_report(payload, current_user=current_user)
