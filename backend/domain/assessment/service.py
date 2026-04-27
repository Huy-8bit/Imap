from __future__ import annotations

from collections import defaultdict

from backend.domain.auth.schemas import AuthenticatedUser
from backend.domain.auth.service import AuthService
from backend.domain.organizations.schemas import PaginationMeta
from backend.libs.http.errors import AppError

from .repository import AssessmentRepository
from .schemas import (
    AssessmentAnswerInput,
    AssessmentHistoryEnvelope,
    AssessmentPillarItem,
    AssessmentPillarQuestionGroup,
    AssessmentQuestionBankEnvelope,
    AssessmentQuestionItem,
    AssessmentQuestionOptionItem,
    AssessmentResultData,
    AssessmentResultEnvelope,
    AssessmentScorePillar,
    AssessmentSubmissionHistoryItem,
    AssessmentSubmitRequest,
)

SCORING_VERSION = "generic_v1"


class AssessmentService:
    def __init__(self, repository: AssessmentRepository) -> None:
        self._repository = repository

    def get_question_bank(self) -> AssessmentQuestionBankEnvelope:
        rows = self._repository.list_question_bank_rows()
        groups: list[AssessmentPillarQuestionGroup] = []
        pillar_map: dict[int, AssessmentPillarQuestionGroup] = {}
        question_map: dict[int, AssessmentQuestionItem] = {}

        for row in rows:
            pillar_id = int(row["pillar_id"])
            group = pillar_map.get(pillar_id)
            if group is None:
                group = AssessmentPillarQuestionGroup(
                    pillar=AssessmentPillarItem(
                        id=pillar_id,
                        code=row["pillar_code"],
                        display_name=row["pillar_name"],
                        description=row.get("pillar_description"),
                        sort_order=int(row["pillar_sort_order"]),
                    ),
                    questions=[],
                )
                pillar_map[pillar_id] = group
                groups.append(group)

            if row.get("question_id") is None:
                continue

            question_id = int(row["question_id"])
            question = question_map.get(question_id)
            if question is None:
                question = AssessmentQuestionItem(
                    id=question_id,
                    code=row["question_code"],
                    prompt=row["question_prompt"],
                    help_text=row.get("question_help_text"),
                    question_type=row["question_type"],
                    is_required=bool(row["is_required"]),
                    sort_order=int(row["question_sort_order"]),
                    config=row.get("question_config") or {},
                    options=[],
                )
                question_map[question_id] = question
                group.questions.append(question)

            if row.get("option_id") is not None:
                question.options.append(
                    AssessmentQuestionOptionItem(
                        id=int(row["option_id"]),
                        code=row["option_code"],
                        label=row["option_label"],
                        weight=float(row["option_weight"]) if row.get("option_weight") is not None else None,
                        sort_order=int(row["option_sort_order"]),
                    )
                )

        return AssessmentQuestionBankEnvelope(data=groups, meta={"pillar_count": len(groups)})

    def submit(
        self,
        payload: AssessmentSubmitRequest,
        *,
        current_user: AuthenticatedUser,
    ) -> AssessmentResultEnvelope:
        organization_id = payload.enterprise_id or current_user.organization_id
        if organization_id is None:
            raise AppError("enterprise link is required for assessment submission", status_code=422)

        AuthService.ensure_organization_access(current_user, organization_id)
        answers = payload.answers
        question_ids = [answer.question_id for answer in answers]
        question_rows = self._repository.get_questions_with_options(question_ids)
        question_map, option_map = self._index_questions(question_rows)
        missing_question_ids = sorted(set(question_ids) - set(question_map))
        if missing_question_ids:
            raise AppError(
                "assessment question not found",
                status_code=422,
                detail={"question_ids": missing_question_ids},
            )

        persisted_answers = []
        pillar_score_inputs: dict[int, list[float]] = defaultdict(list)
        for answer in answers:
            question = question_map[answer.question_id]
            score = self._compute_answer_score(answer, question, option_map.get(answer.question_id, {}))
            if score is not None:
                pillar_score_inputs[question["pillar_id"]].append(score)
            persisted_answers.append(
                {
                    "question_id": answer.question_id,
                    "selected_option_ids": answer.selected_option_ids,
                    "text_value": answer.text_value,
                    "number_value": answer.number_value,
                    "boolean_value": answer.boolean_value,
                    "computed_score": score,
                }
            )

        pillars = self._repository.list_pillars()
        pillar_scores = []
        radar_payload = []
        for pillar in pillars:
            raw_scores = pillar_score_inputs.get(int(pillar["id"]), [])
            avg_score = round(sum(raw_scores) / len(raw_scores) * 100, 2) if raw_scores else None
            pillar_scores.append({"pillar_id": int(pillar["id"]), "score": avg_score})
            radar_payload.append(
                {
                    "pillar_code": pillar["code"],
                    "pillar_name": pillar["display_name"],
                    "score": avg_score,
                }
            )

        scored_values = [row["score"] for row in pillar_scores if row["score"] is not None]
        overall_score = round(sum(scored_values) / len(scored_values), 2) if scored_values else None
        summary_json = {
            "pillars": radar_payload,
            "scoring_version": SCORING_VERSION,
            "scored_question_count": len([answer for answer in persisted_answers if answer["computed_score"] is not None]),
            "submitted_answer_count": len(persisted_answers),
        }
        submission_id = self._repository.create_submission_bundle(
            organization_id=organization_id,
            submitted_by_user_id=current_user.id,
            notes=payload.notes,
            overall_score=overall_score,
            scoring_version=SCORING_VERSION,
            answers=persisted_answers,
            pillar_scores=pillar_scores,
            summary_json=summary_json,
        )
        return AssessmentResultEnvelope(
            data=AssessmentResultData(
                enterprise_id=organization_id,
                latest_submission_id=submission_id,
                has_data=overall_score is not None or bool(persisted_answers),
                overall_score=overall_score,
                scoring_version=SCORING_VERSION,
                scored_at=None,
                pillars=[
                    AssessmentScorePillar(
                        pillar_code=item["pillar_code"],
                        pillar_name=item["pillar_name"],
                        score=item["score"],
                    )
                    for item in radar_payload
                ],
                summary=summary_json,
            )
        )

    def get_results(self, enterprise_id: int, *, current_user: AuthenticatedUser) -> AssessmentResultEnvelope:
        AuthService.ensure_organization_access(current_user, enterprise_id)
        return AssessmentResultEnvelope(data=self._build_result_data(enterprise_id))

    def get_history(
        self,
        enterprise_id: int,
        *,
        current_user: AuthenticatedUser,
        page: int = 1,
        page_size: int = 20,
    ) -> AssessmentHistoryEnvelope:
        AuthService.ensure_organization_access(current_user, enterprise_id)
        rows, total = self._repository.list_history(enterprise_id, page=page, page_size=page_size)
        return AssessmentHistoryEnvelope(
            data=[AssessmentSubmissionHistoryItem.model_validate(row) for row in rows],
            meta=PaginationMeta(
                total=total,
                page=page,
                page_size=page_size,
                total_pages=-(-total // page_size) if page_size else 0,
            ),
        )

    def _build_result_data(self, enterprise_id: int) -> AssessmentResultData:
        pillars = self._repository.list_pillars()
        snapshot = self._repository.get_latest_snapshot(enterprise_id)
        score_map = {}
        if snapshot is not None:
            for item in snapshot.get("pillars_json") or []:
                if isinstance(item, dict):
                    score_map[item.get("pillar_code")] = item

        return AssessmentResultData(
            enterprise_id=enterprise_id,
            latest_submission_id=int(snapshot["submission_id"]) if snapshot is not None else None,
            has_data=snapshot is not None,
            overall_score=float(snapshot["overall_score"]) if snapshot and snapshot.get("overall_score") is not None else None,
            scoring_version=snapshot.get("scoring_version") if snapshot else None,
            scored_at=snapshot.get("created_at") if snapshot else None,
            pillars=[
                AssessmentScorePillar(
                    pillar_code=pillar["code"],
                    pillar_name=pillar["display_name"],
                    score=float(score_map[pillar["code"]]["score"])
                    if pillar["code"] in score_map and score_map[pillar["code"]].get("score") is not None
                    else None,
                )
                for pillar in pillars
            ],
            summary=snapshot.get("summary_json") if snapshot else {},
        )

    def _index_questions(self, rows: list[dict]) -> tuple[dict[int, dict], dict[int, dict[int, dict]]]:
        question_map: dict[int, dict] = {}
        option_map: dict[int, dict[int, dict]] = defaultdict(dict)
        for row in rows:
            question_id = int(row["question_id"])
            question_map[question_id] = {
                "question_id": question_id,
                "question_type": row["question_type"],
                "pillar_id": int(row["pillar_id"]),
                "config": row.get("question_config") or {},
            }
            if row.get("option_id") is not None:
                option_map[question_id][int(row["option_id"])] = {
                    "weight": float(row["option_weight"]) if row.get("option_weight") is not None else None,
                }
        return question_map, option_map

    def _compute_answer_score(
        self,
        answer: AssessmentAnswerInput,
        question: dict,
        options: dict[int, dict],
    ) -> float | None:
        question_type = question["question_type"]
        if question_type in {"single_choice", "multi_choice"}:
            weights = [
                options[option_id]["weight"]
                for option_id in answer.selected_option_ids
                if option_id in options and options[option_id]["weight"] is not None
            ]
            if not weights:
                return None
            return round(sum(weights) / len(weights), 4)

        if question_type == "boolean":
            if answer.boolean_value is None:
                return None
            return 1.0 if answer.boolean_value else 0.0

        if question_type in {"scale", "number"}:
            if answer.number_value is None:
                return None
            config = question["config"]
            scale_max = float(config.get("scale_max") or config.get("max") or 0)
            scale_min = float(config.get("scale_min") or config.get("min") or 0)
            if scale_max <= scale_min:
                return None
            normalized = (answer.number_value - scale_min) / (scale_max - scale_min)
            return round(max(0.0, min(normalized, 1.0)), 4)

        return None
