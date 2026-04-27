from __future__ import annotations

from fastapi import APIRouter, Depends, Path

from backend.domain.auth.schemas import AuthenticatedUser
from backend.domain.certification import CertificationRepository, CertificationService
from backend.domain.certification.schemas import (
    CertificationApplyRequest,
    CertificationDetailEnvelope,
    CertificationDirectoryEnvelope,
    CertificationDirectoryParams,
    CertificationMutationEnvelope,
    CertificationReviewRequest,
    CertificationUpgradeRequest,
    certification_directory_params,
)
from backend.libs.database import PostgreSQLClient
from backend.service.dependencies import get_optional_current_user, get_postgresql_client, require_roles

router = APIRouter(prefix="/certification", tags=["certification"])


@router.get("/directory", response_model=CertificationDirectoryEnvelope)
async def get_certification_directory(
    params: CertificationDirectoryParams = Depends(certification_directory_params),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> CertificationDirectoryEnvelope:
    return CertificationService(CertificationRepository(db)).list_directory(params)


@router.post("/apply", response_model=CertificationMutationEnvelope)
async def apply_certification(
    payload: CertificationApplyRequest,
    user: AuthenticatedUser = Depends(require_roles("enterprise")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> CertificationMutationEnvelope:
    return CertificationService(CertificationRepository(db)).apply(payload, current_user=user)


@router.get("/{enterprise_id}", response_model=CertificationDetailEnvelope)
async def get_certification_detail(
    enterprise_id: int = Path(..., ge=1),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> CertificationDetailEnvelope:
    return CertificationService(CertificationRepository(db)).get_detail(enterprise_id)


@router.put("/{application_id}/review", response_model=CertificationMutationEnvelope)
async def review_certification(
    payload: CertificationReviewRequest,
    application_id: int = Path(..., ge=1),
    user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> CertificationMutationEnvelope:
    return CertificationService(CertificationRepository(db)).review(
        application_id,
        payload,
        current_user=user,
    )


@router.put("/{certification_id}/upgrade", response_model=CertificationMutationEnvelope)
async def upgrade_certification(
    payload: CertificationUpgradeRequest,
    certification_id: int = Path(..., ge=1),
    user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> CertificationMutationEnvelope:
    return CertificationService(CertificationRepository(db)).upgrade(
        certification_id,
        payload,
        current_user=user,
    )
