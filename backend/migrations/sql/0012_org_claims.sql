-- =============================================================================
-- Migration 0012: Organization claim workflow
-- DN verify email → IID review → approve/reject
-- Replaces self-registration as the primary claim mechanism per v2 spec
-- =============================================================================

DO $$ BEGIN
    CREATE TYPE org_claim_status AS ENUM (
        'pending_verification',
        'pending_review',
        'approved',
        'rejected',
        'expired'
    );
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

CREATE TABLE IF NOT EXISTS org_claims (
    id                  BIGSERIAL           PRIMARY KEY,
    org_id              BIGINT              NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    user_id             BIGINT              NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    status              org_claim_status    NOT NULL DEFAULT 'pending_verification',
    email_token         TEXT                UNIQUE,
    email_token_expires TIMESTAMPTZ,
    submitted_at        TIMESTAMPTZ         NOT NULL DEFAULT NOW(),
    verified_at         TIMESTAMPTZ,
    reviewed_at         TIMESTAMPTZ,
    reviewer_id         BIGINT              REFERENCES users(id) ON DELETE SET NULL,
    reviewer_note       TEXT,
    created_at          TIMESTAMPTZ         NOT NULL DEFAULT NOW(),
    updated_at          TIMESTAMPTZ         NOT NULL DEFAULT NOW(),

    -- Một user chỉ có 1 claim active tại 1 thời điểm cho 1 org
    UNIQUE (org_id, user_id)
);

CREATE INDEX IF NOT EXISTS org_claims_org_id_idx
    ON org_claims (org_id);

CREATE INDEX IF NOT EXISTS org_claims_user_id_idx
    ON org_claims (user_id);

CREATE INDEX IF NOT EXISTS org_claims_status_idx
    ON org_claims (status);

CREATE INDEX IF NOT EXISTS org_claims_email_token_idx
    ON org_claims (email_token)
    WHERE email_token IS NOT NULL;

DROP TRIGGER IF EXISTS org_claims_set_updated_at ON org_claims;
CREATE TRIGGER org_claims_set_updated_at
    BEFORE UPDATE ON org_claims
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();
