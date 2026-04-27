from __future__ import annotations

from backend.domain.auth.schemas import AuthenticatedUser
from backend.domain.auth.service import AuthService
from backend.domain.organizations.catalog_repository import OrganizationCatalogRepository
from backend.domain.organizations.schemas import (
    DashboardBreakdownDimension,
    DashboardImpactFlowCell,
    DashboardImpactFlowParams,
    EnterpriseListItem,
    EnterpriseListParams,
    EnterpriseListSort,
    SortOrder,
    StatsOverviewData,
)
from backend.domain.organizations.validators import clean_text, normalize_lookup_key
from backend.libs.http.errors import ConflictError, ForbiddenError, NotFoundError

from .repository import ReportsRepository
from .schemas import (
    CustomAnalysisCreateRequest,
    CustomAnalysisEnvelope,
    CustomAnalysisListEnvelope,
    CustomAnalysisListParams,
    CustomAnalysisRequestItem,
    CustomAnalysisUpdateRequest,
    DueDiligenceReportEnvelope,
    ProvinceReportEnvelope,
    ReportAggregateParams,
    ReportDetail,
    ReportDetailEnvelope,
    ReportDownloadEnvelope,
    ReportListEnvelope,
    ReportListParams,
    ReportPayload,
    ReportSummary,
    SectorReportEnvelope,
    SroiReportEnvelope,
)


class ReportsService:
    def __init__(
        self,
        repository: ReportsRepository,
        organization_repository: OrganizationCatalogRepository,
    ) -> None:
        self._repository = repository
        self._organization_repository = organization_repository

    def list_reports(self, params: ReportListParams) -> ReportListEnvelope:
        rows, total = self._repository.list_reports(params)
        from backend.domain.organizations.schemas import PaginationMeta

        return ReportListEnvelope(
            data=[ReportSummary.model_validate(row) for row in rows],
            meta=PaginationMeta(
                total=total,
                page=params.page,
                page_size=params.page_size,
                total_pages=-(-total // params.page_size) if params.page_size else 0,
                query=params.category,
            ),
        )

    def get_report(self, report_id: int) -> ReportDetailEnvelope:
        row = self._repository.get_report(report_id)
        if row is None or row["status"] != "published":
            raise NotFoundError("report not found")
        return ReportDetailEnvelope(data=ReportDetail.model_validate(row))

    def create_report(self, payload: ReportPayload, *, current_user: AuthenticatedUser) -> ReportDetailEnvelope:
        AuthService.ensure_roles(current_user, ["admin"])
        slug = self._build_slug(payload.slug or payload.title)
        existing = self._repository.get_report_by_slug(slug)
        if existing is not None:
            raise ConflictError("report slug already exists")
        row = self._repository.create_report(payload, slug=slug, user_id=current_user.id)
        return ReportDetailEnvelope(data=ReportDetail.model_validate(row))

    def download_report(
        self,
        report_id: int,
        *,
        current_user: AuthenticatedUser | None,
        ip_address: str | None,
    ) -> ReportDownloadEnvelope:
        row = self._repository.get_report(report_id)
        if row is None or row["status"] != "published":
            raise NotFoundError("report not found")

        allowed = not bool(row["is_premium"])
        if bool(row["is_premium"]):
            if current_user is None:
                raise ForbiddenError("premium access required")
            allowed = current_user.role_code == "admin" or self._repository.role_can_download_report(report_id, current_user.role_code)
        if not allowed:
            raise ForbiddenError("premium access required")

        self._repository.log_download(
            report_id,
            user_id=current_user.id if current_user else None,
            requester_email=current_user.email if current_user else None,
            ip_address=ip_address,
        )
        return ReportDownloadEnvelope(
            data={
                "report_id": report_id,
                "allowed": True,
                "download_url": row.get("download_url"),
                "storage_path": row.get("storage_path"),
                "is_premium": bool(row["is_premium"]),
            }
        )

    def province_report(self, params: ReportAggregateParams) -> ProvinceReportEnvelope:
        rows, matched_total = self._organization_repository.get_dashboard_breakdown(
            params,
            dimension=DashboardBreakdownDimension.PROVINCE,
        )
        return ProvinceReportEnvelope(
            data=rows,
            meta={"matched_total": matched_total, "bucket_count": len(rows), "group_by": "province"},
        )

    def sector_report(self, params: ReportAggregateParams) -> SectorReportEnvelope:
        rows, matched_total = self._organization_repository.get_dashboard_breakdown(
            params,
            dimension=DashboardBreakdownDimension.PRIMARY_INDUSTRY_SECTOR,
        )
        return SectorReportEnvelope(
            data=rows,
            meta={"matched_total": matched_total, "bucket_count": len(rows), "group_by": "primary_industry_sector"},
        )

    def due_diligence_report(self, params: ReportAggregateParams) -> DueDiligenceReportEnvelope:
        overview = StatsOverviewData.model_validate(self._organization_repository.get_stats_overview(params))
        enterprises, total = self._organization_repository.list_enterprises(
            EnterpriseListParams(
                page=1,
                page_size=50,
                sort=EnterpriseListSort.UPDATED_AT,
                order=SortOrder.DESC,
                province=params.province,
                operational_status=params.operational_status,
                organization_type=params.organization_type,
                primary_industry_sector=params.primary_industry_sector,
                has_positive_social_impact=params.has_positive_social_impact,
                environmental_impact_area=params.environmental_impact_area,
            )
        )
        return DueDiligenceReportEnvelope(
            data={
                "overview": overview.model_dump(mode="json"),
                "enterprises": [EnterpriseListItem.model_validate(row).model_dump(mode="json") for row in enterprises],
            },
            meta={"matched_total": total, "returned_total": len(enterprises)},
        )

    def sroi_report(self, params: ReportAggregateParams) -> SroiReportEnvelope:
        overview = StatsOverviewData.model_validate(self._organization_repository.get_stats_overview(params))
        flows, matched_total = self._organization_repository.get_dashboard_impact_flows(
            DashboardImpactFlowParams(
                province=params.province,
                operational_status=params.operational_status,
                organization_type=params.organization_type,
                primary_industry_sector=params.primary_industry_sector,
                has_positive_social_impact=params.has_positive_social_impact,
                environmental_impact_area=params.environmental_impact_area,
                limit=200,
            )
        )
        return SroiReportEnvelope(
            data={
                "metric_available": False,
                "message": "SROI formula is not defined by IID yet; returning raw cohort signals only.",
                "overview": overview.model_dump(mode="json"),
                "impact_flows": [DashboardImpactFlowCell.model_validate(row).model_dump(mode="json") for row in flows],
            },
            meta={"matched_total": matched_total, "cell_count": len(flows)},
        )

    def create_custom_request(
        self,
        payload: CustomAnalysisCreateRequest,
        *,
        current_user: AuthenticatedUser | None,
    ) -> CustomAnalysisEnvelope:
        organization_id = payload.enterprise_id or (current_user.organization_id if current_user else None)
        request_id = self._repository.create_custom_request(
            payload,
            requested_by_user_id=current_user.id if current_user else None,
            organization_id=organization_id,
        )
        row = self._repository.get_custom_request(request_id)
        return CustomAnalysisEnvelope(data=CustomAnalysisRequestItem.model_validate(row))

    def list_custom_requests(
        self,
        params: CustomAnalysisListParams,
        *,
        current_user: AuthenticatedUser,
    ) -> CustomAnalysisListEnvelope:
        AuthService.ensure_roles(current_user, ["admin"])
        from backend.domain.organizations.schemas import PaginationMeta

        rows, total = self._repository.list_custom_requests(params)
        return CustomAnalysisListEnvelope(
            data=[CustomAnalysisRequestItem.model_validate(row) for row in rows],
            meta=PaginationMeta(
                total=total,
                page=params.page,
                page_size=params.page_size,
                total_pages=-(-total // params.page_size) if params.page_size else 0,
                query=params.status,
            ),
        )

    def update_custom_request(
        self,
        request_id: int,
        payload: CustomAnalysisUpdateRequest,
        *,
        current_user: AuthenticatedUser,
    ) -> CustomAnalysisEnvelope:
        AuthService.ensure_roles(current_user, ["admin"])
        row = self._repository.update_custom_request(request_id, payload, user_id=current_user.id)
        if row is None:
            raise NotFoundError("custom analysis request not found")
        return CustomAnalysisEnvelope(data=CustomAnalysisRequestItem.model_validate(row))

    def _build_slug(self, raw: str) -> str:
        normalized = normalize_lookup_key(clean_text(raw))
        if normalized is None:
            raise ConflictError("report slug is required")
        return normalized
