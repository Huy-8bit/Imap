from fastapi import APIRouter

from .enterprises import router as enterprises_router
from .health import router as health_router
from .map import router as map_router
from .stats import router as stats_router
from .taxonomies import router as taxonomies_router

api_router = APIRouter()
api_router.include_router(enterprises_router)
api_router.include_router(health_router)
api_router.include_router(map_router)
api_router.include_router(stats_router)
api_router.include_router(taxonomies_router)

__all__ = ["api_router"]
