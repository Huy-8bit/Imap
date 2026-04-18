from __future__ import annotations

from fastapi import APIRouter

from backend.libs.database import get_postgresql, get_redis
from backend.libs.http import ok

router = APIRouter(prefix="/health", tags=["health"])


@router.get("")
async def health_check():
    """Kiểm tra trạng thái service và các dependency."""
    pg_ok = get_postgresql().ping()
    redis_ok = get_redis().ping()

    status = "ok" if (pg_ok and redis_ok) else "degraded"

    return ok(
        {
            "status": status,
            "dependencies": {
                "postgresql": "ok" if pg_ok else "unavailable",
                "redis": "ok" if redis_ok else "unavailable",
            },
        },
        message=status,
    )
