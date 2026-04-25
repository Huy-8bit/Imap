from __future__ import annotations

from fastapi import APIRouter, Depends

from backend.domain.organizations import EnterpriseCatalogService, OrganizationCatalogRepository
from backend.domain.organizations.schemas import EnterpriseMapEnvelope, EnterpriseMapParams, enterprise_map_params
from backend.libs.database import PostgreSQLClient
from backend.service.dependencies import get_postgresql_client

router = APIRouter(prefix="/map", tags=["map"])


@router.get("/enterprises", response_model=EnterpriseMapEnvelope)
async def get_map_enterprises(
    params: EnterpriseMapParams = Depends(enterprise_map_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> EnterpriseMapEnvelope:
    service = EnterpriseCatalogService(OrganizationCatalogRepository(db))
    return service.get_enterprise_map(params)
