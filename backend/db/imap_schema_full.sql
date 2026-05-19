-- =============================================================
-- iMapBE — Complete Schema + Seed Data
-- Generated from migrations 0001, 0002, 0003
-- Prerequisites: PostgreSQL 13+ with PostGIS extension available
-- Usage: psql -h <host> -U <user> -d <database> -f imap_schema_full.sql
-- =============================================================

-- =============================================================
-- EXTENSIONS
-- =============================================================

CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- =============================================================
-- SHARED TRIGGER FUNCTION
-- =============================================================

CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- =============================================================
-- TAXONOMY / LOOKUP TABLES
-- =============================================================

CREATE TABLE IF NOT EXISTS provinces (
    id BIGSERIAL PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    display_name TEXT NOT NULL,
    display_name_en TEXT,
    display_name_vi TEXT,
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    centroid_latitude NUMERIC(9, 6),
    centroid_longitude NUMERIC(9, 6),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(code) <> ''),
    CHECK (btrim(display_name) <> '')
);

CREATE TABLE IF NOT EXISTS organization_types (
    id BIGSERIAL PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    display_name TEXT NOT NULL,
    display_name_en TEXT,
    display_name_vi TEXT,
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(code) <> ''),
    CHECK (btrim(display_name) <> '')
);

CREATE TABLE IF NOT EXISTS operational_statuses (
    id BIGSERIAL PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    display_name TEXT NOT NULL,
    display_name_en TEXT,
    display_name_vi TEXT,
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(code) <> ''),
    CHECK (btrim(display_name) <> '')
);

CREATE TABLE IF NOT EXISTS industry_sectors (
    id BIGSERIAL PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    display_name TEXT NOT NULL,
    display_name_en TEXT,
    display_name_vi TEXT,
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(code) <> ''),
    CHECK (btrim(display_name) <> '')
);

CREATE TABLE IF NOT EXISTS environmental_impact_areas (
    id BIGSERIAL PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    display_name TEXT NOT NULL,
    display_name_en TEXT,
    display_name_vi TEXT,
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(code) <> ''),
    CHECK (btrim(display_name) <> '')
);

CREATE TABLE IF NOT EXISTS product_types (
    id BIGSERIAL PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    display_name TEXT NOT NULL,
    display_name_en TEXT,
    display_name_vi TEXT,
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(code) <> ''),
    CHECK (btrim(display_name) <> '')
);

CREATE TABLE IF NOT EXISTS impact_entity_types (
    id BIGSERIAL PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    display_name TEXT NOT NULL,
    display_name_en TEXT,
    display_name_vi TEXT,
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(code) <> ''),
    CHECK (btrim(display_name) <> '')
);

CREATE TABLE IF NOT EXISTS sdgs (
    id BIGSERIAL PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    display_name TEXT NOT NULL,
    display_name_en TEXT,
    display_name_vi TEXT,
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(code) <> ''),
    CHECK (btrim(display_name) <> '')
);

CREATE TABLE IF NOT EXISTS certification_levels (
    id BIGSERIAL PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    display_name TEXT NOT NULL,
    display_name_en TEXT,
    display_name_vi TEXT,
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(code) <> ''),
    CHECK (btrim(display_name) <> '')
);

CREATE TABLE IF NOT EXISTS user_roles (
    id BIGSERIAL PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    display_name TEXT NOT NULL,
    display_name_en TEXT,
    display_name_vi TEXT,
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(code) <> ''),
    CHECK (btrim(display_name) <> '')
);

-- =============================================================
-- CORE ORGANIZATION TABLES
-- =============================================================

CREATE TABLE IF NOT EXISTS organizations (
    id BIGSERIAL PRIMARY KEY,
    external_code TEXT UNIQUE,
    trade_name TEXT,
    registered_name TEXT,
    tax_code TEXT,
    founded_year SMALLINT,
    operational_status_id BIGINT REFERENCES operational_statuses(id),
    closed_year SMALLINT,
    organization_type_id BIGINT REFERENCES organization_types(id),
    primary_industry_sector_id BIGINT REFERENCES industry_sectors(id),
    has_positive_social_impact BOOLEAN,
    primary_product_type_id BIGINT REFERENCES product_types(id),
    other_product_type_id BIGINT REFERENCES product_types(id),
    impact_entity_type_id BIGINT REFERENCES impact_entity_types(id),
    star_rating SMALLINT,
    is_featured BOOLEAN NOT NULL DEFAULT FALSE,
    source_status TEXT NOT NULL DEFAULT 'imported',
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (trade_name IS NOT NULL OR registered_name IS NOT NULL),
    CHECK (founded_year IS NULL OR founded_year BETWEEN 1800 AND 2200),
    CHECK (closed_year IS NULL OR closed_year BETWEEN 1800 AND 2200),
    CHECK (star_rating IS NULL OR star_rating BETWEEN 1 AND 5)
);

CREATE UNIQUE INDEX IF NOT EXISTS organizations_tax_code_unique_idx
    ON organizations (tax_code)
    WHERE tax_code IS NOT NULL;

CREATE INDEX IF NOT EXISTS organizations_registered_name_lower_idx
    ON organizations ((lower(coalesce(registered_name, ''))));

CREATE INDEX IF NOT EXISTS organizations_search_trgm_idx
    ON organizations
    USING GIN ((coalesce(trade_name, '') || ' ' || coalesce(registered_name, '')) gin_trgm_ops);

CREATE TABLE IF NOT EXISTS organization_contacts (
    organization_id BIGINT PRIMARY KEY REFERENCES organizations(id) ON DELETE CASCADE,
    website TEXT,
    email TEXT,
    phone TEXT,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS organization_locations (
    organization_id BIGINT PRIMARY KEY REFERENCES organizations(id) ON DELETE CASCADE,
    province_id BIGINT REFERENCES provinces(id),
    ward_name TEXT,
    full_address TEXT,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    geom geometry(Point, 4326),
    location_precision TEXT NOT NULL DEFAULT 'unknown',
    geocode_source TEXT,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (
        (latitude IS NULL AND longitude IS NULL)
        OR (
            latitude BETWEEN -90 AND 90
            AND longitude BETWEEN -180 AND 180
        )
    ),
    CHECK (location_precision IN ('unknown', 'province_centroid', 'approximate', 'exact'))
);

CREATE INDEX IF NOT EXISTS organization_locations_province_id_idx
    ON organization_locations (province_id);

CREATE INDEX IF NOT EXISTS organization_locations_geom_idx
    ON organization_locations
    USING GIST (geom);

CREATE TABLE IF NOT EXISTS organization_industry_sectors (
    organization_id BIGINT NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    industry_sector_id BIGINT NOT NULL REFERENCES industry_sectors(id),
    sort_order SMALLINT NOT NULL DEFAULT 1,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY (organization_id, industry_sector_id),
    CHECK (sort_order BETWEEN 1 AND 3)
);

CREATE INDEX IF NOT EXISTS organization_industry_sectors_org_idx
    ON organization_industry_sectors (organization_id);

CREATE TABLE IF NOT EXISTS organization_environmental_impacts (
    organization_id BIGINT NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    environmental_impact_area_id BIGINT NOT NULL REFERENCES environmental_impact_areas(id),
    sort_order SMALLINT NOT NULL DEFAULT 1,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY (organization_id, environmental_impact_area_id),
    CHECK (sort_order BETWEEN 1 AND 4)
);

CREATE INDEX IF NOT EXISTS organization_environmental_impacts_org_idx
    ON organization_environmental_impacts (organization_id);

CREATE TABLE IF NOT EXISTS organization_sdgs (
    organization_id BIGINT NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    sdg_id BIGINT NOT NULL REFERENCES sdgs(id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY (organization_id, sdg_id)
);

CREATE TABLE IF NOT EXISTS organization_import_runs (
    id BIGSERIAL PRIMARY KEY,
    source_name TEXT NOT NULL,
    source_type TEXT NOT NULL,
    source_path TEXT,
    status TEXT NOT NULL DEFAULT 'running',
    total_records INTEGER NOT NULL DEFAULT 0,
    inserted_count INTEGER NOT NULL DEFAULT 0,
    updated_count INTEGER NOT NULL DEFAULT 0,
    skipped_count INTEGER NOT NULL DEFAULT 0,
    error_count INTEGER NOT NULL DEFAULT 0,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    started_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    finished_at TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS organization_import_errors (
    id BIGSERIAL PRIMARY KEY,
    import_run_id BIGINT NOT NULL REFERENCES organization_import_runs(id) ON DELETE CASCADE,
    record_index INTEGER NOT NULL,
    external_code TEXT,
    field_name TEXT,
    error_code TEXT NOT NULL,
    error_message TEXT NOT NULL,
    payload JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS organization_import_errors_run_idx
    ON organization_import_errors (import_run_id);

CREATE TABLE IF NOT EXISTS organization_import_sources (
    id BIGSERIAL PRIMARY KEY,
    organization_id BIGINT NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    import_run_id BIGINT NOT NULL REFERENCES organization_import_runs(id) ON DELETE CASCADE,
    source_name TEXT NOT NULL,
    source_path TEXT,
    source_record_id TEXT,
    payload JSONB NOT NULL DEFAULT '{}'::jsonb,
    imported_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS organization_import_sources_org_idx
    ON organization_import_sources (organization_id);

-- =============================================================
-- MIGRATION 0002 — CATALOG INDEXES
-- =============================================================

CREATE INDEX IF NOT EXISTS organizations_operational_status_id_idx
    ON organizations (operational_status_id);

CREATE INDEX IF NOT EXISTS organizations_organization_type_id_idx
    ON organizations (organization_type_id);

CREATE INDEX IF NOT EXISTS organizations_primary_industry_sector_id_idx
    ON organizations (primary_industry_sector_id);

CREATE INDEX IF NOT EXISTS organizations_has_positive_social_impact_idx
    ON organizations (has_positive_social_impact);

CREATE INDEX IF NOT EXISTS organizations_display_name_sort_idx
    ON organizations ((lower(coalesce(trade_name, registered_name, ''))));

CREATE INDEX IF NOT EXISTS organization_environmental_impacts_area_org_idx
    ON organization_environmental_impacts (environmental_impact_area_id, organization_id);

-- =============================================================
-- MIGRATION 0003 — APPLICATION DOMAIN TABLES
-- =============================================================

CREATE TABLE IF NOT EXISTS users (
    id BIGSERIAL PRIMARY KEY,
    email TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    full_name TEXT,
    role_id BIGINT NOT NULL REFERENCES user_roles(id),
    status TEXT NOT NULL DEFAULT 'active',
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    last_login_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(email) <> ''),
    CHECK (btrim(password_hash) <> ''),
    CHECK (status IN ('pending', 'active', 'disabled'))
);

CREATE UNIQUE INDEX IF NOT EXISTS users_email_lower_unique_idx
    ON users ((lower(email)));

CREATE TABLE IF NOT EXISTS organization_user_links (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    organization_id BIGINT REFERENCES organizations(id) ON DELETE SET NULL,
    linked_tax_code TEXT,
    relationship_type TEXT NOT NULL DEFAULT 'owner',
    status TEXT NOT NULL DEFAULT 'active',
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (relationship_type IN ('owner', 'manager', 'staff', 'consultant')),
    CHECK (status IN ('pending', 'active', 'revoked'))
);

CREATE UNIQUE INDEX IF NOT EXISTS organization_user_links_user_active_idx
    ON organization_user_links (user_id)
    WHERE status IN ('pending', 'active');

CREATE INDEX IF NOT EXISTS organization_user_links_org_idx
    ON organization_user_links (organization_id);

CREATE TABLE IF NOT EXISTS user_sessions (
    id BIGSERIAL PRIMARY KEY,
    session_id TEXT NOT NULL UNIQUE,
    user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    refresh_token_hash TEXT NOT NULL,
    user_agent TEXT,
    ip_address TEXT,
    status TEXT NOT NULL DEFAULT 'active',
    expires_at TIMESTAMPTZ NOT NULL,
    last_used_at TIMESTAMPTZ,
    revoked_at TIMESTAMPTZ,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (status IN ('active', 'revoked', 'expired'))
);

CREATE INDEX IF NOT EXISTS user_sessions_user_status_idx
    ON user_sessions (user_id, status);

CREATE TABLE IF NOT EXISTS assessment_pillars (
    id BIGSERIAL PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    display_name TEXT NOT NULL,
    description TEXT,
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(code) <> ''),
    CHECK (btrim(display_name) <> '')
);

CREATE TABLE IF NOT EXISTS assessment_questions (
    id BIGSERIAL PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    pillar_id BIGINT NOT NULL REFERENCES assessment_pillars(id),
    prompt TEXT NOT NULL,
    help_text TEXT,
    question_type TEXT NOT NULL,
    is_required BOOLEAN NOT NULL DEFAULT FALSE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    sort_order INTEGER NOT NULL DEFAULT 0,
    config JSONB NOT NULL DEFAULT '{}'::jsonb,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(code) <> ''),
    CHECK (btrim(prompt) <> ''),
    CHECK (question_type IN ('single_choice', 'multi_choice', 'boolean', 'scale', 'number', 'text'))
);

CREATE INDEX IF NOT EXISTS assessment_questions_pillar_idx
    ON assessment_questions (pillar_id, is_active, sort_order);

CREATE TABLE IF NOT EXISTS assessment_question_options (
    id BIGSERIAL PRIMARY KEY,
    question_id BIGINT NOT NULL REFERENCES assessment_questions(id) ON DELETE CASCADE,
    code TEXT NOT NULL,
    label TEXT NOT NULL,
    weight NUMERIC(10, 4),
    sort_order INTEGER NOT NULL DEFAULT 0,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(code) <> ''),
    CHECK (btrim(label) <> ''),
    UNIQUE (question_id, code)
);

CREATE INDEX IF NOT EXISTS assessment_question_options_question_idx
    ON assessment_question_options (question_id, sort_order);

CREATE TABLE IF NOT EXISTS assessment_submissions (
    id BIGSERIAL PRIMARY KEY,
    organization_id BIGINT NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    submitted_by_user_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    status TEXT NOT NULL DEFAULT 'submitted',
    overall_score NUMERIC(8, 2),
    notes TEXT,
    scoring_version TEXT NOT NULL DEFAULT 'generic_v1',
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    submitted_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (status IN ('draft', 'submitted', 'scored'))
);

CREATE INDEX IF NOT EXISTS assessment_submissions_org_submitted_idx
    ON assessment_submissions (organization_id, submitted_at DESC);

CREATE TABLE IF NOT EXISTS assessment_answers (
    id BIGSERIAL PRIMARY KEY,
    submission_id BIGINT NOT NULL REFERENCES assessment_submissions(id) ON DELETE CASCADE,
    question_id BIGINT NOT NULL REFERENCES assessment_questions(id),
    selected_option_ids JSONB NOT NULL DEFAULT '[]'::jsonb,
    text_value TEXT,
    number_value NUMERIC(14, 4),
    boolean_value BOOLEAN,
    computed_score NUMERIC(8, 4),
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (submission_id, question_id)
);

CREATE TABLE IF NOT EXISTS assessment_scores (
    id BIGSERIAL PRIMARY KEY,
    submission_id BIGINT NOT NULL REFERENCES assessment_submissions(id) ON DELETE CASCADE,
    pillar_id BIGINT NOT NULL REFERENCES assessment_pillars(id),
    score NUMERIC(8, 2),
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (submission_id, pillar_id)
);

CREATE TABLE IF NOT EXISTS assessment_result_snapshots (
    id BIGSERIAL PRIMARY KEY,
    organization_id BIGINT NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    submission_id BIGINT NOT NULL REFERENCES assessment_submissions(id) ON DELETE CASCADE,
    overall_score NUMERIC(8, 2),
    pillars_json JSONB NOT NULL DEFAULT '[]'::jsonb,
    summary_json JSONB NOT NULL DEFAULT '{}'::jsonb,
    scoring_version TEXT NOT NULL DEFAULT 'generic_v1',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS assessment_result_snapshots_org_created_idx
    ON assessment_result_snapshots (organization_id, created_at DESC);

CREATE TABLE IF NOT EXISTS certification_applications (
    id BIGSERIAL PRIMARY KEY,
    organization_id BIGINT NOT NULL REFERENCES organizations(id) ON DELETE CASCADE,
    applicant_user_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    requested_level_id BIGINT REFERENCES certification_levels(id),
    status TEXT NOT NULL DEFAULT 'submitted',
    application_note TEXT,
    review_note TEXT,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    submitted_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    decided_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (status IN ('draft', 'submitted', 'in_review', 'approved', 'rejected', 'changes_requested', 'withdrawn'))
);

CREATE INDEX IF NOT EXISTS certification_applications_org_status_idx
    ON certification_applications (organization_id, status, submitted_at DESC);

CREATE TABLE IF NOT EXISTS certification_documents (
    id BIGSERIAL PRIMARY KEY,
    application_id BIGINT NOT NULL REFERENCES certification_applications(id) ON DELETE CASCADE,
    document_type TEXT NOT NULL,
    title TEXT NOT NULL,
    file_name TEXT,
    file_url TEXT,
    storage_path TEXT,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(document_type) <> ''),
    CHECK (btrim(title) <> '')
);

CREATE TABLE IF NOT EXISTS certification_reviews (
    id BIGSERIAL PRIMARY KEY,
    application_id BIGINT NOT NULL REFERENCES certification_applications(id) ON DELETE CASCADE,
    reviewer_user_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    action TEXT NOT NULL,
    status_after TEXT NOT NULL,
    comment TEXT,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (action IN ('request_changes', 'approve', 'reject', 'comment', 'upgrade')),
    CHECK (status_after IN ('draft', 'submitted', 'in_review', 'approved', 'rejected', 'changes_requested', 'withdrawn'))
);

CREATE TABLE IF NOT EXISTS certifications (
    id BIGSERIAL PRIMARY KEY,
    organization_id BIGINT NOT NULL UNIQUE REFERENCES organizations(id) ON DELETE CASCADE,
    application_id BIGINT REFERENCES certification_applications(id) ON DELETE SET NULL,
    level_id BIGINT REFERENCES certification_levels(id),
    status TEXT NOT NULL DEFAULT 'pending',
    directory_visible BOOLEAN NOT NULL DEFAULT FALSE,
    issued_at TIMESTAMPTZ,
    expires_at TIMESTAMPTZ,
    upgraded_at TIMESTAMPTZ,
    public_note TEXT,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (status IN ('pending', 'active', 'expired', 'revoked'))
);

CREATE INDEX IF NOT EXISTS certifications_directory_idx
    ON certifications (directory_visible, status, level_id);

CREATE TABLE IF NOT EXISTS certification_status_history (
    id BIGSERIAL PRIMARY KEY,
    certification_id BIGINT NOT NULL REFERENCES certifications(id) ON DELETE CASCADE,
    previous_level_id BIGINT REFERENCES certification_levels(id),
    new_level_id BIGINT REFERENCES certification_levels(id),
    previous_status TEXT,
    new_status TEXT NOT NULL,
    changed_by_user_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    reason TEXT,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (new_status IN ('pending', 'active', 'expired', 'revoked'))
);

CREATE TABLE IF NOT EXISTS reports (
    id BIGSERIAL PRIMARY KEY,
    slug TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    category TEXT NOT NULL DEFAULT 'general',
    summary TEXT,
    description TEXT,
    preview_text TEXT,
    thumbnail_url TEXT,
    storage_path TEXT,
    download_url TEXT,
    status TEXT NOT NULL DEFAULT 'draft',
    is_premium BOOLEAN NOT NULL DEFAULT FALSE,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_by_user_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    updated_by_user_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    published_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(slug) <> ''),
    CHECK (btrim(title) <> ''),
    CHECK (category IN ('general', 'province', 'sector', 'due_diligence', 'sroi')),
    CHECK (status IN ('draft', 'published', 'archived'))
);

CREATE INDEX IF NOT EXISTS reports_status_category_idx
    ON reports (status, category, published_at DESC);

CREATE TABLE IF NOT EXISTS report_assets (
    id BIGSERIAL PRIMARY KEY,
    report_id BIGINT NOT NULL REFERENCES reports(id) ON DELETE CASCADE,
    asset_type TEXT NOT NULL,
    title TEXT,
    file_url TEXT,
    storage_path TEXT,
    sort_order INTEGER NOT NULL DEFAULT 0,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (asset_type IN ('preview', 'attachment', 'thumbnail', 'dataset'))
);

CREATE TABLE IF NOT EXISTS report_access_policies (
    id BIGSERIAL PRIMARY KEY,
    report_id BIGINT NOT NULL REFERENCES reports(id) ON DELETE CASCADE,
    role_id BIGINT NOT NULL REFERENCES user_roles(id),
    can_download BOOLEAN NOT NULL DEFAULT FALSE,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (report_id, role_id)
);

CREATE TABLE IF NOT EXISTS report_download_logs (
    id BIGSERIAL PRIMARY KEY,
    report_id BIGINT NOT NULL REFERENCES reports(id) ON DELETE CASCADE,
    user_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    requester_email TEXT,
    ip_address TEXT,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS custom_analysis_requests (
    id BIGSERIAL PRIMARY KEY,
    requested_by_user_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    organization_id BIGINT REFERENCES organizations(id) ON DELETE SET NULL,
    requester_name TEXT NOT NULL,
    requester_email TEXT NOT NULL,
    requester_phone TEXT,
    subject TEXT NOT NULL,
    request_type TEXT NOT NULL DEFAULT 'custom_analysis',
    brief TEXT,
    status TEXT NOT NULL DEFAULT 'submitted',
    attachment_count INTEGER NOT NULL DEFAULT 0,
    desired_due_date DATE,
    admin_notes TEXT,
    quote_amount NUMERIC(14, 2),
    quote_currency TEXT,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(requester_name) <> ''),
    CHECK (btrim(requester_email) <> ''),
    CHECK (btrim(subject) <> ''),
    CHECK (request_type IN ('custom_analysis', 'due_diligence', 'sroi', 'province', 'sector')),
    CHECK (status IN ('submitted', 'in_review', 'quoted', 'accepted', 'rejected', 'completed', 'cancelled'))
);

CREATE INDEX IF NOT EXISTS custom_analysis_requests_status_idx
    ON custom_analysis_requests (status, created_at DESC);

CREATE TABLE IF NOT EXISTS custom_analysis_attachments (
    id BIGSERIAL PRIMARY KEY,
    request_id BIGINT NOT NULL REFERENCES custom_analysis_requests(id) ON DELETE CASCADE,
    title TEXT,
    file_name TEXT,
    file_url TEXT,
    storage_path TEXT,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS custom_analysis_status_history (
    id BIGSERIAL PRIMARY KEY,
    request_id BIGINT NOT NULL REFERENCES custom_analysis_requests(id) ON DELETE CASCADE,
    previous_status TEXT,
    new_status TEXT NOT NULL,
    changed_by_user_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    note TEXT,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (new_status IN ('submitted', 'in_review', 'quoted', 'accepted', 'rejected', 'completed', 'cancelled'))
);

CREATE TABLE IF NOT EXISTS news_articles (
    id BIGSERIAL PRIMARY KEY,
    slug TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    summary TEXT,
    body TEXT,
    cover_image_url TEXT,
    tags TEXT[] NOT NULL DEFAULT ARRAY[]::TEXT[],
    status TEXT NOT NULL DEFAULT 'draft',
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_by_user_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    updated_by_user_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    published_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(slug) <> ''),
    CHECK (btrim(title) <> ''),
    CHECK (status IN ('draft', 'published', 'archived'))
);

CREATE INDEX IF NOT EXISTS news_articles_status_published_idx
    ON news_articles (status, published_at DESC);

CREATE TABLE IF NOT EXISTS cms_pages (
    id BIGSERIAL PRIMARY KEY,
    slug TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    summary TEXT,
    body TEXT,
    status TEXT NOT NULL DEFAULT 'draft',
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_by_user_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    updated_by_user_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    published_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(slug) <> ''),
    CHECK (btrim(title) <> ''),
    CHECK (status IN ('draft', 'published', 'archived'))
);

CREATE TABLE IF NOT EXISTS iid_team_members (
    id BIGSERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    role_title TEXT,
    biography TEXT,
    avatar_url TEXT,
    website TEXT,
    email TEXT,
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(full_name) <> '')
);

CREATE TABLE IF NOT EXISTS iid_partners (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    partner_type TEXT,
    description TEXT,
    logo_url TEXT,
    website TEXT,
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (btrim(name) <> '')
);

-- =============================================================
-- TRIGGERS
-- =============================================================

DROP TRIGGER IF EXISTS provinces_set_updated_at ON provinces;
CREATE TRIGGER provinces_set_updated_at BEFORE UPDATE ON provinces FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS organization_types_set_updated_at ON organization_types;
CREATE TRIGGER organization_types_set_updated_at BEFORE UPDATE ON organization_types FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS operational_statuses_set_updated_at ON operational_statuses;
CREATE TRIGGER operational_statuses_set_updated_at BEFORE UPDATE ON operational_statuses FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS industry_sectors_set_updated_at ON industry_sectors;
CREATE TRIGGER industry_sectors_set_updated_at BEFORE UPDATE ON industry_sectors FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS environmental_impact_areas_set_updated_at ON environmental_impact_areas;
CREATE TRIGGER environmental_impact_areas_set_updated_at BEFORE UPDATE ON environmental_impact_areas FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS product_types_set_updated_at ON product_types;
CREATE TRIGGER product_types_set_updated_at BEFORE UPDATE ON product_types FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS impact_entity_types_set_updated_at ON impact_entity_types;
CREATE TRIGGER impact_entity_types_set_updated_at BEFORE UPDATE ON impact_entity_types FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS sdgs_set_updated_at ON sdgs;
CREATE TRIGGER sdgs_set_updated_at BEFORE UPDATE ON sdgs FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS certification_levels_set_updated_at ON certification_levels;
CREATE TRIGGER certification_levels_set_updated_at BEFORE UPDATE ON certification_levels FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS user_roles_set_updated_at ON user_roles;
CREATE TRIGGER user_roles_set_updated_at BEFORE UPDATE ON user_roles FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS organizations_set_updated_at ON organizations;
CREATE TRIGGER organizations_set_updated_at BEFORE UPDATE ON organizations FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS organization_contacts_set_updated_at ON organization_contacts;
CREATE TRIGGER organization_contacts_set_updated_at BEFORE UPDATE ON organization_contacts FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS organization_locations_set_updated_at ON organization_locations;
CREATE TRIGGER organization_locations_set_updated_at BEFORE UPDATE ON organization_locations FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS users_set_updated_at ON users;
CREATE TRIGGER users_set_updated_at BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS organization_user_links_set_updated_at ON organization_user_links;
CREATE TRIGGER organization_user_links_set_updated_at BEFORE UPDATE ON organization_user_links FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS user_sessions_set_updated_at ON user_sessions;
CREATE TRIGGER user_sessions_set_updated_at BEFORE UPDATE ON user_sessions FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS assessment_pillars_set_updated_at ON assessment_pillars;
CREATE TRIGGER assessment_pillars_set_updated_at BEFORE UPDATE ON assessment_pillars FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS assessment_questions_set_updated_at ON assessment_questions;
CREATE TRIGGER assessment_questions_set_updated_at BEFORE UPDATE ON assessment_questions FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS assessment_question_options_set_updated_at ON assessment_question_options;
CREATE TRIGGER assessment_question_options_set_updated_at BEFORE UPDATE ON assessment_question_options FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS assessment_submissions_set_updated_at ON assessment_submissions;
CREATE TRIGGER assessment_submissions_set_updated_at BEFORE UPDATE ON assessment_submissions FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS assessment_answers_set_updated_at ON assessment_answers;
CREATE TRIGGER assessment_answers_set_updated_at BEFORE UPDATE ON assessment_answers FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS assessment_scores_set_updated_at ON assessment_scores;
CREATE TRIGGER assessment_scores_set_updated_at BEFORE UPDATE ON assessment_scores FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS certification_applications_set_updated_at ON certification_applications;
CREATE TRIGGER certification_applications_set_updated_at BEFORE UPDATE ON certification_applications FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS certification_documents_set_updated_at ON certification_documents;
CREATE TRIGGER certification_documents_set_updated_at BEFORE UPDATE ON certification_documents FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS certification_reviews_set_updated_at ON certification_reviews;
CREATE TRIGGER certification_reviews_set_updated_at BEFORE UPDATE ON certification_reviews FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS certifications_set_updated_at ON certifications;
CREATE TRIGGER certifications_set_updated_at BEFORE UPDATE ON certifications FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS certification_status_history_set_updated_at ON certification_status_history;
CREATE TRIGGER certification_status_history_set_updated_at BEFORE UPDATE ON certification_status_history FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS reports_set_updated_at ON reports;
CREATE TRIGGER reports_set_updated_at BEFORE UPDATE ON reports FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS report_assets_set_updated_at ON report_assets;
CREATE TRIGGER report_assets_set_updated_at BEFORE UPDATE ON report_assets FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS report_access_policies_set_updated_at ON report_access_policies;
CREATE TRIGGER report_access_policies_set_updated_at BEFORE UPDATE ON report_access_policies FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS custom_analysis_requests_set_updated_at ON custom_analysis_requests;
CREATE TRIGGER custom_analysis_requests_set_updated_at BEFORE UPDATE ON custom_analysis_requests FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS custom_analysis_attachments_set_updated_at ON custom_analysis_attachments;
CREATE TRIGGER custom_analysis_attachments_set_updated_at BEFORE UPDATE ON custom_analysis_attachments FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS custom_analysis_status_history_set_updated_at ON custom_analysis_status_history;
CREATE TRIGGER custom_analysis_status_history_set_updated_at BEFORE UPDATE ON custom_analysis_status_history FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS news_articles_set_updated_at ON news_articles;
CREATE TRIGGER news_articles_set_updated_at BEFORE UPDATE ON news_articles FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS cms_pages_set_updated_at ON cms_pages;
CREATE TRIGGER cms_pages_set_updated_at BEFORE UPDATE ON cms_pages FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS iid_team_members_set_updated_at ON iid_team_members;
CREATE TRIGGER iid_team_members_set_updated_at BEFORE UPDATE ON iid_team_members FOR EACH ROW EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS iid_partners_set_updated_at ON iid_partners;
CREATE TRIGGER iid_partners_set_updated_at BEFORE UPDATE ON iid_partners FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- =============================================================
-- SEED DATA — TAXONOMY
-- =============================================================

INSERT INTO operational_statuses (code, display_name, display_name_en, display_name_vi, sort_order) VALUES
    ('active',   'Active',   'Active',   'Đang hoạt động',     1),
    ('inactive', 'Inactive', 'Inactive', 'Ngừng hoạt động',    2),
    ('unknown',  'Unknown',  'Unknown',  'Không xác định',     3)
ON CONFLICT (code) DO NOTHING;

INSERT INTO organization_types (code, display_name, display_name_en, display_name_vi, sort_order) VALUES
    ('state_owned_enterprise',    'State-owned Enterprise',    'State-owned Enterprise',    'Doanh nghiệp Nhà nước',          1),
    ('cooperative',               'Cooperative',               'Cooperative',               'Hợp tác xã',                     2),
    ('private_enterprise',        'Private Enterprise',        'Private Enterprise',        'Doanh nghiệp Tư nhân / TNHH / CP', 3),
    ('foreign_invested_enterprise','Foreign Invested Enterprise','Foreign Invested Enterprise','Doanh nghiệp Vốn nước ngoài',   4)
ON CONFLICT (code) DO NOTHING;

INSERT INTO industry_sectors (code, display_name, display_name_en, display_name_vi, sort_order) VALUES
    ('A', 'Agriculture, Forestry and Fishing',                                                              'Agriculture, Forestry and Fishing',                                                              'Nông nghiệp, Lâm nghiệp và Thuỷ sản',                                              1),
    ('B', 'Mining and Quarrying',                                                                           'Mining and Quarrying',                                                                           'Khai khoáng',                                                                       2),
    ('C', 'Manufacturing',                                                                                  'Manufacturing',                                                                                  'Công nghiệp chế biến, chế tạo',                                                    3),
    ('D', 'Electricity, Gas, Steam and Air Conditioning Supply',                                            'Electricity, Gas, Steam and Air Conditioning Supply',                                            'Sản xuất và phân phối điện, khí đốt, nước nóng, hơi nước và điều hoà không khí',   4),
    ('E', 'Water Supply; Sewerage, Waste Management and Remediation Activities',                            'Water Supply; Sewerage, Waste Management and Remediation Activities',                            'Cung cấp nước; hoạt động quản lý và xử lý rác thải, nước thải',                    5),
    ('F', 'Construction',                                                                                   'Construction',                                                                                   'Xây dựng',                                                                          6),
    ('G', 'Wholesale and Retail Trade',                                                                     'Wholesale and Retail Trade',                                                                     'Bán buôn và bán lẻ; sửa chữa ô tô, mô tô, xe máy',                                7),
    ('H', 'Transportation and Storage',                                                                     'Transportation and Storage',                                                                     'Vận tải, kho bãi',                                                                  8),
    ('I', 'Accommodation and Food Service Activities',                                                      'Accommodation and Food Service Activities',                                                      'Dịch vụ lưu trú và ăn uống',                                                       9),
    ('J1','Publishing, Broadcasting, Content Production and Distribution',                                  'Publishing, Broadcasting, Content Production and Distribution',                                  'Xuất bản, phát thanh, truyền hình, sản xuất và phân phối nội dung',                10),
    ('J2','Telecommunications; Computer Programming, Consulting and Information Service Activities',        'Telecommunications; Computer Programming, Consulting and Information Service Activities',        'Viễn thông; lập trình máy tính, tư vấn và dịch vụ thông tin',                      11),
    ('K', 'Financial and Insurance Activities',                                                             'Financial and Insurance Activities',                                                             'Hoạt động tài chính, ngân hàng và bảo hiểm',                                       12),
    ('L', 'Real Estate Activities',                                                                         'Real Estate Activities',                                                                         'Kinh doanh bất động sản',                                                           13),
    ('M', 'Professional, Scientific and Technical Activities',                                              'Professional, Scientific and Technical Activities',                                              'Hoạt động chuyên môn, khoa học và công nghệ',                                      14),
    ('N', 'Administrative and Support Service Activities',                                                  'Administrative and Support Service Activities',                                                  'Hoạt động hành chính và dịch vụ hỗ trợ',                                           15),
    ('O', 'Activities of Communist Party, Socio-political Organizations, Public Administration and Defence; Compulsory Social Security', 'Activities of Communist Party, Socio-political Organizations, Public Administration and Defence; Compulsory Social Security', 'Hoạt động của Đảng, tổ chức chính trị - xã hội, quản lý nhà nước, an ninh quốc phòng; bảo đảm xã hội bắt buộc', 16),
    ('P', 'Education and Training',                                                                         'Education and Training',                                                                         'Giáo dục và đào tạo',                                                               17),
    ('Q', 'Human Health and Social Work Activities',                                                        'Human Health and Social Work Activities',                                                        'Y tế và hoạt động trợ giúp xã hội',                                                18),
    ('R', 'Arts, Entertainment and Recreation',                                                             'Arts, Entertainment and Recreation',                                                             'Nghệ thuật, vui chơi và giải trí',                                                  19),
    ('S', 'Other Service Activities',                                                                       'Other Service Activities',                                                                       'Hoạt động dịch vụ khác',                                                            20),
    ('T', 'Activities of Households as Employers; Undifferentiated Goods and Services Producing Activities for Own Use', 'Activities of Households as Employers; Undifferentiated Goods and Services Producing Activities for Own Use', 'Hoạt động làm thuê các công việc trong các hộ gia đình', 21),
    ('U', 'Activities of Extraterritorial Organizations and Bodies',                                        'Activities of Extraterritorial Organizations and Bodies',                                        'Hoạt động của các tổ chức và cơ quan quốc tế',                                     22)
ON CONFLICT (code) DO NOTHING;

INSERT INTO environmental_impact_areas (code, display_name, display_name_en, display_name_vi, sort_order) VALUES
    ('biodiversity',                       'Biodiversity',                        'Biodiversity',                        'Đa dạng sinh học',                              1),
    ('climate_change',                     'Climate Change',                      'Climate Change',                      'Biến đổi khí hậu',                              2),
    ('energy',                             'Energy',                              'Energy',                              'Năng lượng',                                    3),
    ('material_recovery_circular_economy', 'Material Recovery / Circular Economy','Material Recovery / Circular Economy','Thu hồi vật liệu / Kinh tế tuần hoàn',         4),
    ('water_and_wastewater',               'Water and Wastewater',                'Water and Wastewater',                'Nước và nước thải',                             5),
    ('air_emissions',                      'Air Emissions',                       'Air Emissions',                       'Khí thải',                                      6),
    ('solid_waste',                        'Solid Waste',                         'Solid Waste',                         'Chất thải rắn',                                 7),
    ('supply_chain',                       'Supply Chain',                        'Supply Chain',                        'Chuỗi cung ứng',                                8),
    ('no_environmental_impact',            'No Environmental Impact',             'No Environmental Impact',             'Không có tác động môi trường',                  9)
ON CONFLICT (code) DO NOTHING;

INSERT INTO product_types (code, display_name, display_name_en, display_name_vi, sort_order) VALUES
    ('physical_product', 'Physical Product', 'Physical Product', 'Sản phẩm vật lý', 1),
    ('service_product',  'Service Product',  'Service Product',  'Sản phẩm dịch vụ', 2)
ON CONFLICT (code) DO NOTHING;

INSERT INTO impact_entity_types (code, display_name, display_name_en, display_name_vi, sort_order) VALUES
    ('SE',  'Social Enterprise',          'Social Enterprise',          'Doanh nghiệp xã hội',                1),
    ('SIB', 'Social Impact Business',     'Social Impact Business',     'Doanh nghiệp tác động xã hội',       2),
    ('IB',  'Impact Business',            'Impact Business',            'Doanh nghiệp tác động',              3)
ON CONFLICT (code) DO NOTHING;

INSERT INTO certification_levels (code, display_name, display_name_en, display_name_vi, sort_order) VALUES
    ('basic',    'Basic',    'Basic',    'Cơ bản',    1),
    ('verified', 'Verified', 'Verified', 'Đã xác minh', 2),
    ('gold',     'Gold',     'Gold',     'Vàng',      3)
ON CONFLICT (code) DO NOTHING;

INSERT INTO user_roles (code, display_name, display_name_en, display_name_vi, sort_order) VALUES
    ('admin',     'Admin',     'Admin',     'Quản trị viên',    1),
    ('premium',   'Premium',   'Premium',   'Thành viên Premium', 2),
    ('enterprise','Enterprise','Enterprise','Doanh nghiệp',      3),
    ('public',    'Public',    'Public',    'Công khai',         4)
ON CONFLICT (code) DO NOTHING;

INSERT INTO sdgs (code, display_name, display_name_en, display_name_vi, sort_order) VALUES
    ('sdg_1',  'SDG 1: No Poverty',                        'SDG 1: No Poverty',                        'SDG 1: Không còn nghèo đói',                              1),
    ('sdg_2',  'SDG 2: Zero Hunger',                       'SDG 2: Zero Hunger',                       'SDG 2: Không còn nạn đói',                               2),
    ('sdg_3',  'SDG 3: Good Health and Well-being',        'SDG 3: Good Health and Well-being',        'SDG 3: Sức khoẻ và cuộc sống tốt',                       3),
    ('sdg_4',  'SDG 4: Quality Education',                 'SDG 4: Quality Education',                 'SDG 4: Giáo dục có chất lượng',                          4),
    ('sdg_5',  'SDG 5: Gender Equality',                   'SDG 5: Gender Equality',                   'SDG 5: Bình đẳng giới',                                  5),
    ('sdg_6',  'SDG 6: Clean Water and Sanitation',        'SDG 6: Clean Water and Sanitation',        'SDG 6: Nước sạch và vệ sinh',                            6),
    ('sdg_7',  'SDG 7: Affordable and Clean Energy',       'SDG 7: Affordable and Clean Energy',       'SDG 7: Năng lượng sạch và có thể tiếp cận',              7),
    ('sdg_8',  'SDG 8: Decent Work and Economic Growth',   'SDG 8: Decent Work and Economic Growth',   'SDG 8: Việc làm tốt và tăng trưởng kinh tế',             8),
    ('sdg_9',  'SDG 9: Industry, Innovation and Infrastructure','SDG 9: Industry, Innovation and Infrastructure','SDG 9: Công nghiệp, đổi mới và cơ sở hạ tầng',  9),
    ('sdg_10', 'SDG 10: Reduced Inequalities',             'SDG 10: Reduced Inequalities',             'SDG 10: Giảm bất bình đẳng',                             10),
    ('sdg_11', 'SDG 11: Sustainable Cities and Communities','SDG 11: Sustainable Cities and Communities','SDG 11: Các thành phố và cộng đồng bền vững',           11),
    ('sdg_12', 'SDG 12: Responsible Consumption and Production','SDG 12: Responsible Consumption and Production','SDG 12: Tiêu dùng và sản xuất có trách nhiệm',  12),
    ('sdg_13', 'SDG 13: Climate Action',                   'SDG 13: Climate Action',                   'SDG 13: Hành động về khí hậu',                           13),
    ('sdg_14', 'SDG 14: Life Below Water',                 'SDG 14: Life Below Water',                 'SDG 14: Tài nguyên và môi trường biển',                  14),
    ('sdg_15', 'SDG 15: Life on Land',                     'SDG 15: Life on Land',                     'SDG 15: Tài nguyên và môi trường trên cạn',              15),
    ('sdg_16', 'SDG 16: Peace, Justice and Strong Institutions','SDG 16: Peace, Justice and Strong Institutions','SDG 16: Hoà bình, công lý và thể chế vững mạnh', 16),
    ('sdg_17', 'SDG 17: Partnerships for the Goals',       'SDG 17: Partnerships for the Goals',       'SDG 17: Quan hệ đối tác vì các mục tiêu',                17)
ON CONFLICT (code) DO NOTHING;

INSERT INTO provinces (code, display_name, display_name_en, display_name_vi, sort_order) VALUES
    ('tuyen_quang', 'Tuyên Quang',   'Tuyen Quang',   'Tuyên Quang',   1),
    ('cao_bang',    'Cao Bằng',      'Cao Bang',      'Cao Bằng',      2),
    ('lai_chau',    'Lai Châu',      'Lai Chau',      'Lai Châu',      3),
    ('lao_cai',     'Lào Cai',       'Lao Cai',       'Lào Cai',       4),
    ('thai_nguyen', 'Thái Nguyên',   'Thai Nguyen',   'Thái Nguyên',   5),
    ('dien_bien',   'Điện Biên',     'Dien Bien',     'Điện Biên',     6),
    ('lang_son',    'Lạng Sơn',      'Lang Son',      'Lạng Sơn',      7),
    ('son_la',      'Sơn La',        'Son La',        'Sơn La',        8),
    ('phu_tho',     'Phú Thọ',       'Phu Tho',       'Phú Thọ',       9),
    ('hanoi',       'Hà Nội',        'Hanoi',         'Hà Nội',        10),
    ('hai_phong',   'Hải Phòng',     'Hai Phong',     'Hải Phòng',     11),
    ('bac_ninh',    'Bắc Ninh',      'Bac Ninh',      'Bắc Ninh',      12),
    ('quang_ninh',  'Quảng Ninh',    'Quang Ninh',    'Quảng Ninh',    13),
    ('hung_yen',    'Hưng Yên',      'Hung Yen',      'Hưng Yên',      14),
    ('ninh_binh',   'Ninh Bình',     'Ninh Binh',     'Ninh Bình',     15),
    ('thanh_hoa',   'Thanh Hoá',     'Thanh Hoa',     'Thanh Hoá',     16),
    ('nghe_an',     'Nghệ An',       'Nghe An',       'Nghệ An',       17),
    ('ha_tinh',     'Hà Tĩnh',       'Ha Tinh',       'Hà Tĩnh',       18),
    ('quang_tri',   'Quảng Trị',     'Quang Tri',     'Quảng Trị',     19),
    ('hue',         'Huế',           'Hue',           'Huế',           20),
    ('da_nang',     'Đà Nẵng',       'Da Nang',       'Đà Nẵng',       21),
    ('quang_ngai',  'Quảng Ngãi',    'Quang Ngai',    'Quảng Ngãi',    22),
    ('gia_lai',     'Gia Lai',       'Gia Lai',       'Gia Lai',       23),
    ('dak_lak',     'Đắk Lắk',       'Dak Lak',       'Đắk Lắk',       24),
    ('khanh_hoa',   'Khánh Hoà',     'Khanh Hoa',     'Khánh Hoà',     25),
    ('lam_dong',    'Lâm Đồng',      'Lam Dong',      'Lâm Đồng',      26),
    ('dong_nai',    'Đồng Nai',      'Dong Nai',      'Đồng Nai',      27),
    ('tay_ninh',    'Tây Ninh',      'Tay Ninh',      'Tây Ninh',      28),
    ('ho_chi_minh', 'TP. Hồ Chí Minh','Ho Chi Minh City','TP. Hồ Chí Minh', 29),
    ('dong_thap',   'Đồng Tháp',     'Dong Thap',     'Đồng Tháp',     30),
    ('an_giang',    'An Giang',      'An Giang',      'An Giang',      31),
    ('vinh_long',   'Vĩnh Long',     'Vinh Long',     'Vĩnh Long',     32),
    ('can_tho',     'Cần Thơ',       'Can Tho',       'Cần Thơ',       33),
    ('ca_mau',      'Cà Mau',        'Ca Mau',        'Cà Mau',        34)
ON CONFLICT (code) DO NOTHING;

-- =============================================================
-- SEED DATA — ASSESSMENT PILLARS (placeholder, pending IID)
-- =============================================================

INSERT INTO assessment_pillars (code, display_name, description, sort_order, is_active, metadata) VALUES
    ('pillar_1', 'Pillar 1', 'Generic placeholder pillar awaiting IID definition.', 1, TRUE, '{"placeholder": true}'::jsonb),
    ('pillar_2', 'Pillar 2', 'Generic placeholder pillar awaiting IID definition.', 2, TRUE, '{"placeholder": true}'::jsonb),
    ('pillar_3', 'Pillar 3', 'Generic placeholder pillar awaiting IID definition.', 3, TRUE, '{"placeholder": true}'::jsonb),
    ('pillar_4', 'Pillar 4', 'Generic placeholder pillar awaiting IID definition.', 4, TRUE, '{"placeholder": true}'::jsonb),
    ('pillar_5', 'Pillar 5', 'Generic placeholder pillar awaiting IID definition.', 5, TRUE, '{"placeholder": true}'::jsonb)
ON CONFLICT (code) DO NOTHING;

-- =============================================================
-- SCHEMA MIGRATIONS TRACKING TABLE
-- =============================================================

CREATE TABLE IF NOT EXISTS schema_migrations (
    filename   TEXT PRIMARY KEY,
    checksum   TEXT NOT NULL,
    applied_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

INSERT INTO schema_migrations (filename, checksum) VALUES
    ('0001_enable_postgis_and_core_schema.sql', 'e592d9dd75d1c1455fda31b42fcc81e23ec4005a70c5e31ff1c75f5077717f46'),
    ('0002_enterprise_catalog_indexes.sql',     'f8a1153cb387178ed1641321c2a5b23f04dfcf895be9d6a41a48242566f2a1f0'),
    ('0003_application_domains.sql',            'c42bc72963d49d6fe145557af300ad896bf00e74c3259c754631de08bd780a26')
ON CONFLICT (filename) DO NOTHING;
