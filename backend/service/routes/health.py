from __future__ import annotations

from fastapi import APIRouter
from pydantic import BaseModel

from backend.libs.database import get_postgresql, get_redis

router = APIRouter(prefix="/health", tags=["health"])


class HealthDependencies(BaseModel):
    postgresql: str
    redis: str


class HealthData(BaseModel):
    status: str
    dependencies: HealthDependencies


class HealthEnvelope(BaseModel):
    data: HealthData
    meta: dict | None = None
    error: str | None = None


@router.get("", response_model=HealthEnvelope)
async def health_check() -> HealthEnvelope:
    pg_ok = get_postgresql().ping()
    redis_ok = get_redis().ping()
    return HealthEnvelope(
        data=HealthData(
            status="ok" if (pg_ok and redis_ok) else "degraded",
            dependencies=HealthDependencies(
                postgresql="ok" if pg_ok else "unavailable",
                redis="ok" if redis_ok else "unavailable",
            ),
        )
    )
