from fastapi import APIRouter

from .admin import router as admin_router
from .assessment import router as assessment_router
from .assessments_v2 import router as assessments_v2_router
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

# Auth
api_router.include_router(auth_router)

# Health + Taxonomies (public infra)
api_router.include_router(health_router)
api_router.include_router(taxonomies_router)

# Organizations catalog — /api/v1/orgs (primary) + /api/enterprises (deprecated)
api_router.include_router(enterprises_router, prefix="/v1/orgs")
api_router.include_router(enterprises_router, prefix="/enterprises", deprecated=True)

# Map — /api/v1/map/* (versioned) + /api/map/* (legacy)
api_router.include_router(map_router, prefix="/v1")
api_router.include_router(map_router)

# Insights — /api/v1/insights/summary (versioned) + /api/stats/overview (legacy)
api_router.include_router(stats_router, prefix="/v1/insights")
api_router.include_router(stats_router)

# Dashboard (public breakdowns)
api_router.include_router(dashboard_router)

# Assessment — /api/v1/assessments/* (v2) + /api/assessment/* (legacy)
api_router.include_router(assessments_v2_router, prefix="/v1")
api_router.include_router(assessment_router)

# Certification
api_router.include_router(certification_router)

# Admin (requires admin JWT)
api_router.include_router(admin_router, prefix="/v1")

# CMS / Content
api_router.include_router(news_router)
api_router.include_router(iid_router)
api_router.include_router(reports_router)

__all__ = ["api_router"]
