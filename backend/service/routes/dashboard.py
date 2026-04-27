from __future__ import annotations

from fastapi import APIRouter, Depends

from backend.domain.organizations import DashboardBreakdownService, OrganizationCatalogRepository
from backend.domain.organizations.schemas import (
    DashboardBreakdownParams,
    DashboardByOrganizationTypeEnvelope,
    DashboardBySectorEnvelope,
    DashboardByProvinceEnvelope,
    DashboardGrowthEnvelope,
    DashboardGrowthParams,
    DashboardImpactFlowParams,
    DashboardImpactFlowsEnvelope,
    dashboard_growth_params,
    dashboard_impact_flow_params,
    dashboard_breakdown_params,
)
from backend.libs.database import PostgreSQLClient, RedisCommands
from backend.service.config import config
from backend.service.dependencies import get_postgresql_client, get_redis_client

router = APIRouter(prefix="/dashboard", tags=["dashboard"])


@router.get("/by-province", response_model=DashboardByProvinceEnvelope)
async def get_dashboard_by_province(
    params: DashboardBreakdownParams = Depends(dashboard_breakdown_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
    redis: RedisCommands = Depends(get_redis_client),
) -> DashboardByProvinceEnvelope:
    service = DashboardBreakdownService(
        OrganizationCatalogRepository(db),
        redis,
        cache_ttl_seconds=config.cache_overview_ttl_seconds,
    )
    return service.get_by_province(params)


@router.get("/by-sector", response_model=DashboardBySectorEnvelope)
async def get_dashboard_by_sector(
    params: DashboardBreakdownParams = Depends(dashboard_breakdown_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
    redis: RedisCommands = Depends(get_redis_client),
) -> DashboardBySectorEnvelope:
    service = DashboardBreakdownService(
        OrganizationCatalogRepository(db),
        redis,
        cache_ttl_seconds=config.cache_overview_ttl_seconds,
    )
    return service.get_by_sector(params)


@router.get("/by-organization-type", response_model=DashboardByOrganizationTypeEnvelope)
async def get_dashboard_by_organization_type(
    params: DashboardBreakdownParams = Depends(dashboard_breakdown_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
    redis: RedisCommands = Depends(get_redis_client),
) -> DashboardByOrganizationTypeEnvelope:
    service = DashboardBreakdownService(
        OrganizationCatalogRepository(db),
        redis,
        cache_ttl_seconds=config.cache_overview_ttl_seconds,
    )
    return service.get_by_organization_type(params)


@router.get("/growth", response_model=DashboardGrowthEnvelope)
async def get_dashboard_growth(
    params: DashboardGrowthParams = Depends(dashboard_growth_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
    redis: RedisCommands = Depends(get_redis_client),
) -> DashboardGrowthEnvelope:
    service = DashboardBreakdownService(
        OrganizationCatalogRepository(db),
        redis,
        cache_ttl_seconds=config.cache_overview_ttl_seconds,
    )
    return service.get_growth(params)


@router.get("/impact-flows", response_model=DashboardImpactFlowsEnvelope)
async def get_dashboard_impact_flows(
    params: DashboardImpactFlowParams = Depends(dashboard_impact_flow_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
    redis: RedisCommands = Depends(get_redis_client),
) -> DashboardImpactFlowsEnvelope:
    service = DashboardBreakdownService(
        OrganizationCatalogRepository(db),
        redis,
        cache_ttl_seconds=config.cache_overview_ttl_seconds,
    )
    return service.get_impact_flows(params)
