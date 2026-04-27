from __future__ import annotations

import hashlib
import json
import logging
from typing import TypeVar

from pydantic import BaseModel, ValidationError

from backend.libs.database import RedisCommands
from backend.libs.http.errors import AppError, NotFoundError

from .catalog_repository import OrganizationCatalogRepository
from .schemas import (
    DashboardBreakdownDimension,
    DashboardBreakdownMeta,
    DashboardBreakdownParams,
    DashboardByProvinceEnvelope,
    DashboardProvinceBucket,
    EnterpriseDetail,
    EnterpriseDetailEnvelope,
    EnterpriseListEnvelope,
    EnterpriseListItem,
    EnterpriseListParams,
    EnterpriseMapEnvelope,
    EnterpriseMapFeature,
    EnterpriseMapFeatureCollection,
    EnterpriseMapFeatureProperties,
    EnterpriseMapMeta,
    EnterpriseMapParams,
    EnterpriseSearchParams,
    GeoJSONPointGeometry,
    PaginationMeta,
    StatsOverviewData,
    StatsOverviewEnvelope,
    StatsOverviewMeta,
    StatsOverviewParams,
)
from .validators import clean_text

logger = logging.getLogger(__name__)
ModelT = TypeVar("ModelT", bound=BaseModel)


class DashboardByProvinceCachePayload(BaseModel):
    buckets: list[DashboardProvinceBucket]
    matched_total: int


class EnterpriseCatalogService:
    MIN_SEARCH_QUERY_LENGTH = 2

    def __init__(self, repository: OrganizationCatalogRepository) -> None:
        self._repository = repository

    def list_enterprises(self, params: EnterpriseListParams) -> EnterpriseListEnvelope:
        rows, total = self._repository.list_enterprises(params)
        items = [EnterpriseListItem.model_validate(row) for row in rows]
        meta = PaginationMeta(
            total=total,
            page=params.page,
            page_size=params.page_size,
            total_pages=-(-total // params.page_size) if params.page_size else 0,
            sort=params.sort.value,
            order=params.order.value,
        )
        return EnterpriseListEnvelope(data=items, meta=meta)

    def search_enterprises(self, params: EnterpriseSearchParams) -> EnterpriseListEnvelope:
        normalized_query = clean_text(params.q)
        if normalized_query is None or len(normalized_query) < self.MIN_SEARCH_QUERY_LENGTH:
            raise AppError(
                "search query must contain at least 2 non-space characters",
                status_code=422,
            )

        normalized_params = params.model_copy(update={"q": normalized_query})
        rows, total = self._repository.search_enterprises(normalized_params)
        items = [EnterpriseListItem.model_validate(row) for row in rows]
        meta = PaginationMeta(
            total=total,
            page=normalized_params.page,
            page_size=normalized_params.page_size,
            total_pages=-(-total // normalized_params.page_size) if normalized_params.page_size else 0,
            query=normalized_query,
        )
        return EnterpriseListEnvelope(data=items, meta=meta)

    def get_enterprise_detail(self, organization_id: int) -> EnterpriseDetailEnvelope:
        row = self._repository.get_enterprise_detail(organization_id)
        if row is None:
            raise NotFoundError("enterprise not found")
        detail = EnterpriseDetail.model_validate(row)
        return EnterpriseDetailEnvelope(data=detail)

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
        filters_applied = self.canonicalize_filter_payload(params)
        cache_key = self.build_cache_key(dimension, params)
        cache_hit = False
        cached_payload = self._load_from_cache(cache_key, model_cls=DashboardByProvinceCachePayload)
        if cached_payload is None:
            rows, matched_total = self._repository.get_dashboard_breakdown(params, dimension=dimension)
            cached_payload = DashboardByProvinceCachePayload(
                buckets=[
                    DashboardProvinceBucket(
                        province_code=row["bucket_code"],
                        province_name=row["bucket_name"],
                        organization_count=row["organization_count"],
                        mappable_count=row["mappable_count"],
                    )
                    for row in rows
                ],
                matched_total=matched_total,
            )
            self._store_in_cache(cache_key, cached_payload)
        else:
            cache_hit = True

        return DashboardByProvinceEnvelope(
            data=cached_payload.buckets,
            meta=DashboardBreakdownMeta(
                group_by=dimension.value,
                matched_total=cached_payload.matched_total,
                bucket_count=len(cached_payload.buckets),
                filters_applied=filters_applied,
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
