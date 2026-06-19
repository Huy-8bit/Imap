-- =============================================================================
-- Migration 0013: Two-person rule cho certification 5★
-- Thêm approver tracking + pending_second_approval status vào certifications
-- =============================================================================

ALTER TABLE certifications
    ADD COLUMN IF NOT EXISTS first_approver_id  BIGINT REFERENCES users(id) ON DELETE SET NULL,
    ADD COLUMN IF NOT EXISTS second_approver_id BIGINT REFERENCES users(id) ON DELETE SET NULL;

-- Mở rộng CHECK constraint để cho phép 'pending_second_approval'
ALTER TABLE certifications
    DROP CONSTRAINT IF EXISTS certifications_status_check;

ALTER TABLE certifications
    ADD CONSTRAINT certifications_status_check
    CHECK (status IN ('pending', 'active', 'expired', 'revoked', 'pending_second_approval'));

CREATE INDEX IF NOT EXISTS certifications_pending_second_idx
    ON certifications (status)
    WHERE status = 'pending_second_approval';
