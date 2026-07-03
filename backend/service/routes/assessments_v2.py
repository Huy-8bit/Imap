from __future__ import annotations

from fastapi import APIRouter, Depends, Path

from backend.domain.assessment import AssessmentRepository, AssessmentService
from backend.domain.assessment.schemas import AssessmentDetailEnvelope, AssessmentDraftInput
from backend.domain.auth.schemas import AuthenticatedUser
from backend.libs.database import PostgreSQLClient
from backend.service.dependencies import get_postgresql_client, require_roles

router = APIRouter(prefix="/assessments", tags=["assessments-v2"])


@router.get("/{assessment_id}", response_model=AssessmentDetailEnvelope)
async def get_assessment_detail(
    assessment_id: int = Path(..., ge=1),
    user: AuthenticatedUser = Depends(require_roles("enterprise", "investor", "admin")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> AssessmentDetailEnvelope:
    return AssessmentService(AssessmentRepository(db)).get_assessment_detail(
        assessment_id,
        current_user=user,
    )


@router.patch("/{assessment_id}", response_model=AssessmentDetailEnvelope)
async def save_assessment_draft(
    payload: AssessmentDraftInput,
    assessment_id: int = Path(..., ge=1),
    user: AuthenticatedUser = Depends(require_roles("enterprise")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> AssessmentDetailEnvelope:
    return AssessmentService(AssessmentRepository(db)).save_draft(
        assessment_id,
        payload,
        current_user=user,
    )
