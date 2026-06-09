-- =============================================================================
-- Migration 0005: Add core business fields to organizations
-- Adds: status, slug, AI fields, certification fields, URLs
-- Compatible with existing schema from 0001
-- =============================================================================

-- 1. Status enum — core field theo spec
DO $$ BEGIN
    CREATE TYPE org_status AS ENUM ('unregistered', 'registered', 'certified');
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

-- 2. Slug — URL-friendly identifier cho /dn/[slug]
ALTER TABLE organizations
    ADD COLUMN IF NOT EXISTS slug TEXT UNIQUE,
    ADD COLUMN IF NOT EXISTS status org_status NOT NULL DEFAULT 'unregistered';

-- 3. Tên tiếng Việt / Anh theo spec (bổ sung, không xóa trade_name/registered_name cũ)
ALTER TABLE organizations
    ADD COLUMN IF NOT EXISTS name_vi TEXT,
    ADD COLUMN IF NOT EXISTS name_en TEXT;

-- Backfill name_vi từ trade_name hoặc registered_name
UPDATE organizations
SET
    name_vi = COALESCE(trade_name, registered_name),
    name_en = registered_name
WHERE name_vi IS NULL;

-- 4. AI scoring fields
ALTER TABLE organizations
    ADD COLUMN IF NOT EXISTS ai_tags          TEXT[]         DEFAULT '{}',
    ADD COLUMN IF NOT EXISTS sdg_numbers      SMALLINT[]     DEFAULT '{}',
    ADD COLUMN IF NOT EXISTS ai_composite_score DECIMAL(5,2) CHECK (ai_composite_score IS NULL OR ai_composite_score BETWEEN 0 AND 39),
    ADD COLUMN IF NOT EXISTS priority_outreach TEXT          CHECK (priority_outreach IN ('high', 'medium', 'low'));

-- 5. Certification fields
ALTER TABLE organizations
    ADD COLUMN IF NOT EXISTS claimed_at   TIMESTAMPTZ,
    ADD COLUMN IF NOT EXISTS certified_at TIMESTAMPTZ,
    ADD COLUMN IF NOT EXISTS expires_at   TIMESTAMPTZ;

-- 6. Public-facing URLs (tách ra khỏi organization_contacts để map/directory dùng không cần JOIN)
ALTER TABLE organizations
    ADD COLUMN IF NOT EXISTS website_url TEXT,
    ADD COLUMN IF NOT EXISTS fb_url      TEXT,
    ADD COLUMN IF NOT EXISTS logo_url    TEXT;

-- 7. Slug generation function — auto từ name_vi
CREATE OR REPLACE FUNCTION generate_slug(input_text TEXT)
RETURNS TEXT AS $$
DECLARE
    result TEXT;
BEGIN
    result := lower(input_text);
    -- Bỏ dấu tiếng Việt (basic transliteration — dùng unaccent extension nếu có)
    result := translate(result,
        'àáâãäåèéêëìíîïòóôõöùúûüýÿăắặằẳẵâấậầẩẫđêếệềểễôốộồổỗơớợờởỡưứựừửữ',
        'aaaaaaeeeeiiiioooooouuuuyyaaaaaaaaaaadeeeeeeooooooooooouuuuuuu'
    );
    -- Thay ký tự đặc biệt bằng dấu gạch
    result := regexp_replace(result, '[^a-z0-9]+', '-', 'g');
    -- Bỏ dấu gạch đầu/cuối
    result := trim(both '-' from result);
    RETURN result;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- Backfill slug cho organizations đã có (dùng id để tránh duplicate)
UPDATE organizations
SET slug = generate_slug(COALESCE(trade_name, registered_name, 'org')) || '-' || id
WHERE slug IS NULL;

-- Sau backfill mới đặt NOT NULL
ALTER TABLE organizations
    ALTER COLUMN slug SET NOT NULL;

-- 8. Indexes
CREATE INDEX IF NOT EXISTS organizations_status_idx
    ON organizations (status);

CREATE INDEX IF NOT EXISTS organizations_slug_idx
    ON organizations (slug);

CREATE INDEX IF NOT EXISTS organizations_ai_composite_score_idx
    ON organizations (ai_composite_score DESC NULLS LAST);

CREATE INDEX IF NOT EXISTS organizations_expires_at_idx
    ON organizations (expires_at)
    WHERE expires_at IS NOT NULL;

CREATE INDEX IF NOT EXISTS organizations_ai_tags_gin_idx
    ON organizations USING GIN (ai_tags);

CREATE INDEX IF NOT EXISTS organizations_sdg_numbers_gin_idx
    ON organizations USING GIN (sdg_numbers);
