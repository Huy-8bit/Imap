from __future__ import annotations

import hashlib
import json
import logging
from typing import TypeVar, BinaryIO

from pydantic import BaseModel, ValidationError

from backend.domain.auth.schemas import AuthenticatedUser
from backend.domain.auth.service import AuthService
from backend.libs.database import RedisCommands
from backend.libs.http.errors import AppError, ConflictError, NotFoundError

from .catalog_repository import OrganizationCatalogRepository
from .importer import OrganizationImportService, summary_to_dict
from .repository import OrganizationImportRepository
from .excel_parser import parse_organizations_excel
from .schemas import (
    DashboardBreakdownDimension,
    DashboardBreakdownMeta,
    DashboardBreakdownParams,
    DashboardByOrganizationTypeEnvelope,
    DashboardBySectorEnvelope,
    DashboardByProvinceEnvelope,
    DashboardGrowthBucket,
    DashboardGrowthEnvelope,
    DashboardGrowthMeta,
    DashboardGrowthParams,
    DashboardImpactFlowCell,
    DashboardImpactFlowMeta,
    DashboardImpactFlowParams,
    DashboardImpactFlowsEnvelope,
    DashboardOrganizationTypeBucket,
    DashboardProvinceBucket,
    DashboardSectorBucket,
    EnterpriseDetail,
    EnterpriseDetailEnvelope,
    EnterpriseFeaturedEnvelope,
    EnterpriseFeaturedItem,
    EnterpriseFeaturedParams,
    EnterpriseListEnvelope,
    EnterpriseListItem,
    EnterpriseListParams,
    InsightsSummaryData,
    InsightsSummaryEnvelope,
    OrgFullAssessmentSnapshot,
    OrgFullEnvelope,
    OrgFullProfile,
    EnterpriseMapEnvelope,
    EnterpriseMapFeature,
    EnterpriseMapFeatureCollection,
    EnterpriseMapFeatureProperties,
    EnterpriseMapMeta,
    EnterpriseMapParams,
    MapPinEnvelope,
    MapPinFeature,
    MapPinFeatureCollection,
    MapPinProperties,
    EnterpriseQuickEnvelope,
    EnterpriseQuickInfo,
    EnterpriseRadarData,
    EnterpriseRadarEnvelope,
    EnterpriseRadarPillarScore,
    GeoJSONPointGeometry,
    OrganizationImportEnvelope,
    OrganizationImportRecordInput,
    OrganizationImportRequest,
    OrganizationImportSummaryData,
    OrganizationUpsertData,
    OrganizationUpsertEnvelope,
    PaginationMeta,
    StatsOverviewData,
    StatsOverviewEnvelope,
    StatsOverviewMeta,
    StatsOverviewParams,
)
from .validators import RecordValidationError, clean_text

logger = logging.getLogger(__name__)
ModelT = TypeVar("ModelT", bound=BaseModel)


class DashboardBreakdownCacheBucket(BaseModel):
    bucket_code: str
    bucket_name: str
    organization_count: int
    mappable_count: int


class DashboardBreakdownCachePayload(BaseModel):
    buckets: list[DashboardBreakdownCacheBucket]
    matched_total: int


class DashboardGrowthCachePayload(BaseModel):
    buckets: list[DashboardGrowthBucket]
    matched_total: int


class DashboardImpactFlowCachePayload(BaseModel):
    cells: list[DashboardImpactFlowCell]
    matched_total: int


class EnterpriseCatalogService:
    MIN_SEARCH_QUERY_LENGTH = 2

    def __init__(self, repository: OrganizationCatalogRepository) -> None:
        self._repository = repository

    def list_enterprises(self, params: EnterpriseListParams) -> EnterpriseListEnvelope:
        if params.q is not None:
            normalized_query = clean_text(params.q)
            if normalized_query is None or len(normalized_query) < self.MIN_SEARCH_QUERY_LENGTH:
                raise AppError(
                    "search query must contain at least 2 non-space characters",
                    status_code=422,
                )
            search_params = params.model_copy(update={"q": normalized_query})
            rows, total = self._repository.search_enterprises(search_params)
            meta = PaginationMeta(
                total=total,
                page=search_params.page,
                page_size=search_params.page_size,
                total_pages=-(-total // search_params.page_size) if search_params.page_size else 0,
                query=normalized_query,
            )
        else:
            rows, total = self._repository.list_enterprises(params)
            meta = PaginationMeta(
                total=total,
                page=params.page,
                page_size=params.page_size,
                total_pages=-(-total // params.page_size) if params.page_size else 0,
                sort=params.sort.value,
                order=params.order.value,
            )
        items = [EnterpriseListItem.model_validate(row) for row in rows]
        return EnterpriseListEnvelope(data=items, meta=meta)

    def list_featured_enterprises(self, params: EnterpriseFeaturedParams) -> EnterpriseFeaturedEnvelope:
        items = [
            EnterpriseFeaturedItem.model_validate(row)
            for row in self._repository.list_featured_enterprises(params)
        ]
        return EnterpriseFeaturedEnvelope(
            data=items,
            meta={"total": len(items), "limit": params.limit},
        )

    def get_enterprise_detail(self, organization_id: int) -> EnterpriseDetailEnvelope:
        row = self._repository.get_enterprise_detail(organization_id)
        if row is None:
            raise NotFoundError("enterprise not found")
        detail = EnterpriseDetail.model_validate(row)
        return EnterpriseDetailEnvelope(data=detail)

    def get_enterprise_quick(self, organization_id: int) -> EnterpriseQuickEnvelope:
        row = self._repository.get_enterprise_quick(organization_id)
        if row is None:
            raise NotFoundError("enterprise not found")
        radar = self._build_radar_data(organization_id)
        return EnterpriseQuickEnvelope(
            data=EnterpriseQuickInfo(
                id=row["id"],
                external_code=row.get("external_code"),
                display_name=row["display_name"],
                trade_name=row.get("trade_name"),
                registered_name=row.get("registered_name"),
                province=row.get("province"),
                full_address=row.get("full_address"),
                website=row.get("website"),
                organization_type=row.get("organization_type"),
                operational_status=row.get("operational_status"),
                location_precision=row.get("location_precision"),
                radar=radar,
            )
        )

    def get_enterprise_radar(self, organization_id: int) -> EnterpriseRadarEnvelope:
        quick = self._repository.get_enterprise_quick(organization_id)
        if quick is None:
            raise NotFoundError("enterprise not found")
        return EnterpriseRadarEnvelope(data=self._build_radar_data(organization_id))

    def get_enterprise_map(self, params: EnterpriseMapParams) -> EnterpriseMapEnvelope:
        rows, matched_total, mappable_total = self._repository.get_enterprise_map(params)
        features = [
            EnterpriseMapFeature(
                geometry=GeoJSONPointGeometry.model_validate(row["geometry"]),
                properties=EnterpriseMapFeatureProperties(
                    id=row["id"],
                    external_code=row.get("external_code"),
                    display_name=row["display_name"],
                    trade_name=row.get("trade_name"),
                    registered_name=row.get("registered_name"),
                    province=row.get("province"),
                    operational_status=row.get("operational_status"),
                    organization_type=row.get("organization_type"),
                    primary_industry_sector=row.get("primary_industry_sector"),
                    has_positive_social_impact=row.get("has_positive_social_impact"),
                    environmental_impact_areas=row.get("environmental_impact_areas") or [],
                    star_rating=row.get("star_rating"),
                    location_precision=row.get("location_precision"),
                    website=row.get("website"),
                ),
            )
            for row in rows
        ]
        return EnterpriseMapEnvelope(
            data=EnterpriseMapFeatureCollection(features=features),
            meta=EnterpriseMapMeta(
                matched_total=matched_total,
                mappable_total=mappable_total,
                unmapped_total=max(matched_total - mappable_total, 0),
                returned_total=len(features),
                bbox=params.bbox,
            ),
        )

    def get_org_full(self, organization_id: int) -> OrgFullEnvelope:
        row = self._repository.get_org_full(organization_id)
        if row is None:
            raise NotFoundError("enterprise not found")

        assessment: OrgFullAssessmentSnapshot | None = None
        if row.get("submission_id") is not None:
            pillars_raw = row.get("pillars_json") or []
            assessment = OrgFullAssessmentSnapshot(
                submission_id=int(row["submission_id"]),
                has_data=True,
                overall_score=float(row["assessment_overall_score"]) if row.get("assessment_overall_score") is not None else None,
                scoring_version=row.get("scoring_version"),
                scored_at=row.get("assessment_scored_at"),
                pillars=pillars_raw if isinstance(pillars_raw, list) else [],
            )
        else:
            assessment = OrgFullAssessmentSnapshot(has_data=False)

        return OrgFullEnvelope(
            data=OrgFullProfile(
                id=row["id"],
                slug=row["slug"],
                status=row["status"],
                display_name=row["display_name"],
                trade_name=row.get("trade_name"),
                registered_name=row.get("registered_name"),
                founded_year=row.get("founded_year"),
                tax_code=row.get("tax_code"),
                ai_tags=row.get("ai_tags") or [],
                sdg_numbers=row.get("sdg_numbers") or [],
                ai_composite_score=float(row["ai_composite_score"]) if row.get("ai_composite_score") is not None else None,
                has_positive_social_impact=row.get("has_positive_social_impact"),
                star_rating=row.get("star_rating"),
                certified_at=row.get("certified_at"),
                expires_at=row.get("expires_at"),
                province=row.get("province"),
                ward_name=row.get("ward_name"),
                full_address=row.get("full_address"),
                latitude=row.get("latitude"),
                longitude=row.get("longitude"),
                organization_type=row.get("organization_type"),
                primary_industry_sector=row.get("primary_industry_sector"),
                environmental_impact_areas=row.get("environmental_impact_areas") or [],
                website=row.get("website"),
                assessment=assessment,
            )
        )

    def get_map_pins(self) -> MapPinEnvelope:
        rows = self._repository.get_map_pins()
        features = [
            MapPinFeature(
                geometry=GeoJSONPointGeometry.model_validate(row["geometry"]),
                properties=MapPinProperties(
                    id=row["id"],
                    status=row["status"],
                    primary_ai_tag=row.get("primary_ai_tag"),
                ),
            )
            for row in rows
        ]
        return MapPinEnvelope(
            data=MapPinFeatureCollection(features=features),
            meta={"total": len(features)},
        )

    def _build_radar_data(self, organization_id: int) -> EnterpriseRadarData:
        pillars = self._repository.list_assessment_pillars()
        snapshot = self._repository.get_latest_assessment_snapshot(organization_id)
        score_map = {}
        if snapshot is not None:
            for item in snapshot.get("pillars_json") or []:
                if isinstance(item, dict) and item.get("pillar_code"):
                    score_map[item["pillar_code"]] = item

        scores = [
            EnterpriseRadarPillarScore(
                pillar_code=pillar["code"],
                pillar_name=pillar["display_name"],
                score=float(score_map[pillar["code"]]["score"])
                if pillar["code"] in score_map and score_map[pillar["code"]].get("score") is not None
                else None,
            )
            for pillar in pillars
        ]
        return EnterpriseRadarData(
            enterprise_id=organization_id,
            has_data=snapshot is not None,
            overall_score=float(snapshot["overall_score"]) if snapshot and snapshot.get("overall_score") is not None else None,
            scoring_version=snapshot.get("scoring_version") if snapshot else None,
            scored_at=snapshot.get("created_at") if snapshot else None,
            pillars=scores,
        )


class OrganizationAdminService:
    SINGLE_RECORD_SOURCE_PATH = "api:/api/enterprises"
    BULK_IMPORT_SOURCE_PATH = "api:/api/enterprises/import"
    SELF_REGISTRATION_SOURCE_PATH = "api:/api/enterprises/self-registration"

    def __init__(
        self,
        import_repository: OrganizationImportRepository,
        catalog_repository: OrganizationCatalogRepository,
    ) -> None:
        self._import_service = OrganizationImportService(import_repository)
        self._catalog_service = EnterpriseCatalogService(catalog_repository)

    def upsert_enterprise(
        self,
        payload: OrganizationImportRecordInput,
        *,
        current_user: AuthenticatedUser,
    ) -> OrganizationUpsertEnvelope:
        AuthService.ensure_roles(current_user, ["admin"])
        record = payload.model_dump(by_alias=True, mode="json")
        try:
            summary, result = self._import_service.upsert_record(
                record,
                source_name=self._build_source_name(current_user, suffix="single"),
                source_path=self.SINGLE_RECORD_SOURCE_PATH,
            )
        except RecordValidationError as exc:
            raise AppError(
                "organization validation failed",
                status_code=422,
                detail={
                    "field_name": exc.field_name,
                    "error_code": exc.error_code,
                    "error_message": exc.message,
                },
            ) from exc

        if result is None:
            raise AppError(
                "organization import failed",
                status_code=422,
                detail=summary_to_dict(summary),
            )

        detail_envelope = self._catalog_service.get_enterprise_detail(result.organization_id)
        return OrganizationUpsertEnvelope(
            data=OrganizationUpsertData(
                operation=result.operation,
                summary=OrganizationImportSummaryData.model_validate(summary_to_dict(summary)),
                enterprise=detail_envelope.data,
            )
        )

    def import_enterprises(
        self,
        payload: OrganizationImportRequest,
        *,
        current_user: AuthenticatedUser,
    ) -> OrganizationImportEnvelope:
        AuthService.ensure_roles(current_user, ["admin"])
        records = [record.model_dump(by_alias=True, mode="json") for record in payload.records]
        summary = self._import_service.import_records(
            records,
            source_name=payload.source_name or self._build_source_name(current_user, suffix="bulk"),
            source_path=self.BULK_IMPORT_SOURCE_PATH,
            source_type="api",
            dry_run=payload.dry_run,
        )
        return OrganizationImportEnvelope(
            data=OrganizationImportSummaryData.model_validate(summary_to_dict(summary))
        )

    def import_enterprises_excel(
        self,
        file_obj: BinaryIO,
        *,
        source_name: str | None = None,
        dry_run: bool = False,
        current_user: AuthenticatedUser,
    ) -> OrganizationImportEnvelope:
        AuthService.ensure_roles(current_user, ["admin"])
        try:
            records = parse_organizations_excel(file_obj)
        except Exception as exc:
            raise AppError(f"Failed to parse Excel file: {exc}", status_code=400)

        summary = self._import_service.import_records(
            records,
            source_name=source_name or self._build_source_name(current_user, suffix="excel"),
            source_path="uploaded_file.xlsx",
            source_type="excel",
            dry_run=dry_run,
        )
        return OrganizationImportEnvelope(
            data=OrganizationImportSummaryData.model_validate(summary_to_dict(summary))
        )

    def self_register_enterprise(
        self,
        payload: OrganizationImportRecordInput,
        *,
        current_user: AuthenticatedUser,
    ) -> OrganizationUpsertEnvelope:
        AuthService.ensure_roles(current_user, ["enterprise"])
        if current_user.organization_id is not None:
            raise ConflictError("account already linked to an organization")

        record = payload.model_dump(by_alias=True, mode="json")
        try:
            normalized = self._import_service.normalize_record(record)
        except RecordValidationError as exc:
            raise AppError(
                "organization validation failed",
                status_code=422,
                detail={
                    "field_name": exc.field_name,
                    "error_code": exc.error_code,
                    "error_message": exc.message,
                },
            ) from exc

        existing_organization_id = self._import_service.find_existing_organization_id(normalized)
        if existing_organization_id is not None:
            active_link = self._import_service.get_active_organization_link(existing_organization_id)
            if active_link is not None and int(active_link["user_id"]) != current_user.id:
                raise ConflictError("organization already linked to another account")

        normalized.source_status = "self_submitted"
        summary, result = self._import_service.upsert_normalized_record(
            normalized,
            source_name=self._build_enterprise_source_name(current_user),
            source_path=self.SELF_REGISTRATION_SOURCE_PATH,
        )
        self._import_service.link_user_to_organization(
            user_id=current_user.id,
            organization_id=result.organization_id,
            linked_tax_code=normalized.tax_code,
        )

        detail_envelope = self._catalog_service.get_enterprise_detail(result.organization_id)
        return OrganizationUpsertEnvelope(
            data=OrganizationUpsertData(
                operation=result.operation,
                summary=OrganizationImportSummaryData.model_validate(summary_to_dict(summary)),
                enterprise=detail_envelope.data,
            )
        )

    @staticmethod
    def _build_source_name(current_user: AuthenticatedUser, *, suffix: str) -> str:
        return f"admin_api_{suffix}_user_{current_user.id}"

    @staticmethod
    def _build_enterprise_source_name(current_user: AuthenticatedUser) -> str:
        return f"enterprise_self_registration_user_{current_user.id}"


class CachedOrganizationAggregateService:
    CACHE_KEY_PREFIX = "organizations:aggregate:v1"
    CACHE_LOG_LABEL = "organizations aggregate"

    def __init__(
        self,
        repository: OrganizationCatalogRepository,
        cache: RedisCommands,
        *,
        cache_ttl_seconds: int,
    ) -> None:
        self._repository = repository
        self._cache = cache
        self._cache_ttl_seconds = cache_ttl_seconds

    @classmethod
    def canonicalize_filter_payload(cls, params: BaseModel) -> dict[str, str | bool]:
        return {
            key: value
            for key, value in params.model_dump(mode="json").items()
            if value is not None
        }

    @classmethod
    def _build_cache_key_from_payload(
        cls,
        payload: dict[str, str | bool],
        *,
        prefix: str | None = None,
    ) -> str:
        canonical = json.dumps(payload, ensure_ascii=False, sort_keys=True, separators=(",", ":"))
        digest = hashlib.sha256(canonical.encode("utf-8")).hexdigest()
        resolved_prefix = prefix or cls.CACHE_KEY_PREFIX
        return f"{resolved_prefix}:{digest}"

    def _load_from_cache(self, cache_key: str, *, model_cls: type[ModelT]) -> ModelT | None:
        try:
            cached_value = self._cache.get(cache_key)
        except Exception as exc:
            logger.warning("%s cache read failed: %s", self.CACHE_LOG_LABEL, exc)
            return None

        if cached_value is None:
            return None

        try:
            payload = json.loads(cached_value)
            return model_cls.model_validate(payload)
        except (json.JSONDecodeError, ValidationError) as exc:
            logger.warning("%s cache payload invalid: %s", self.CACHE_LOG_LABEL, exc)
            return None

    def _store_in_cache(self, cache_key: str, data: BaseModel) -> None:
        try:
            self._cache.set(
                cache_key,
                json.dumps(data.model_dump(mode="json"), sort_keys=True, separators=(",", ":")),
                ex=self._cache_ttl_seconds,
            )
        except Exception as exc:
            logger.warning("%s cache write failed: %s", self.CACHE_LOG_LABEL, exc)


class InsightsSummaryService(CachedOrganizationAggregateService):
    CACHE_KEY_PREFIX = "insights:summary:v1"
    CACHE_LOG_LABEL = "insights summary"

    def get_summary(self, params: StatsOverviewParams) -> InsightsSummaryEnvelope:
        cache_key = self._build_cache_key_from_payload(self.canonicalize_filter_payload(params))
        cached_data = self._load_from_cache(cache_key, model_cls=InsightsSummaryData)
        if cached_data is None:
            cached_data = InsightsSummaryData.model_validate(
                self._repository.get_insights_summary(params)
            )
            self._store_in_cache(cache_key, cached_data)

        return InsightsSummaryEnvelope(
            data=cached_data,
            meta=StatsOverviewMeta(cache_ttl_seconds=self._cache_ttl_seconds),
        )


class StatsOverviewService(CachedOrganizationAggregateService):
    CACHE_KEY_PREFIX = "stats:overview:v1"
    CACHE_LOG_LABEL = "stats overview"

    def get_overview(self, params: StatsOverviewParams) -> StatsOverviewEnvelope:
        cache_key = self.build_cache_key(params)
        cached_data = self._load_from_cache(cache_key, model_cls=StatsOverviewData)
        if cached_data is None:
            cached_data = StatsOverviewData.model_validate(self._repository.get_stats_overview(params))
            self._store_in_cache(cache_key, cached_data)

        return StatsOverviewEnvelope(
            data=cached_data,
            meta=StatsOverviewMeta(cache_ttl_seconds=self._cache_ttl_seconds),
        )

    @classmethod
    def build_cache_key(cls, params: StatsOverviewParams) -> str:
        return cls._build_cache_key_from_payload(cls.canonicalize_filter_payload(params))


class DashboardBreakdownService(CachedOrganizationAggregateService):
    CACHE_KEY_PREFIX = "dashboard:breakdown:v1"
    CACHE_LOG_LABEL = "dashboard breakdown"

    def get_by_province(self, params: DashboardBreakdownParams) -> DashboardByProvinceEnvelope:
        dimension = DashboardBreakdownDimension.PROVINCE
        cached_payload, cache_hit = self._get_breakdown_payload(dimension, params)

        return DashboardByProvinceEnvelope(
            data=[
                DashboardProvinceBucket(
                    province_code=row.bucket_code,
                    province_name=row.bucket_name,
                    organization_count=row.organization_count,
                    mappable_count=row.mappable_count,
                )
                for row in cached_payload.buckets
            ],
            meta=self._build_breakdown_meta(dimension, params, cached_payload, cache_hit),
        )

    def get_by_sector(self, params: DashboardBreakdownParams) -> DashboardBySectorEnvelope:
        dimension = DashboardBreakdownDimension.PRIMARY_INDUSTRY_SECTOR
        cached_payload, cache_hit = self._get_breakdown_payload(dimension, params)

        return DashboardBySectorEnvelope(
            data=[
                DashboardSectorBucket(
                    primary_industry_sector_code=row.bucket_code,
                    primary_industry_sector_name=row.bucket_name,
                    organization_count=row.organization_count,
                    mappable_count=row.mappable_count,
                )
                for row in cached_payload.buckets
            ],
            meta=self._build_breakdown_meta(dimension, params, cached_payload, cache_hit),
        )

    def get_by_organization_type(
        self,
        params: DashboardBreakdownParams,
    ) -> DashboardByOrganizationTypeEnvelope:
        dimension = DashboardBreakdownDimension.ORGANIZATION_TYPE
        cached_payload, cache_hit = self._get_breakdown_payload(dimension, params)

        return DashboardByOrganizationTypeEnvelope(
            data=[
                DashboardOrganizationTypeBucket(
                    organization_type_code=row.bucket_code,
                    organization_type_name=row.bucket_name,
                    organization_count=row.organization_count,
                    mappable_count=row.mappable_count,
                )
                for row in cached_payload.buckets
            ],
            meta=self._build_breakdown_meta(dimension, params, cached_payload, cache_hit),
        )

    def get_growth(self, params: DashboardGrowthParams) -> DashboardGrowthEnvelope:
        cache_key = self._build_cache_key_from_payload(
            self.canonicalize_filter_payload(params),
            prefix=f"{self.CACHE_KEY_PREFIX}:growth",
        )
        cached_payload = self._load_from_cache(cache_key, model_cls=DashboardGrowthCachePayload)
        cache_hit = cached_payload is not None
        if cached_payload is None:
            rows, matched_total = self._repository.get_dashboard_growth(params)
            cached_payload = DashboardGrowthCachePayload(
                buckets=[DashboardGrowthBucket.model_validate(row) for row in rows],
                matched_total=matched_total,
            )
            self._store_in_cache(cache_key, cached_payload)

        return DashboardGrowthEnvelope(
            data=cached_payload.buckets,
            meta=DashboardGrowthMeta(
                matched_total=cached_payload.matched_total,
                year_count=len(cached_payload.buckets),
                filters_applied=self.canonicalize_filter_payload(params),
                cache_hit=cache_hit,
                cache_ttl_seconds=self._cache_ttl_seconds,
            ),
        )

    def get_impact_flows(self, params: DashboardImpactFlowParams) -> DashboardImpactFlowsEnvelope:
        cache_key = self._build_cache_key_from_payload(
            self.canonicalize_filter_payload(params),
            prefix=f"{self.CACHE_KEY_PREFIX}:impact_flows",
        )
        cached_payload = self._load_from_cache(cache_key, model_cls=DashboardImpactFlowCachePayload)
        cache_hit = cached_payload is not None
        if cached_payload is None:
            rows, matched_total = self._repository.get_dashboard_impact_flows(params)
            cached_payload = DashboardImpactFlowCachePayload(
                cells=[DashboardImpactFlowCell.model_validate(row) for row in rows],
                matched_total=matched_total,
            )
            self._store_in_cache(cache_key, cached_payload)

        return DashboardImpactFlowsEnvelope(
            data=cached_payload.cells,
            meta=DashboardImpactFlowMeta(
                matched_total=cached_payload.matched_total,
                cell_count=len(cached_payload.cells),
                filters_applied=self.canonicalize_filter_payload(params),
                cache_hit=cache_hit,
                cache_ttl_seconds=self._cache_ttl_seconds,
            ),
        )

    @classmethod
    def build_cache_key(
        cls,
        dimension: DashboardBreakdownDimension,
        params: DashboardBreakdownParams,
    ) -> str:
        return cls._build_cache_key_from_payload(
            cls.canonicalize_filter_payload(params),
            prefix=f"{cls.CACHE_KEY_PREFIX}:{dimension.value}",
        )

    def _get_breakdown_payload(
        self,
        dimension: DashboardBreakdownDimension,
        params: DashboardBreakdownParams,
    ) -> tuple[DashboardBreakdownCachePayload, bool]:
        cache_key = self.build_cache_key(dimension, params)
        cached_payload = self._load_from_cache(cache_key, model_cls=DashboardBreakdownCachePayload)
        if cached_payload is not None:
            return cached_payload, True

        rows, matched_total = self._repository.get_dashboard_breakdown(params, dimension=dimension)
        payload = DashboardBreakdownCachePayload(
            buckets=[DashboardBreakdownCacheBucket.model_validate(row) for row in rows],
            matched_total=matched_total,
        )
        self._store_in_cache(cache_key, payload)
        return payload, False

    def _build_breakdown_meta(
        self,
        dimension: DashboardBreakdownDimension,
        params: DashboardBreakdownParams,
        payload: DashboardBreakdownCachePayload,
        cache_hit: bool,
    ) -> DashboardBreakdownMeta:
        return DashboardBreakdownMeta(
            group_by=dimension.value,
            matched_total=payload.matched_total,
            bucket_count=len(payload.buckets),
            filters_applied=self.canonicalize_filter_payload(params),
            cache_hit=cache_hit,
            cache_ttl_seconds=self._cache_ttl_seconds,
        )
