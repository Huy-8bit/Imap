from __future__ import annotations

from fastapi import APIRouter, Depends, Path

from backend.domain.auth.schemas import AuthenticatedUser
from backend.domain.organizations import (
    EnterpriseCatalogService,
    OrganizationAdminService,
    OrganizationCatalogRepository,
    OrganizationImportRepository,
)
from backend.domain.organizations.schemas import (
    EnterpriseDetailEnvelope,
    EnterpriseFeaturedEnvelope,
    EnterpriseFeaturedParams,
    EnterpriseListEnvelope,
    EnterpriseListParams,
    EnterpriseQuickEnvelope,
    EnterpriseRadarEnvelope,
    EnterpriseSearchParams,
    OrganizationImportEnvelope,
    OrganizationImportRecordInput,
    OrganizationImportRequest,
    OrganizationUpsertEnvelope,
    enterprise_featured_params,
    enterprise_list_params,
    enterprise_search_params,
)
from backend.libs.database import PostgreSQLClient
from backend.service.dependencies import get_postgresql_client, require_roles

router = APIRouter(prefix="/enterprises", tags=["enterprises"])


@router.get("", response_model=EnterpriseListEnvelope)
async def list_enterprises(
    params: EnterpriseListParams = Depends(enterprise_list_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> EnterpriseListEnvelope:
    service = EnterpriseCatalogService(OrganizationCatalogRepository(db))
    return service.list_enterprises(params)


@router.post("", response_model=OrganizationUpsertEnvelope)
async def upsert_enterprise(
    payload: OrganizationImportRecordInput,
    user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> OrganizationUpsertEnvelope:
    service = OrganizationAdminService(
        OrganizationImportRepository(db),
        OrganizationCatalogRepository(db),
    )
    return service.upsert_enterprise(payload, current_user=user)


@router.get("/search", response_model=EnterpriseListEnvelope)
async def search_enterprises(
    params: EnterpriseSearchParams = Depends(enterprise_search_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> EnterpriseListEnvelope:
    service = EnterpriseCatalogService(OrganizationCatalogRepository(db))
    return service.search_enterprises(params)


@router.post("/import", response_model=OrganizationImportEnvelope)
async def import_enterprises(
    payload: OrganizationImportRequest,
    user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> OrganizationImportEnvelope:
    service = OrganizationAdminService(
        OrganizationImportRepository(db),
        OrganizationCatalogRepository(db),
    )
    return service.import_enterprises(payload, current_user=user)


@router.get("/featured", response_model=EnterpriseFeaturedEnvelope)
async def list_featured_enterprises(
    params: EnterpriseFeaturedParams = Depends(enterprise_featured_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> EnterpriseFeaturedEnvelope:
    service = EnterpriseCatalogService(OrganizationCatalogRepository(db))
    return service.list_featured_enterprises(params)


@router.get("/{organization_id}/quick", response_model=EnterpriseQuickEnvelope)
async def get_enterprise_quick(
    organization_id: int = Path(..., ge=1),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> EnterpriseQuickEnvelope:
    service = EnterpriseCatalogService(OrganizationCatalogRepository(db))
    return service.get_enterprise_quick(organization_id)


@router.get("/{organization_id}/radar", response_model=EnterpriseRadarEnvelope)
async def get_enterprise_radar(
    organization_id: int = Path(..., ge=1),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> EnterpriseRadarEnvelope:
    service = EnterpriseCatalogService(OrganizationCatalogRepository(db))
    return service.get_enterprise_radar(organization_id)


@router.get("/{organization_id}", response_model=EnterpriseDetailEnvelope)
async def get_enterprise_detail(
    organization_id: int = Path(..., ge=1),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> EnterpriseDetailEnvelope:
    service = EnterpriseCatalogService(OrganizationCatalogRepository(db))
    return service.get_enterprise_detail(organization_id)
