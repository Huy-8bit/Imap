from __future__ import annotations

from fastapi import APIRouter, Depends, Path

from backend.domain.assessment import AssessmentRepository, AssessmentService
from backend.domain.assessment.schemas import (
    AssessmentHistoryEnvelope,
    AssessmentQuestionBankEnvelope,
    AssessmentResultEnvelope,
    AssessmentSubmitRequest,
)
from backend.domain.auth.schemas import AuthenticatedUser
from backend.libs.database import PostgreSQLClient
from backend.service.dependencies import (
    PaginationParams,
    get_postgresql_client,
    pagination_params,
    require_roles,
)

router = APIRouter(prefix="/assessment", tags=["assessment"])


@router.get("/questions", response_model=AssessmentQuestionBankEnvelope)
async def get_assessment_questions(
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> AssessmentQuestionBankEnvelope:
    return AssessmentService(AssessmentRepository(db)).get_question_bank()


@router.post("/submit", response_model=AssessmentResultEnvelope)
async def submit_assessment(
    payload: AssessmentSubmitRequest,
    user: AuthenticatedUser = Depends(require_roles("enterprise")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> AssessmentResultEnvelope:
    return AssessmentService(AssessmentRepository(db)).submit(payload, current_user=user)


@router.get("/{enterprise_id}/results", response_model=AssessmentResultEnvelope)
async def get_assessment_results(
    enterprise_id: int = Path(..., ge=1),
    user: AuthenticatedUser = Depends(require_roles("enterprise", "premium")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> AssessmentResultEnvelope:
    return AssessmentService(AssessmentRepository(db)).get_results(enterprise_id, current_user=user)


@router.get("/{enterprise_id}/history", response_model=AssessmentHistoryEnvelope)
async def get_assessment_history(
    enterprise_id: int = Path(..., ge=1),
    pagination: PaginationParams = Depends(pagination_params),
    user: AuthenticatedUser = Depends(require_roles("enterprise", "premium")),
    db: PostgreSQLClient = Depends(get_postgresql_client),
) -> AssessmentHistoryEnvelope:
    return AssessmentService(AssessmentRepository(db)).get_history(
        enterprise_id,
        current_user=user,
        page=pagination.page,
        page_size=pagination.page_size,
    )
