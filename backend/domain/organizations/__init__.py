from __future__ import annotations

from typing import Any

__all__ = [
    "DashboardBreakdownService",
    "EnterpriseCatalogService",
    "OrganizationAdminService",
    "OrganizationCatalogRepository",
    "OrganizationImportRepository",
    "OrganizationImportService",
    "StatsOverviewService",
]


def __getattr__(name: str) -> Any:
    if name == "OrganizationCatalogRepository":
        from .catalog_repository import OrganizationCatalogRepository

        return OrganizationCatalogRepository
    if name == "OrganizationImportService":
        from .importer import OrganizationImportService

        return OrganizationImportService
    if name == "OrganizationImportRepository":
        from .repository import OrganizationImportRepository

        return OrganizationImportRepository
    if name in {
        "DashboardBreakdownService",
        "EnterpriseCatalogService",
        "OrganizationAdminService",
        "StatsOverviewService",
    }:
        from .service import DashboardBreakdownService, EnterpriseCatalogService, OrganizationAdminService, StatsOverviewService

        services = {
            "DashboardBreakdownService": DashboardBreakdownService,
            "EnterpriseCatalogService": EnterpriseCatalogService,
            "OrganizationAdminService": OrganizationAdminService,
            "StatsOverviewService": StatsOverviewService,
        }
        return services[name]
    raise AttributeError(f"module {__name__!r} has no attribute {name!r}")
