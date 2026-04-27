from __future__ import annotations

from datetime import datetime
from enum import StrEnum
from typing import Literal

from fastapi import Query
from pydantic import BaseModel, Field

from backend.libs.http.errors import AppError


class SortOrder(StrEnum):
    ASC = "asc"
    DESC = "desc"


class EnterpriseListSort(StrEnum):
    NAME = "name"
    FOUNDED_YEAR = "foundedYear"
    CREATED_AT = "createdAt"
    UPDATED_AT = "updatedAt"


class TaxonomySummary(BaseModel):
    id: int
    code: str
    display_name: str


class EnterpriseFilterParams(BaseModel):
    province: str | None = None
    operational_status: str | None = None
    organization_type: str | None = None
    primary_industry_sector: str | None = None
    has_positive_social_impact: bool | None = None
    environmental_impact_area: str | None = None


class EnterpriseListParams(EnterpriseFilterParams):
    page: int = Field(default=1, ge=1)
    page_size: int = Field(default=20, ge=1, le=100)
    sort: EnterpriseListSort = EnterpriseListSort.NAME
    order: SortOrder = SortOrder.ASC


class EnterpriseSearchParams(BaseModel):
    q: str
    page: int = Field(default=1, ge=1)
    page_size: int = Field(default=20, ge=1, le=100)


class MapBoundingBox(BaseModel):
    min_longitude: float = Field(ge=-180, le=180)
    min_latitude: float = Field(ge=-90, le=90)
    max_longitude: float = Field(ge=-180, le=180)
    max_latitude: float = Field(ge=-90, le=90)


class EnterpriseMapParams(EnterpriseFilterParams):
    bbox: MapBoundingBox | None = None


class StatsOverviewParams(EnterpriseFilterParams):
    pass


class DashboardBreakdownParams(EnterpriseFilterParams):
    pass


class EnterpriseFeaturedParams(BaseModel):
    limit: int = Field(default=5, ge=1, le=20)


class DashboardGrowthParams(EnterpriseFilterParams):
    year_from: int | None = Field(default=None, ge=1800, le=2200)
    year_to: int | None = Field(default=None, ge=1800, le=2200)


class DashboardImpactFlowParams(EnterpriseFilterParams):
    limit: int = Field(default=500, ge=1, le=2000)


class DashboardBreakdownDimension(StrEnum):
    PROVINCE = "province"
    ORGANIZATION_TYPE = "organization_type"
    PRIMARY_INDUSTRY_SECTOR = "primary_industry_sector"


class PaginationMeta(BaseModel):
    total: int
    page: int
    page_size: int
    total_pages: int
    sort: str | None = None
    order: str | None = None
    query: str | None = None


class EnterpriseListItem(BaseModel):
    id: int
    external_code: str | None = None
    display_name: str
    trade_name: str | None = None
    registered_name: str | None = None
    founded_year: int | None = None
    province: TaxonomySummary | None = None
    ward_name: str | None = None
    operational_status: TaxonomySummary | None = None
    organization_type: TaxonomySummary | None = None
    primary_industry_sector: TaxonomySummary | None = None
    environmental_impact_areas: list[TaxonomySummary] = Field(default_factory=list)
    has_positive_social_impact: bool | None = None
    impact_entity_type: TaxonomySummary | None = None
    star_rating: int | None = None
    is_featured: bool
    website: str | None = None
    location_precision: str | None = None
    source_status: str


class EnterpriseGeneralInfo(BaseModel):
    trade_name: str | None = None
    registered_name: str | None = None
    founded_year: int | None = None
    tax_code: str | None = None
    operational_status: TaxonomySummary | None = None
    closed_year: int | None = None


class EnterpriseClassificationInfo(BaseModel):
    organization_type: TaxonomySummary | None = None
    primary_industry_sector: TaxonomySummary | None = None
    other_industry_sectors: list[TaxonomySummary] = Field(default_factory=list)
    environmental_impact_areas: list[TaxonomySummary] = Field(default_factory=list)
    has_positive_social_impact: bool | None = None
    primary_product_type: TaxonomySummary | None = None
    other_product_type: TaxonomySummary | None = None
    impact_entity_type: TaxonomySummary | None = None
    star_rating: int | None = None


class EnterpriseContactsInfo(BaseModel):
    website: str | None = None
    email: str | None = None
    phone: str | None = None


class EnterpriseLocationInfo(BaseModel):
    province: TaxonomySummary | None = None
    ward_name: str | None = None
    full_address: str | None = None
    latitude: float | None = None
    longitude: float | None = None
    location_precision: str | None = None
    geocode_source: str | None = None


class EnterpriseDetail(BaseModel):
    id: int
    external_code: str | None = None
    display_name: str
    source_status: str
    is_featured: bool
    created_at: datetime
    updated_at: datetime
    general: EnterpriseGeneralInfo
    classification: EnterpriseClassificationInfo
    contacts: EnterpriseContactsInfo
    location: EnterpriseLocationInfo


class EnterpriseListEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: list[EnterpriseListItem]
    meta: PaginationMeta


class EnterpriseDetailEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: EnterpriseDetail
    meta: dict | None = None


class EnterpriseRadarPillarScore(BaseModel):
    pillar_code: str
    pillar_name: str
    score: float | None = None


class EnterpriseRadarData(BaseModel):
    enterprise_id: int
    has_data: bool
    overall_score: float | None = None
    scoring_version: str | None = None
    scored_at: datetime | None = None
    pillars: list[EnterpriseRadarPillarScore] = Field(default_factory=list)


class EnterpriseRadarEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: EnterpriseRadarData
    meta: dict | None = None


class EnterpriseQuickInfo(BaseModel):
    id: int
    external_code: str | None = None
    display_name: str
    trade_name: str | None = None
    registered_name: str | None = None
    province: TaxonomySummary | None = None
    full_address: str | None = None
    website: str | None = None
    organization_type: TaxonomySummary | None = None
    operational_status: TaxonomySummary | None = None
    location_precision: str | None = None
    radar: EnterpriseRadarData


class EnterpriseQuickEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: EnterpriseQuickInfo
    meta: dict | None = None


class EnterpriseFeaturedItem(BaseModel):
    id: int
    external_code: str | None = None
    display_name: str
    trade_name: str | None = None
    registered_name: str | None = None
    province: TaxonomySummary | None = None
    organization_type: TaxonomySummary | None = None
    primary_industry_sector: TaxonomySummary | None = None
    star_rating: int | None = None
    website: str | None = None
    is_featured: bool


class EnterpriseFeaturedEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: list[EnterpriseFeaturedItem]
    meta: dict[str, int]


class GeoJSONPointGeometry(BaseModel):
    type: Literal["Point"]
    coordinates: tuple[float, float]


class EnterpriseMapFeatureProperties(BaseModel):
    id: int
    external_code: str | None = None
    display_name: str
    trade_name: str | None = None
    registered_name: str | None = None
    province: TaxonomySummary | None = None
    operational_status: TaxonomySummary | None = None
    organization_type: TaxonomySummary | None = None
    primary_industry_sector: TaxonomySummary | None = None
    has_positive_social_impact: bool | None = None
    environmental_impact_areas: list[TaxonomySummary] = Field(default_factory=list)
    star_rating: int | None = None
    location_precision: str | None = None
    website: str | None = None


class EnterpriseMapFeature(BaseModel):
    type: Literal["Feature"] = "Feature"
    geometry: GeoJSONPointGeometry
    properties: EnterpriseMapFeatureProperties


class EnterpriseMapFeatureCollection(BaseModel):
    type: Literal["FeatureCollection"] = "FeatureCollection"
    features: list[EnterpriseMapFeature] = Field(default_factory=list)


class EnterpriseMapMeta(BaseModel):
    matched_total: int
    mappable_total: int
    unmapped_total: int
    returned_total: int
    bbox: MapBoundingBox | None = None


class EnterpriseMapEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: EnterpriseMapFeatureCollection
    meta: EnterpriseMapMeta


class StatsOverviewData(BaseModel):
    total_organizations: int
    active_organizations: int
    provinces_count: int
    social_impact_organizations: int
    environmental_impact_organizations: int
    mappable_organizations: int


class StatsOverviewMeta(BaseModel):
    cache_ttl_seconds: int


class StatsOverviewEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: StatsOverviewData
    meta: StatsOverviewMeta


class DashboardProvinceBucket(BaseModel):
    province_code: str
    province_name: str
    organization_count: int
    mappable_count: int


class DashboardSectorBucket(BaseModel):
    primary_industry_sector_code: str
    primary_industry_sector_name: str
    organization_count: int
    mappable_count: int


class DashboardOrganizationTypeBucket(BaseModel):
    organization_type_code: str
    organization_type_name: str
    organization_count: int
    mappable_count: int


class DashboardBreakdownMeta(BaseModel):
    group_by: str
    matched_total: int
    bucket_count: int
    filters_applied: dict[str, str | bool]
    cache_hit: bool
    cache_ttl_seconds: int


class DashboardByProvinceEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: list[DashboardProvinceBucket]
    meta: DashboardBreakdownMeta


class DashboardBySectorEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: list[DashboardSectorBucket]
    meta: DashboardBreakdownMeta


class DashboardByOrganizationTypeEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: list[DashboardOrganizationTypeBucket]
    meta: DashboardBreakdownMeta


class DashboardGrowthBucket(BaseModel):
    founded_year: int
    total_count: int
    active_count: int
    inactive_count: int
    social_impact_count: int


class DashboardGrowthMeta(BaseModel):
    matched_total: int
    year_count: int
    filters_applied: dict[str, str | bool | int]
    cache_hit: bool
    cache_ttl_seconds: int


class DashboardGrowthEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: list[DashboardGrowthBucket]
    meta: DashboardGrowthMeta


class DashboardImpactFlowCell(BaseModel):
    primary_industry_sector: TaxonomySummary | None = None
    environmental_impact_area: TaxonomySummary | None = None
    province: TaxonomySummary | None = None
    organization_type: TaxonomySummary | None = None
    organization_count: int
    social_impact_count: int
    mappable_count: int


class DashboardImpactFlowMeta(BaseModel):
    matched_total: int
    cell_count: int
    filters_applied: dict[str, str | bool | int]
    cache_hit: bool
    cache_ttl_seconds: int


class DashboardImpactFlowsEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: list[DashboardImpactFlowCell]
    meta: DashboardImpactFlowMeta


def enterprise_list_params(
    page: int = Query(default=1, ge=1),
    page_size: int = Query(default=20, ge=1, le=100),
    sort: EnterpriseListSort = Query(default=EnterpriseListSort.NAME),
    order: SortOrder = Query(default=SortOrder.ASC),
    province: str | None = Query(default=None),
    operational_status: str | None = Query(default=None, alias="operationalStatus"),
    organization_type: str | None = Query(default=None, alias="organizationType"),
    primary_industry_sector: str | None = Query(default=None, alias="primaryIndustrySector"),
    has_positive_social_impact: bool | None = Query(default=None, alias="hasPositiveSocialImpact"),
    environmental_impact_area: str | None = Query(default=None, alias="environmentalImpactArea"),
) -> EnterpriseListParams:
    return EnterpriseListParams(
        page=page,
        page_size=page_size,
        sort=sort,
        order=order,
        province=province,
        operational_status=operational_status,
        organization_type=organization_type,
        primary_industry_sector=primary_industry_sector,
        has_positive_social_impact=has_positive_social_impact,
        environmental_impact_area=environmental_impact_area,
    )


def enterprise_featured_params(
    limit: int = Query(default=5, ge=1, le=20),
) -> EnterpriseFeaturedParams:
    return EnterpriseFeaturedParams(limit=limit)


def enterprise_search_params(
    q: str = Query(..., min_length=1),
    page: int = Query(default=1, ge=1),
    page_size: int = Query(default=20, ge=1, le=100),
) -> EnterpriseSearchParams:
    return EnterpriseSearchParams(
        q=q,
        page=page,
        page_size=page_size,
    )


def enterprise_map_params(
    province: str | None = Query(default=None),
    operational_status: str | None = Query(default=None, alias="operationalStatus"),
    organization_type: str | None = Query(default=None, alias="organizationType"),
    primary_industry_sector: str | None = Query(default=None, alias="primaryIndustrySector"),
    has_positive_social_impact: bool | None = Query(default=None, alias="hasPositiveSocialImpact"),
    environmental_impact_area: str | None = Query(default=None, alias="environmentalImpactArea"),
    bbox: str | None = Query(default=None),
) -> EnterpriseMapParams:
    return EnterpriseMapParams(
        province=province,
        operational_status=operational_status,
        organization_type=organization_type,
        primary_industry_sector=primary_industry_sector,
        has_positive_social_impact=has_positive_social_impact,
        environmental_impact_area=environmental_impact_area,
        bbox=parse_map_bounding_box(bbox),
    )


def stats_overview_params(
    province: str | None = Query(default=None),
    operational_status: str | None = Query(default=None, alias="operationalStatus"),
    organization_type: str | None = Query(default=None, alias="organizationType"),
    primary_industry_sector: str | None = Query(default=None, alias="primaryIndustrySector"),
    has_positive_social_impact: bool | None = Query(default=None, alias="hasPositiveSocialImpact"),
    environmental_impact_area: str | None = Query(default=None, alias="environmentalImpactArea"),
) -> StatsOverviewParams:
    return StatsOverviewParams(
        province=province,
        operational_status=operational_status,
        organization_type=organization_type,
        primary_industry_sector=primary_industry_sector,
        has_positive_social_impact=has_positive_social_impact,
        environmental_impact_area=environmental_impact_area,
    )


def dashboard_breakdown_params(
    province: str | None = Query(default=None),
    operational_status: str | None = Query(default=None, alias="operationalStatus"),
    organization_type: str | None = Query(default=None, alias="organizationType"),
    primary_industry_sector: str | None = Query(default=None, alias="primaryIndustrySector"),
    has_positive_social_impact: bool | None = Query(default=None, alias="hasPositiveSocialImpact"),
    environmental_impact_area: str | None = Query(default=None, alias="environmentalImpactArea"),
) -> DashboardBreakdownParams:
    return DashboardBreakdownParams(
        province=province,
        operational_status=operational_status,
        organization_type=organization_type,
        primary_industry_sector=primary_industry_sector,
        has_positive_social_impact=has_positive_social_impact,
        environmental_impact_area=environmental_impact_area,
    )


def dashboard_growth_params(
    province: str | None = Query(default=None),
    operational_status: str | None = Query(default=None, alias="operationalStatus"),
    organization_type: str | None = Query(default=None, alias="organizationType"),
    primary_industry_sector: str | None = Query(default=None, alias="primaryIndustrySector"),
    has_positive_social_impact: bool | None = Query(default=None, alias="hasPositiveSocialImpact"),
    environmental_impact_area: str | None = Query(default=None, alias="environmentalImpactArea"),
    year_from: int | None = Query(default=None, alias="yearFrom", ge=1800, le=2200),
    year_to: int | None = Query(default=None, alias="yearTo", ge=1800, le=2200),
) -> DashboardGrowthParams:
    return DashboardGrowthParams(
        province=province,
        operational_status=operational_status,
        organization_type=organization_type,
        primary_industry_sector=primary_industry_sector,
        has_positive_social_impact=has_positive_social_impact,
        environmental_impact_area=environmental_impact_area,
        year_from=year_from,
        year_to=year_to,
    )


def dashboard_impact_flow_params(
    province: str | None = Query(default=None),
    operational_status: str | None = Query(default=None, alias="operationalStatus"),
    organization_type: str | None = Query(default=None, alias="organizationType"),
    primary_industry_sector: str | None = Query(default=None, alias="primaryIndustrySector"),
    has_positive_social_impact: bool | None = Query(default=None, alias="hasPositiveSocialImpact"),
    environmental_impact_area: str | None = Query(default=None, alias="environmentalImpactArea"),
    limit: int = Query(default=500, ge=1, le=2000),
) -> DashboardImpactFlowParams:
    return DashboardImpactFlowParams(
        province=province,
        operational_status=operational_status,
        organization_type=organization_type,
        primary_industry_sector=primary_industry_sector,
        has_positive_social_impact=has_positive_social_impact,
        environmental_impact_area=environmental_impact_area,
        limit=limit,
    )


def parse_map_bounding_box(raw_bbox: str | None) -> MapBoundingBox | None:
    if raw_bbox is None:
        return None

    normalized = raw_bbox.strip()
    if normalized == "":
        return None

    parts = [part.strip() for part in normalized.split(",")]
    if len(parts) != 4:
        raise AppError(
            "bbox must contain 4 comma-separated numbers in the order minLng,minLat,maxLng,maxLat",
            status_code=422,
        )

    try:
        min_longitude, min_latitude, max_longitude, max_latitude = (float(part) for part in parts)
    except ValueError as exc:
        raise AppError(
            "bbox must contain 4 comma-separated numbers in the order minLng,minLat,maxLng,maxLat",
            status_code=422,
        ) from exc

    if min_longitude >= max_longitude or min_latitude >= max_latitude:
        raise AppError(
            "bbox min values must be smaller than max values",
            status_code=422,
        )

    return MapBoundingBox(
        min_longitude=min_longitude,
        min_latitude=min_latitude,
        max_longitude=max_longitude,
        max_latitude=max_latitude,
    )
