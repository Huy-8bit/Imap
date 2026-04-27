from fastapi import APIRouter

from .assessment import router as assessment_router
from .auth import router as auth_router
from .certification import router as certification_router
from .dashboard import router as dashboard_router
from .enterprises import router as enterprises_router
from .health import router as health_router
from .iid import router as iid_router
from .map import router as map_router
from .news import router as news_router
from .reports import router as reports_router
from .stats import router as stats_router
from .taxonomies import router as taxonomies_router

api_router = APIRouter()
api_router.include_router(assessment_router)
api_router.include_router(auth_router)
api_router.include_router(certification_router)
api_router.include_router(dashboard_router)
api_router.include_router(enterprises_router)
api_router.include_router(health_router)
api_router.include_router(iid_router)
api_router.include_router(map_router)
api_router.include_router(news_router)
api_router.include_router(reports_router)
api_router.include_router(stats_router)
api_router.include_router(taxonomies_router)

__all__ = ["api_router"]
