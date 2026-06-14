-- =============================================================================
-- Migration 0007: Assessment Engine tables
-- Tạo: assessments, evidence_items
-- Requires: 0005 (organizations.status), 0006 (users)
-- =============================================================================

-- 1. Assessment module enum
DO $$ BEGIN
    CREATE TYPE assessment_module AS ENUM ('DNXH', 'IB', 'KNST', 'ESG', 'KTTH');
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
    CREATE TYPE assessment_status AS ENUM ('draft', 'submitted', 'under_review', 'reviewed', 'approved');
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

-- 2. Assessments table
CREATE TABLE IF NOT EXISTS assessments (
    id              BIGSERIAL           PRIMARY KEY,
    org_id          BIGINT              NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    module          assessment_module   NOT NULL,
    version         VARCHAR(10)         NOT NULL DEFAULT '2.0',   -- phiên bản bảng hỏi
    year            SMALLINT            NOT NULL,
    status          assessment_status   NOT NULL DEFAULT 'draft',

    -- Câu trả lời và điểm số — JSONB để flexible khi update methodology
    responses       JSONB               NOT NULL DEFAULT '{}'::jsonb,
    -- Format: { "Q1": { "answer": "yes", "evidence_grade": "B", "notes": "..." }, ... }

    domain_scores   JSONB               NOT NULL DEFAULT '{}'::jsonb,
    -- Format: { "A": 75.5, "B": 60.2, "C": 88.0, "D": 55.0, "E": 70.0 }

    raw_score       DECIMAL(5,2)        CHECK (raw_score IS NULL OR raw_score BETWEEN 0 AND 100),
    final_score     DECIMAL(5,2)        CHECK (final_score IS NULL OR final_score BETWEEN 0 AND 100),
    maturity_level  SMALLINT            CHECK (maturity_level IS NULL OR maturity_level BETWEEN 1 AND 5),
    -- 1=Aware, 2=Commit, 3=Act, 4=Verify, 5=Lead

    -- IID review
    reviewed_by     BIGINT              REFERENCES users(id) ON DELETE SET NULL,
    review_notes    TEXT,               -- internal, không hiển thị cho DN

    -- Timestamps
    submitted_at    TIMESTAMPTZ,
    approved_at     TIMESTAMPTZ,
    created_at      TIMESTAMPTZ         NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ         NOT NULL DEFAULT NOW(),

    -- Một org chỉ có 1 assessment đang active cho mỗi module + năm
    UNIQUE (org_id, module, year)
);

CREATE INDEX IF NOT EXISTS assessments_org_id_idx
    ON assessments (org_id);

CREATE INDEX IF NOT EXISTS assessments_status_idx
    ON assessments (status);

CREATE INDEX IF NOT EXISTS assessments_org_module_idx
    ON assessments (org_id, module);

DROP TRIGGER IF EXISTS assessments_set_updated_at ON assessments;
CREATE TRIGGER assessments_set_updated_at
    BEFORE UPDATE ON assessments
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

-- 3. Evidence items enum
DO $$ BEGIN
    CREATE TYPE evidence_status AS ENUM (
        'pending', 'under_review', 'verified', 'rejected', 'requested_more'
    );
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

-- 4. Evidence items table
CREATE TABLE IF NOT EXISTS evidence_items (
    id              BIGSERIAL       PRIMARY KEY,
    org_id          BIGINT          NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    assessment_id   BIGINT          NOT NULL REFERENCES assessments(id) ON DELETE CASCADE,
    criterion_ref   VARCHAR(20)     NOT NULL,   -- vd: 'DNXH-A1', 'IB-B3'

    -- File info
    file_url        TEXT            NOT NULL,   -- S3 presigned path (private)
    file_type       VARCHAR(50)     CHECK (file_type IN ('pdf', 'xlsx', 'png', 'jpg', 'docx')),
    file_size_kb    INTEGER         CHECK (file_size_kb > 0),
    title           VARCHAR(300)    NOT NULL,
    description     TEXT,

    -- Review
    status          evidence_status NOT NULL DEFAULT 'pending',
    reviewer_id     BIGINT          REFERENCES users(id) ON DELETE SET NULL,
    reviewer_note   TEXT,           -- bắt buộc khi rejected hoặc requested_more
    version         SMALLINT        NOT NULL DEFAULT 1,  -- tăng khi DN re-upload

    -- Timestamps
    uploaded_at     TIMESTAMPTZ     NOT NULL DEFAULT NOW(),
    reviewed_at     TIMESTAMPTZ,

    -- Enforce reviewer_note khi reject
    CHECK (
        status NOT IN ('rejected', 'requested_more')
        OR (reviewer_note IS NOT NULL AND btrim(reviewer_note) <> '')
    )
);

CREATE INDEX IF NOT EXISTS evidence_items_org_id_idx
    ON evidence_items (org_id);

CREATE INDEX IF NOT EXISTS evidence_items_assessment_id_idx
    ON evidence_items (assessment_id);

CREATE INDEX IF NOT EXISTS evidence_items_status_idx
    ON evidence_items (status);

CREATE INDEX IF NOT EXISTS evidence_items_criterion_ref_idx
    ON evidence_items (criterion_ref);
