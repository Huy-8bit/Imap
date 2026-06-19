-- =============================================================================
-- Migration 0011: Assessment draft auto-save column
-- Thêm draft_responses vào assessments — tách biệt auto-save khỏi responses chính
-- PATCH /api/v1/assessments/{id} ghi vào draft_responses, submit mới copy sang responses
-- =============================================================================

ALTER TABLE assessments
    ADD COLUMN IF NOT EXISTS draft_responses JSONB NOT NULL DEFAULT '{}'::jsonb;
