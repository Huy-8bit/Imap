from __future__ import annotations

from datetime import datetime, date

from pydantic import BaseModel, Field

from backend.domain.organizations.schemas import PaginationMeta


class AssessmentPillarItem(BaseModel):
    id: int
    code: str
    display_name: str
    description: str | None = None
    sort_order: int


class AssessmentQuestionOptionItem(BaseModel):
    id: int
    code: str
    label: str
    weight: float | None = None
    sort_order: int


class AssessmentQuestionItem(BaseModel):
    id: int
    code: str
    prompt: str
    help_text: str | None = None
    question_type: str
    is_required: bool
    sort_order: int
    config: dict = Field(default_factory=dict)
    options: list[AssessmentQuestionOptionItem] = Field(default_factory=list)


class AssessmentPillarQuestionGroup(BaseModel):
    pillar: AssessmentPillarItem
    questions: list[AssessmentQuestionItem] = Field(default_factory=list)


class AssessmentQuestionBankEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: list[AssessmentPillarQuestionGroup]
    meta: dict[str, int]


class AssessmentAnswerInput(BaseModel):
    question_id: int = Field(ge=1)
    selected_option_ids: list[int] = Field(default_factory=list)
    text_value: str | None = None
    number_value: float | None = None
    boolean_value: bool | None = None


class AssessmentSubmitRequest(BaseModel):
    enterprise_id: int | None = Field(default=None, alias="enterpriseId", ge=1)
    notes: str | None = None
    answers: list[AssessmentAnswerInput] = Field(default_factory=list)


class AssessmentScorePillar(BaseModel):
    pillar_code: str
    pillar_name: str
    score: float | None = None


class AssessmentResultData(BaseModel):
    enterprise_id: int
    latest_submission_id: int | None = None
    has_data: bool
    overall_score: float | None = None
    scoring_version: str | None = None
    scored_at: datetime | None = None
    pillars: list[AssessmentScorePillar] = Field(default_factory=list)
    summary: dict = Field(default_factory=dict)


class AssessmentResultEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: AssessmentResultData
    meta: dict | None = None


class AssessmentSubmissionHistoryItem(BaseModel):
    submission_id: int
    status: str
    overall_score: float | None = None
    scoring_version: str
    submitted_at: datetime
    notes: str | None = None


class AssessmentHistoryEnvelope(BaseModel):
    success: bool = True
    message: str = "ok"
    data: list[AssessmentSubmissionHistoryItem]
    meta: PaginationMeta
