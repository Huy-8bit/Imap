-- =============================================================================
-- Migration 0008: AI Scoring Service tables
-- Tạo: ai_scoring_jobs
-- Requires: 0005 (organizations fields), 0006 (users)
-- =============================================================================

-- 1. AI scoring job status enum
DO $$ BEGIN
    CREATE TYPE ai_job_status AS ENUM (
        'queued', 'running', 'completed', 'failed', 'needs_review'
    );
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
    CREATE TYPE outreach_priority AS ENUM ('high', 'medium', 'low');
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

-- 2. AI scoring jobs table
CREATE TABLE IF NOT EXISTS ai_scoring_jobs (
    id                      BIGSERIAL           PRIMARY KEY,
    org_id                  BIGINT              NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    status                  ai_job_status       NOT NULL DEFAULT 'queued',

    -- Scraping
    sources_scraped         TEXT[]              DEFAULT '{}',
    -- vd: ['https://example.com', 'https://fb.com/example', ...]

    raw_text_snapshot       TEXT,
    -- Toàn bộ text thu thập được — lưu để re-run AI mà không cần scrape lại

    -- AI output
    ai_response             JSONB               DEFAULT '{}'::jsonb,
    -- Full JSON từ Claude API theo Impactonomy prompt

    -- Parsed results
    intentionality_score    SMALLINT            CHECK (intentionality_score IS NULL OR intentionality_score BETWEEN 0 AND 3),
    beneficiary_groups      TEXT[]              DEFAULT '{}',
    module_scores           JSONB               DEFAULT '{}'::jsonb,
    -- Format: { "DNXH": { "score": 2, "signals": ["..."] }, "IB": {...}, ... }

    sdg_numbers             SMALLINT[]          DEFAULT '{}',
    composite_score         DECIMAL(5,2)        CHECK (composite_score IS NULL OR composite_score BETWEEN 0 AND 39),

    -- Review flags
    priority_outreach       outreach_priority,
    needs_review            BOOLEAN             NOT NULL DEFAULT FALSE,
    review_reason           TEXT,
    -- Reviewer nếu cần human review
    reviewed_by             BIGINT              REFERENCES users(id) ON DELETE SET NULL,
    reviewed_at             TIMESTAMPTZ,

    -- Cost tracking
    tokens_used             INTEGER             CHECK (tokens_used IS NULL OR tokens_used >= 0),
    cost_usd                DECIMAL(8,4)        CHECK (cost_usd IS NULL OR cost_usd >= 0),

    -- Error info nếu failed
    error_message           TEXT,
    retry_count             SMALLINT            NOT NULL DEFAULT 0,

    -- Timestamps
    queued_at               TIMESTAMPTZ         NOT NULL DEFAULT NOW(),
    started_at              TIMESTAMPTZ,
    run_at                  TIMESTAMPTZ,        -- completed timestamp
    created_at              TIMESTAMPTZ         NOT NULL DEFAULT NOW()
);

-- 3. Indexes
CREATE INDEX IF NOT EXISTS ai_scoring_jobs_org_id_idx
    ON ai_scoring_jobs (org_id);

CREATE INDEX IF NOT EXISTS ai_scoring_jobs_status_idx
    ON ai_scoring_jobs (status);

CREATE INDEX IF NOT EXISTS ai_scoring_jobs_needs_review_idx
    ON ai_scoring_jobs (needs_review)
    WHERE needs_review = TRUE;

CREATE INDEX IF NOT EXISTS ai_scoring_jobs_queued_at_idx
    ON ai_scoring_jobs (queued_at)
    WHERE status = 'queued';

-- Chỉ 1 job đang chạy hoặc xếp hàng cho mỗi org tại 1 thời điểm
CREATE UNIQUE INDEX IF NOT EXISTS ai_scoring_jobs_one_active_per_org_idx
    ON ai_scoring_jobs (org_id)
    WHERE status IN ('queued', 'running');
