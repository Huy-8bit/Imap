-- =============================================================================
-- Migration 0010: Annual Renewal System
-- Tạo: annual_updates table + renewal columns trên organizations
-- Requires: 0005, 0006, 0009
-- =============================================================================

-- 1. Renewal status enum
DO $$ BEGIN
    CREATE TYPE renewal_status AS ENUM (
        'not_started', 'in_progress', 'submitted',
        'under_review', 'approved', 'expired'
    );
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

-- 2. Thêm renewal columns vào organizations
ALTER TABLE organizations
    ADD COLUMN IF NOT EXISTS renewal_deadline          DATE,
    ADD COLUMN IF NOT EXISTS grace_deadline            DATE,
    ADD COLUMN IF NOT EXISTS renewal_status            renewal_status  NOT NULL DEFAULT 'not_started',
    ADD COLUMN IF NOT EXISTS renewal_year              SMALLINT,
    ADD COLUMN IF NOT EXISTS last_renewed_at           TIMESTAMPTZ,
    ADD COLUMN IF NOT EXISTS renewal_streak            SMALLINT        NOT NULL DEFAULT 0
        CHECK (renewal_streak >= 0),
    ADD COLUMN IF NOT EXISTS renewal_reminder_sent     TEXT[]          NOT NULL DEFAULT '{}';
    -- Track emails đã gửi: ['oct_1', 'jan_1', 'feb_1', 'mar_15', 'apr_1', ...]

-- Validate: grace_deadline phải sau renewal_deadline
ALTER TABLE organizations
    ADD CONSTRAINT organizations_grace_after_deadline
    CHECK (
        grace_deadline IS NULL
        OR renewal_deadline IS NULL
        OR grace_deadline > renewal_deadline
    );

-- 3. Annual updates table — 1 row mỗi org mỗi năm
DO $$ BEGIN
    CREATE TYPE annual_update_status AS ENUM (
        'draft', 'submitted', 'approved', 'rejected', 'expired_without_submit'
    );
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

CREATE TABLE IF NOT EXISTS annual_updates (
    id                          BIGSERIAL               PRIMARY KEY,
    org_id                      BIGINT                  NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    year                        SMALLINT                NOT NULL,  -- năm báo cáo (vd: 2026)
    status                      annual_update_status    NOT NULL DEFAULT 'draft',

    -- Phần A: Thông tin cơ bản
    section_a                   JSONB                   NOT NULL DEFAULT '{}'::jsonb,
    -- {
    --   "still_active": bool,
    --   "employee_count": int,
    --   "revenue_bracket": "<1B"|"1-5B"|"5-20B"|"20-100B"|">100B",
    --   "model_changed": bool,
    --   "model_change_desc": str|null
    -- }

    -- Phần B: Chỉ số tác động năm vừa qua
    section_b                   JSONB                   NOT NULL DEFAULT '{}'::jsonb,
    -- {
    --   "direct_beneficiaries": int,
    --   "beneficiary_counting_method": str,
    --   "impact_result_1": { "description": str, "metric": str },
    --   "impact_result_2": { "description": str, "metric": str },
    --   "impact_result_3": { "description": str, "metric": str } | null,
    --   "target_progress": 1-5,
    --   "target_progress_note": str,
    --   "beneficiary_group_changed": bool,
    --   "beneficiary_group_change_desc": str|null,
    --   "target_next_year": [ str, str, str ]
    -- }

    -- Phần C: Evidence update
    section_c                   JSONB                   NOT NULL DEFAULT '{}'::jsonb,
    -- {
    --   "criteria_confirmed": [ "DNXH-A1", "DNXH-A2", ... ],
    --   "new_files": [ { "evidence_item_id": int, "criterion_ref": str } ],
    --   "report_uploaded": bool,
    --   "new_awards": [ str ],
    --   "new_partners": [ str ]
    -- }

    -- Phần D: Khai báo trọng yếu — PHẢI là explicit boolean, không null
    section_d                   JSONB                   NOT NULL DEFAULT '{
        "ownership_change": false,
        "legal_violation": false,
        "labor_dispute": false,
        "financial_distress": false,
        "mission_change": false
    }'::jsonb,

    -- Flag tự động khi bất kỳ section_d field nào = true
    flagged_for_special_review  BOOLEAN                 NOT NULL DEFAULT FALSE,

    -- Score tracking
    previous_score              DECIMAL(5,2),
    new_score                   DECIMAL(5,2),
    score_delta                 DECIMAL(5,2)
        GENERATED ALWAYS AS (new_score - previous_score) STORED,

    previous_star_rating        SMALLINT,
    new_star_rating             SMALLINT                CHECK (new_star_rating IS NULL OR new_star_rating BETWEEN 3 AND 5),

    -- IID review
    iid_reviewer_id             BIGINT                  REFERENCES users(id) ON DELETE SET NULL,
    iid_review_notes            TEXT,       -- internal only
    feedback_to_dn              TEXT,       -- visible tới DN

    -- Timestamps
    submitted_at                TIMESTAMPTZ,
    reviewed_at                 TIMESTAMPTZ,
    approved_at                 TIMESTAMPTZ,
    created_at                  TIMESTAMPTZ             NOT NULL DEFAULT NOW(),
    updated_at                  TIMESTAMPTZ             NOT NULL DEFAULT NOW(),

    -- 1 org chỉ có 1 annual_update cho mỗi năm
    UNIQUE (org_id, year)
);

-- 4. Trigger: tự động set flagged_for_special_review khi section_d có bất kỳ true
CREATE OR REPLACE FUNCTION check_section_d_flags()
RETURNS TRIGGER AS $$
BEGIN
    NEW.flagged_for_special_review := (
        (NEW.section_d->>'ownership_change')::boolean OR
        (NEW.section_d->>'legal_violation')::boolean OR
        (NEW.section_d->>'labor_dispute')::boolean OR
        (NEW.section_d->>'financial_distress')::boolean OR
        (NEW.section_d->>'mission_change')::boolean
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS annual_updates_check_section_d ON annual_updates;
CREATE TRIGGER annual_updates_check_section_d
    BEFORE INSERT OR UPDATE ON annual_updates
    FOR EACH ROW
    EXECUTE FUNCTION check_section_d_flags();

DROP TRIGGER IF EXISTS annual_updates_set_updated_at ON annual_updates;
CREATE TRIGGER annual_updates_set_updated_at
    BEFORE UPDATE ON annual_updates
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

-- 5. Indexes
CREATE INDEX IF NOT EXISTS annual_updates_org_id_idx
    ON annual_updates (org_id);

CREATE INDEX IF NOT EXISTS annual_updates_status_idx
    ON annual_updates (status);

CREATE INDEX IF NOT EXISTS annual_updates_flagged_idx
    ON annual_updates (flagged_for_special_review)
    WHERE flagged_for_special_review = TRUE;

CREATE INDEX IF NOT EXISTS annual_updates_year_status_idx
    ON annual_updates (year, status);

CREATE INDEX IF NOT EXISTS organizations_renewal_deadline_idx
    ON organizations (renewal_deadline)
    WHERE renewal_deadline IS NOT NULL;

CREATE INDEX IF NOT EXISTS organizations_renewal_status_idx
    ON organizations (renewal_status)
    WHERE status = 'certified';

-- 6. Helper: khởi tạo renewal cycle cho một org vừa được certified
-- Gọi từ application sau khi issue certification
CREATE OR REPLACE FUNCTION init_renewal_cycle(p_org_id BIGINT, p_year SMALLINT)
RETURNS VOID AS $$
DECLARE
    v_renewal_year  SMALLINT := p_year + 1;
    v_deadline      DATE     := make_date(v_renewal_year, 3, 31);
    v_grace         DATE     := make_date(v_renewal_year, 6, 30);
BEGIN
    UPDATE organizations
    SET
        renewal_year        = v_renewal_year,
        renewal_deadline    = v_deadline,
        grace_deadline      = v_grace,
        renewal_status      = 'not_started',
        renewal_reminder_sent = '{}'
    WHERE id = p_org_id;
END;
$$ LANGUAGE plpgsql;
