from __future__ import annotations

from enum import StrEnum


class TaxonomyName(StrEnum):
    PROVINCES = "provinces"
    ORGANIZATION_TYPES = "organization_types"
    OPERATIONAL_STATUSES = "operational_statuses"
    INDUSTRY_SECTORS = "industry_sectors"
    ENVIRONMENTAL_IMPACT_AREAS = "environmental_impact_areas"
    PRODUCT_TYPES = "product_types"
    IMPACT_ENTITY_TYPES = "impact_entity_types"
    SDGS = "sdgs"
    CERTIFICATION_LEVELS = "certification_levels"
    USER_ROLES = "user_roles"


TAXONOMY_TABLES: dict[TaxonomyName, str] = {
    TaxonomyName.PROVINCES: "provinces",
    TaxonomyName.ORGANIZATION_TYPES: "organization_types",
    TaxonomyName.OPERATIONAL_STATUSES: "operational_statuses",
    TaxonomyName.INDUSTRY_SECTORS: "industry_sectors",
    TaxonomyName.ENVIRONMENTAL_IMPACT_AREAS: "environmental_impact_areas",
    TaxonomyName.PRODUCT_TYPES: "product_types",
    TaxonomyName.IMPACT_ENTITY_TYPES: "impact_entity_types",
    TaxonomyName.SDGS: "sdgs",
    TaxonomyName.CERTIFICATION_LEVELS: "certification_levels",
    TaxonomyName.USER_ROLES: "user_roles",
}

PUBLIC_TAXONOMIES: tuple[TaxonomyName, ...] = (
    TaxonomyName.PROVINCES,
    TaxonomyName.ORGANIZATION_TYPES,
    TaxonomyName.OPERATIONAL_STATUSES,
    TaxonomyName.INDUSTRY_SECTORS,
    TaxonomyName.ENVIRONMENTAL_IMPACT_AREAS,
    TaxonomyName.PRODUCT_TYPES,
    TaxonomyName.IMPACT_ENTITY_TYPES,
    TaxonomyName.SDGS,
    TaxonomyName.CERTIFICATION_LEVELS,
    TaxonomyName.USER_ROLES,
)
