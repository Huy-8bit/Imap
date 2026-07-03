from __future__ import annotations

from fastapi import APIRouter, Depends, Path

from backend.domain.organizations.admin_repository import OrgAdminRepository
from backend.domain.organizations.claim_repository import OrgClaimRepository
from backend.domain.organizations.schemas import (
    AdminQueueClaimItem,
    AdminQueueCertItem,
    AdminQueueData,
    AdminQueueEnvelope,
    CertIssueData,
    CertIssueEnvelope,
    CertIssueInput,
    ScoreOverrideData,
    ScoreOverrideEnvelope,
    ScoreOverrideInput,
)
from backend.domain.auth.schemas import AuthenticatedUser
from backend.libs.database import PostgreSQLClient
from backend.service.dependencies import get_postgresql_client, require_roles

router = APIRouter(prefix="/admin", tags=["admin"])

_FIVE_STAR = 5


@router.get("/queue", response_model=AdminQueueEnvelope)
async def get_admin_queue(
    user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> AdminQueueEnvelope:
    claim_repo = OrgClaimRepository(db)
    admin_repo = OrgAdminRepository(db)

    pending_claims = [
        AdminQueueClaimItem.model_validate(row)
        for row in claim_repo.list_pending_claims()
    ]
    pending_certs = [
        AdminQueueCertItem.model_validate(row)
        for row in admin_repo.list_pending_certifications()
    ]

    return AdminQueueEnvelope(
        data=AdminQueueData(
            pending_claims=pending_claims,
            pending_certifications=pending_certs,
            total_pending=len(pending_claims) + len(pending_certs),
        )
    )


@router.post("/orgs/{organization_id}/score", response_model=ScoreOverrideEnvelope)
async def override_org_score(
    payload: ScoreOverrideInput,
    organization_id: int = Path(..., ge=1),
    user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> ScoreOverrideEnvelope:
    old_score, audit_id = OrgAdminRepository(db).override_score(
        organization_id,
        payload.score,
        actor_id=user.id,
        actor_role=user.role_code,
        actor_email=user.email,
        reason=payload.reason,
        session_id=user.session_id,
    )
    return ScoreOverrideEnvelope(
        data=ScoreOverrideData(
            org_id=organization_id,
            old_score=old_score,
            new_score=payload.score,
            audit_id=audit_id,
        )
    )


@router.post("/certifications/{organization_id}", response_model=CertIssueEnvelope)
async def issue_certification(
    payload: CertIssueInput,
    organization_id: int = Path(..., ge=1),
    user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> CertIssueEnvelope:
    pending_second = payload.star_rating == _FIVE_STAR
    status, audit_id = OrgAdminRepository(db).issue_certification(
        organization_id,
        payload.star_rating,
        certified_at=payload.certified_at,
        expires_at=payload.expires_at,
        actor_id=user.id,
        actor_role=user.role_code,
        actor_email=user.email,
        notes=payload.notes,
        session_id=user.session_id,
        pending_second_approval=pending_second,
    )
    return CertIssueEnvelope(
        data=CertIssueData(
            org_id=organization_id,
            star_rating=payload.star_rating,
            status=status,
            certified_at=payload.certified_at,
            expires_at=payload.expires_at,
            requires_second_approval=pending_second,
            audit_id=audit_id,
        ),
        meta={"message": "awaiting_second_approver"} if pending_second else None,
    )


@router.post("/certifications/{organization_id}/approve-second", response_model=CertIssueEnvelope)
async def approve_second_certification(
    organization_id: int = Path(..., ge=1),
    user: AuthenticatedUser = Depends(require_roles("admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> CertIssueEnvelope:
    audit_id = OrgAdminRepository(db).approve_second_certification(
        organization_id,
        actor_id=user.id,
        actor_role=user.role_code,
        actor_email=user.email,
        session_id=user.session_id,
    )
    return CertIssueEnvelope(
        data=CertIssueData(
            org_id=organization_id,
            star_rating=_FIVE_STAR,
            status="certified",
            certified_at=None,
            expires_at=None,
            requires_second_approval=False,
            audit_id=audit_id,
        )
    )
