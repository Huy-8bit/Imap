from __future__ import annotations

import json
from typing import Any

from backend.libs.database import PostgreSQLClient


class AssessmentRepository:
    def __init__(self, db: PostgreSQLClient) -> None:
        self._db = db

    def list_pillars(self) -> list[dict[str, Any]]:
        return self._db.fetch_all(
            """
            SELECT id, code, display_name, description, sort_order
            FROM assessment_pillars
            WHERE is_active IS TRUE
            ORDER BY sort_order ASC, id ASC
            """
        )

    def list_question_bank_rows(self) -> list[dict[str, Any]]:
        return self._db.fetch_all(
            """
            SELECT
                ap.id AS pillar_id,
                ap.code AS pillar_code,
                ap.display_name AS pillar_name,
                ap.description AS pillar_description,
                ap.sort_order AS pillar_sort_order,
                aq.id AS question_id,
                aq.code AS question_code,
                aq.prompt AS question_prompt,
                aq.help_text AS question_help_text,
                aq.question_type,
                aq.is_required,
                aq.sort_order AS question_sort_order,
                aq.config AS question_config,
                aqo.id AS option_id,
                aqo.code AS option_code,
                aqo.label AS option_label,
                aqo.weight AS option_weight,
                aqo.sort_order AS option_sort_order
            FROM assessment_pillars ap
            LEFT JOIN assessment_questions aq
                ON aq.pillar_id = ap.id
               AND aq.is_active IS TRUE
            LEFT JOIN assessment_question_options aqo
                ON aqo.question_id = aq.id
            WHERE ap.is_active IS TRUE
            ORDER BY
                ap.sort_order ASC,
                ap.id ASC,
                aq.sort_order ASC NULLS LAST,
                aq.id ASC NULLS LAST,
                aqo.sort_order ASC NULLS LAST,
                aqo.id ASC NULLS LAST
            """
        )

    def get_questions_with_options(self, question_ids: list[int]) -> list[dict[str, Any]]:
        if not question_ids:
            return []
        return self._db.fetch_all(
            """
            SELECT
                aq.id AS question_id,
                aq.code AS question_code,
                aq.prompt AS question_prompt,
                aq.help_text AS question_help_text,
                aq.question_type,
                aq.is_required,
                aq.sort_order AS question_sort_order,
                aq.config AS question_config,
                ap.id AS pillar_id,
                ap.code AS pillar_code,
                ap.display_name AS pillar_name,
                aqo.id AS option_id,
                aqo.code AS option_code,
                aqo.label AS option_label,
                aqo.weight AS option_weight,
                aqo.sort_order AS option_sort_order
            FROM assessment_questions aq
            JOIN assessment_pillars ap ON ap.id = aq.pillar_id
            LEFT JOIN assessment_question_options aqo ON aqo.question_id = aq.id
            WHERE aq.id = ANY(%s)
            ORDER BY aq.id ASC, aqo.sort_order ASC NULLS LAST, aqo.id ASC NULLS LAST
            """,
            (question_ids,),
        )

    def create_submission_bundle(
        self,
        *,
        organization_id: int,
        submitted_by_user_id: int,
        notes: str | None,
        overall_score: float | None,
        scoring_version: str,
        answers: list[dict[str, Any]],
        pillar_scores: list[dict[str, Any]],
        summary_json: dict[str, Any],
    ) -> int:
        with self._db.cursor() as cursor:
            cursor.execute(
                """
                INSERT INTO assessment_submissions (
                    organization_id,
                    submitted_by_user_id,
                    status,
                    overall_score,
                    notes,
                    scoring_version,
                    submitted_at
                )
                VALUES (%s, %s, %s, %s, %s, %s, NOW())
                RETURNING id
                """,
                (
                    organization_id,
                    submitted_by_user_id,
                    "scored",
                    overall_score,
                    notes,
                    scoring_version,
                ),
            )
            submission_id = int(cursor.fetchone()["id"])

            for answer in answers:
                cursor.execute(
                    """
                    INSERT INTO assessment_answers (
                        submission_id,
                        question_id,
                        selected_option_ids,
                        text_value,
                        number_value,
                        boolean_value,
                        computed_score,
                        metadata
                    )
                    VALUES (%s, %s, %s::jsonb, %s, %s, %s, %s, '{}'::jsonb)
                    """,
                    (
                        submission_id,
                        answer["question_id"],
                        json.dumps(answer.get("selected_option_ids", [])),
                        answer.get("text_value"),
                        answer.get("number_value"),
                        answer.get("boolean_value"),
                        answer.get("computed_score"),
                    ),
                )

            for score_row in pillar_scores:
                cursor.execute(
                    """
                    INSERT INTO assessment_scores (
                        submission_id,
                        pillar_id,
                        score,
                        metadata
                    )
                    VALUES (%s, %s, %s, '{}'::jsonb)
                    """,
                    (
                        submission_id,
                        score_row["pillar_id"],
                        score_row["score"],
                    ),
                )

            cursor.execute(
                """
                INSERT INTO assessment_result_snapshots (
                    organization_id,
                    submission_id,
                    overall_score,
                    pillars_json,
                    summary_json,
                    scoring_version,
                    created_at
                )
                VALUES (%s, %s, %s, %s::jsonb, %s::jsonb, %s, NOW())
                """,
                (
                    organization_id,
                    submission_id,
                    overall_score,
                    json.dumps(summary_json.get("pillars", [])),
                    json.dumps(summary_json),
                    scoring_version,
                ),
            )

        return submission_id

    def get_latest_snapshot(self, organization_id: int) -> dict | None:
        return self._db.fetch_one(
            """
            SELECT
                ars.organization_id,
                ars.submission_id,
                ars.overall_score,
                ars.pillars_json,
                ars.summary_json,
                ars.scoring_version,
                ars.created_at
            FROM assessment_result_snapshots ars
            WHERE ars.organization_id = %s
            ORDER BY ars.created_at DESC, ars.id DESC
            LIMIT 1
            """,
            (organization_id,),
        )

    def list_history(self, organization_id: int, *, page: int = 1, page_size: int = 20) -> tuple[list[dict], int]:
        query_params = {
            "organization_id": organization_id,
            "limit": page_size,
            "offset": (page - 1) * page_size,
        }
        total_row = self._db.fetch_one(
            """
            SELECT COUNT(*) AS total
            FROM assessment_submissions
            WHERE organization_id = %(organization_id)s
            """,
            query_params,
        )
        rows = self._db.fetch_all(
            """
            SELECT
                id AS submission_id,
                status,
                overall_score,
                scoring_version,
                submitted_at,
                notes
            FROM assessment_submissions
            WHERE organization_id = %(organization_id)s
            ORDER BY submitted_at DESC, id DESC
            LIMIT %(limit)s OFFSET %(offset)s
            """,
            query_params,
        )
        return rows, int(total_row["total"]) if total_row else 0
