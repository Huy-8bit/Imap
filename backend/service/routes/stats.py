from __future__ import annotations

from fastapi import APIRouter, Depends

from backend.domain.organizations import InsightsSummaryService, OrganizationCatalogRepository, StatsOverviewService
from backend.domain.organizations.schemas import InsightsSummaryEnvelope, StatsOverviewEnvelope, StatsOverviewParams, stats_overview_params
from backend.libs.database import PostgreSQLClient, RedisCommands
from backend.service.config import config
from backend.service.dependencies import get_postgresql_client, get_redis_client

router = APIRouter(prefix="/stats", tags=["stats"])


@router.get("/summary", response_model=InsightsSummaryEnvelope)
async def get_insights_summary(
    params: StatsOverviewParams = Depends(stats_overview_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
    redis: RedisCommands = Depends(get_redis_client),
) -> InsightsSummaryEnvelope:
    service = InsightsSummaryService(
        OrganizationCatalogRepository(db),
        redis,
        cache_ttl_seconds=config.cache_overview_ttl_seconds,
    )
    return service.get_summary(params)


@router.get("/overview", response_model=StatsOverviewEnvelope)
async def get_stats_overview(
    params: StatsOverviewParams = Depends(stats_overview_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
    redis: RedisCommands = Depends(get_redis_client),
) -> StatsOverviewEnvelope:
    service = StatsOverviewService(
        OrganizationCatalogRepository(db),
        redis,
        cache_ttl_seconds=config.cache_overview_ttl_seconds,
    )
    return service.get_overview(params)
