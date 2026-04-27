from __future__ import annotations

from fastapi import APIRouter, Depends

from backend.domain.organizations import DashboardBreakdownService, OrganizationCatalogRepository
from backend.domain.organizations.schemas import (
    DashboardBreakdownParams,
    DashboardByProvinceEnvelope,
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
