-- =============================================================================
-- Migration 0006: Create users table + fix user_sessions indexes
-- NOTE: user_sessions đã tồn tại trong DB với cấu trúc đầy đủ hơn spec.
--       Migration này chỉ tạo users (nếu chưa có) và add org_id nếu thiếu,
--       sau đó tạo indexes cho cả hai bảng.
-- Requires: 0001 (user_roles, organizations), 0005 (organizations.status)
-- =============================================================================

-- 1. Users table
CREATE TABLE IF NOT EXISTS users (
    id              BIGSERIAL       PRIMARY KEY,
    email           TEXT            NOT NULL UNIQUE,
    hashed_password TEXT,
    full_name       TEXT,
    avatar_url      TEXT,
    role_id         BIGINT          REFERENCES user_roles(id),
    org_id          BIGINT          REFERENCES organizations(id) ON DELETE SET NULL,
    is_active       BOOLEAN         NOT NULL DEFAULT TRUE,
    is_verified     BOOLEAN         NOT NULL DEFAULT FALSE,
    last_login_at   TIMESTAMPTZ,
    metadata        JSONB           NOT NULL DEFAULT '{}'::jsonb,
    created_at      TIMESTAMPTZ     NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ     NOT NULL DEFAULT NOW(),
    CHECK (btrim(email) <> '')
);

-- Thêm org_id nếu bảng users đã tồn tại nhưng chưa có column này
ALTER TABLE users
    ADD COLUMN IF NOT EXISTS org_id BIGINT REFERENCES organizations(id) ON DELETE SET NULL;

-- 2. Indexes cho users
CREATE INDEX IF NOT EXISTS users_email_lower_idx
    ON users ((lower(email)));

CREATE INDEX IF NOT EXISTS users_org_id_idx
    ON users (org_id)
    WHERE org_id IS NOT NULL;

CREATE INDEX IF NOT EXISTS users_role_id_idx
    ON users (role_id);

-- Google OAuth unique index
-- (có thể đã tạo ở 0004, IF NOT EXISTS sẽ skip nếu đã có)
CREATE UNIQUE INDEX IF NOT EXISTS users_google_sub_unique_idx
    ON users ((metadata->'google'->>'sub'))
    WHERE (metadata->'google'->>'sub') IS NOT NULL;

-- 3. Trigger updated_at cho users
DROP TRIGGER IF EXISTS users_set_updated_at ON users;
CREATE TRIGGER users_set_updated_at
    BEFORE UPDATE ON users
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

-- 4. Indexes cho user_sessions
-- Bảng user_sessions đã tồn tại với cấu trúc:
--   id, session_id, user_id, refresh_token_hash, user_agent,
--   ip_address, status, expires_at, last_used_at, revoked_at,
--   metadata, created_at, updated_at
CREATE INDEX IF NOT EXISTS user_sessions_user_id_idx
    ON user_sessions (user_id);

CREATE UNIQUE INDEX IF NOT EXISTS user_sessions_refresh_token_hash_idx
    ON user_sessions (refresh_token_hash);

CREATE INDEX IF NOT EXISTS user_sessions_expires_at_idx
    ON user_sessions (expires_at)
    WHERE revoked_at IS NULL;

CREATE INDEX IF NOT EXISTS user_sessions_status_idx
    ON user_sessions (status);