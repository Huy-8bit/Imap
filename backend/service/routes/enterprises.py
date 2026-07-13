from __future__ import annotations

import io
from fastapi import APIRouter, Depends, Path, UploadFile, File, Form

from backend.domain.auth.schemas import AuthenticatedUser
from backend.domain.organizations import (
    EnterpriseCatalogService,
    OrganizationAdminService,
    OrganizationCatalogRepository,
    OrganizationImportRepository,
)
from backend.domain.organizations.claim_repository import OrgClaimRepository
from backend.domain.organizations.claim_service import OrgClaimService
from backend.domain.organizations.schemas import (
    EnterpriseDetailEnvelope,
    EnterpriseFeaturedEnvelope,
    EnterpriseFeaturedParams,
    EnterpriseListEnvelope,
    EnterpriseListParams,
    EnterpriseQuickEnvelope,
    EnterpriseRadarEnvelope,
    OrgClaimEnvelope,
    OrgClaimInput,
    OrgFullEnvelope,
    OrganizationImportEnvelope,
    OrganizationImportRecordInput,
    OrganizationImportRequest,
    OrganizationUpsertEnvelope,
    enterprise_featured_params,
    enterprise_list_params,
)
from backend.libs.database import PostgreSQLClient, RedisCommands
from backend.service.dependencies import get_postgresql_client, require_roles, get_redis_client

router = APIRouter(tags=["orgs"])


@router.get("", response_model=EnterpriseListEnvelope)
async def list_orgs(
    params: EnterpriseListParams = Depends(enterprise_list_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> EnterpriseListEnvelope:
    service = EnterpriseCatalogService(OrganizationCatalogRepository(db))
    return service.list_enterprises(params)


@router.post("", response_model=OrganizationUpsertEnvelope)
async def upsert_org(
    payload: OrganizationImportRecordInput,
    user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> OrganizationUpsertEnvelope:
    service = OrganizationAdminService(
        OrganizationImportRepository(db),
        OrganizationCatalogRepository(db),
    )
    return service.upsert_enterprise(payload, current_user=user)


@router.post("/import", response_model=OrganizationImportEnvelope)
async def import_orgs(
    payload: OrganizationImportRequest,
    user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> OrganizationImportEnvelope:
    service = OrganizationAdminService(
        OrganizationImportRepository(db),
        OrganizationCatalogRepository(db),
    )
    return service.import_enterprises(payload, current_user=user)


@router.post("/import-excel", response_model=OrganizationImportEnvelope)
async def import_orgs_excel(
    file: UploadFile = File(...),
    dry_run: bool = Form(False),
    user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
    redis: RedisCommands = Depends(get_redis_client),
) -> OrganizationImportEnvelope:
    content = await file.read()
    file_obj = io.BytesIO(content)

    service = OrganizationAdminService(
        OrganizationImportRepository(db),
        OrganizationCatalogRepository(db),
    )

    envelope = service.import_enterprises_excel(
        file_obj,
        source_name=file.filename,
        dry_run=dry_run,
        current_user=user,
    )

    if not dry_run:
        try:
            r = redis.require()
            keys = []
            for pattern in ["insights:*", "stats:*", "dashboard:*"]:
                keys.extend(r.keys(pattern))
            if keys:
                r.delete(*keys)
        except Exception:
            pass

    return envelope


@router.post("/self-registration", response_model=OrganizationUpsertEnvelope)
async def self_register_org(
    payload: OrganizationImportRecordInput,
    user: AuthenticatedUser = Depends(require_roles("enterprise")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> OrganizationUpsertEnvelope:
    service = OrganizationAdminService(
        OrganizationImportRepository(db),
        OrganizationCatalogRepository(db),
    )
    return service.self_register_enterprise(payload, current_user=user)


@router.get("/featured", response_model=EnterpriseFeaturedEnvelope)
async def list_featured_orgs(
    params: EnterpriseFeaturedParams = Depends(enterprise_featured_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> EnterpriseFeaturedEnvelope:
    service = EnterpriseCatalogService(OrganizationCatalogRepository(db))
    return service.list_featured_enterprises(params)


@router.get("/{organization_id}/quick", response_model=EnterpriseQuickEnvelope)
async def get_org_quick(
    organization_id: int = Path(..., ge=1),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> EnterpriseQuickEnvelope:
    service = EnterpriseCatalogService(OrganizationCatalogRepository(db))
    return service.get_enterprise_quick(organization_id)


@router.get("/{organization_id}/radar", response_model=EnterpriseRadarEnvelope)
async def get_org_radar(
    organization_id: int = Path(..., ge=1),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> EnterpriseRadarEnvelope:
    service = EnterpriseCatalogService(OrganizationCatalogRepository(db))
    return service.get_enterprise_radar(organization_id)


@router.get("/{organization_id}/full", response_model=OrgFullEnvelope)
async def get_org_full(
    organization_id: int = Path(..., ge=1),
    user: AuthenticatedUser = Depends(require_roles("investor", "admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> OrgFullEnvelope:
    service = EnterpriseCatalogService(OrganizationCatalogRepository(db))
    return service.get_org_full(organization_id)


@router.post("/{organization_id}/claim", response_model=OrgClaimEnvelope)
async def claim_org(
    payload: OrgClaimInput,
    organization_id: int = Path(..., ge=1),
    user: AuthenticatedUser = Depends(require_roles("enterprise")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> OrgClaimEnvelope:
    return OrgClaimService(OrgClaimRepository(db)).submit_claim(
        organization_id,
        payload,
        current_user=user,
    )


@router.get("/{organization_id}", response_model=EnterpriseDetailEnvelope)
async def get_org_detail(
    organization_id: int = Path(..., ge=1),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> EnterpriseDetailEnvelope:
    service = EnterpriseCatalogService(OrganizationCatalogRepository(db))
    return service.get_enterprise_detail(organization_id)
