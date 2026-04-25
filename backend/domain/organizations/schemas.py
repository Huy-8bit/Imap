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
