-- =============================================================================
-- Migration 0009: Audit Log — append-only, RLS-protected
-- CRITICAL: Bảng này là trust moat của toàn hệ thống.
-- Không ai — kể cả superadmin — được UPDATE hoặc DELETE.
-- Requires: 0005, 0006
-- =============================================================================

-- 1. Event type constants (không dùng enum để dễ mở rộng không cần migration)
-- Các event_type chuẩn:
--   ORG_CLAIMED            — DN claim profile
--   ORG_STATUS_CHANGED     — unregistered → registered → certified
--   SCORE_ADJUSTED         — IID override điểm
--   CERT_ISSUED            — cấp certification
--   CERT_EXPIRED           — cert hết hạn (auto)
--   CERT_REVOKED           — cert bị thu hồi (manual)
--   EVIDENCE_UPLOADED      — DN upload evidence
--   EVIDENCE_VERIFIED      — auditor verify evidence
--   EVIDENCE_REJECTED      — auditor reject evidence
--   ASSESSMENT_SUBMITTED   — DN submit assessment
--   ASSESSMENT_APPROVED    — IID approve assessment
--   ANNUAL_UPDATE_SUBMITTED
--   ANNUAL_UPDATE_APPROVED
--   STAR_RATING_CHANGED
--   USER_CREATED
--   USER_ROLE_CHANGED

-- 2. Audit log table — BIGSERIAL PK (không UUID) để đảm bảo ordering tuyệt đối
CREATE TABLE IF NOT EXISTS audit_log (
    id              BIGSERIAL       PRIMARY KEY,    -- sequential, không được reset
    timestamp       TIMESTAMPTZ     NOT NULL DEFAULT NOW(),
    event_type      VARCHAR(100)    NOT NULL CHECK (btrim(event_type) <> ''),

    -- Actor
    actor_id        BIGINT          REFERENCES users(id) ON DELETE SET NULL,
    actor_role      VARCHAR(50),    -- snapshot role tại thời điểm action (không FK để tránh thay đổi)
    actor_email     VARCHAR(255),   -- snapshot email — giữ nguyên kể cả sau khi user bị xóa

    -- Target
    org_id          BIGINT          REFERENCES organizations(id) ON DELETE SET NULL,
    entity_type     VARCHAR(50)     CHECK (entity_type IN (
                        'organization', 'assessment', 'evidence_item',
                        'certification', 'annual_update', 'user', 'ai_scoring_job'
                    )),
    entity_id       BIGINT,         -- ID của entity bị thay đổi

    -- Payload
    old_value       JSONB,          -- giá trị trước thay đổi
    new_value       JSONB,          -- giá trị sau thay đổi
    reason          TEXT,           -- bắt buộc cho score/status/cert changes

    -- Request context
    ip_address      INET,
    session_id      VARCHAR(100),
    user_agent      TEXT,

    -- Enforce reason cho các event quan trọng
    CHECK (
        event_type NOT IN ('SCORE_ADJUSTED', 'CERT_REVOKED', 'STAR_RATING_CHANGED')
        OR (reason IS NOT NULL AND btrim(reason) <> '')
    )
);

-- 3. Indexes (read-only queries — không ảnh hưởng immutability)
CREATE INDEX IF NOT EXISTS audit_log_org_id_idx
    ON audit_log (org_id, timestamp DESC)
    WHERE org_id IS NOT NULL;

CREATE INDEX IF NOT EXISTS audit_log_event_type_idx
    ON audit_log (event_type, timestamp DESC);

CREATE INDEX IF NOT EXISTS audit_log_actor_id_idx
    ON audit_log (actor_id, timestamp DESC)
    WHERE actor_id IS NOT NULL;

CREATE INDEX IF NOT EXISTS audit_log_entity_idx
    ON audit_log (entity_type, entity_id, timestamp DESC)
    WHERE entity_type IS NOT NULL;

-- 4. Row Level Security — CRITICAL
ALTER TABLE audit_log ENABLE ROW LEVEL SECURITY;

-- Tất cả roles đều có thể INSERT
CREATE POLICY audit_log_insert_only
    ON audit_log
    FOR INSERT
    TO PUBLIC
    WITH CHECK (true);

-- Không ai được UPDATE — kể cả superuser qua RLS
-- (superuser bypass RLS theo mặc định; dùng FORCE để block)
ALTER TABLE audit_log FORCE ROW LEVEL SECURITY;

CREATE POLICY audit_log_no_update
    ON audit_log
    FOR UPDATE
    USING (false);

CREATE POLICY audit_log_no_delete
    ON audit_log
    FOR DELETE
    USING (false);

-- SELECT được phép (cho admin export và compliance queries)
CREATE POLICY audit_log_select_all
    ON audit_log
    FOR SELECT
    TO PUBLIC
    USING (true);

-- 5. Helper function để ghi audit log từ application code
CREATE OR REPLACE FUNCTION write_audit_log(
    p_event_type    VARCHAR(100),
    p_actor_id      BIGINT,
    p_actor_role    VARCHAR(50),
    p_actor_email   VARCHAR(255),
    p_org_id        BIGINT,
    p_entity_type   VARCHAR(50),
    p_entity_id     BIGINT,
    p_old_value     JSONB,
    p_new_value     JSONB,
    p_reason        TEXT DEFAULT NULL,
    p_ip_address    INET DEFAULT NULL,
    p_session_id    VARCHAR(100) DEFAULT NULL
)
RETURNS BIGINT AS $$
DECLARE
    v_id BIGINT;
BEGIN
    INSERT INTO audit_log (
        event_type, actor_id, actor_role, actor_email,
        org_id, entity_type, entity_id,
        old_value, new_value, reason,
        ip_address, session_id
    ) VALUES (
        p_event_type, p_actor_id, p_actor_role, p_actor_email,
        p_org_id, p_entity_type, p_entity_id,
        p_old_value, p_new_value, p_reason,
        p_ip_address, p_session_id
    )
    RETURNING id INTO v_id;

    RETURN v_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
