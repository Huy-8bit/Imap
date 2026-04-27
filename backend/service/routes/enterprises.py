from __future__ import annotations

from fastapi import APIRouter, Depends, Path

from backend.domain.organizations import EnterpriseCatalogService, OrganizationCatalogRepository
from backend.domain.organizations.schemas import (
    EnterpriseDetailEnvelope,
    EnterpriseListEnvelope,
    EnterpriseListParams,
    EnterpriseSearchParams,
    enterprise_list_params,
    enterprise_search_params,
)
from backend.libs.database import PostgreSQLClient
from backend.service.dependencies import get_postgresql_client

router = APIRouter(prefix="/enterprises", tags=["enterprises"])


@router.get("", response_model=EnterpriseListEnvelope)
async def list_enterprises(
    params: EnterpriseListParams = Depends(enterprise_list_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> EnterpriseListEnvelope:
    service = EnterpriseCatalogService(OrganizationCatalogRepository(db))
    return service.list_enterprises(params)


@router.get("/search", response_model=EnterpriseListEnvelope)
async def search_enterprises(
    params: EnterpriseSearchParams = Depends(enterprise_search_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> EnterpriseListEnvelope:
    service = EnterpriseCatalogService(OrganizationCatalogRepository(db))
    return service.search_enterprises(params)


@router.get("/{organization_id}", response_model=EnterpriseDetailEnvelope)
async def get_enterprise_detail(
    organization_id: int = Path(..., ge=1),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> EnterpriseDetailEnvelope:
    service = EnterpriseCatalogService(OrganizationCatalogRepository(db))
    return service.get_enterprise_detail(organization_id)
