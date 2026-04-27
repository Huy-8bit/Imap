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

INSERT INTO assessment_pillars (code, display_name, description, sort_order, is_active, metadata)
VALUES
    ('pillar_1', 'Pillar 1', 'Generic placeholder pillar awaiting IID definition.', 1, TRUE, '{"placeholder": true}'::jsonb),
    ('pillar_2', 'Pillar 2', 'Generic placeholder pillar awaiting IID definition.', 2, TRUE, '{"placeholder": true}'::jsonb),
    ('pillar_3', 'Pillar 3', 'Generic placeholder pillar awaiting IID definition.', 3, TRUE, '{"placeholder": true}'::jsonb),
    ('pillar_4', 'Pillar 4', 'Generic placeholder pillar awaiting IID definition.', 4, TRUE, '{"placeholder": true}'::jsonb),
    ('pillar_5', 'Pillar 5', 'Generic placeholder pillar awaiting IID definition.', 5, TRUE, '{"placeholder": true}'::jsonb)
ON CONFLICT (code) DO NOTHING;

DROP TRIGGER IF EXISTS users_set_updated_at ON users;
CREATE TRIGGER users_set_updated_at
    BEFORE UPDATE ON users
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS organization_user_links_set_updated_at ON organization_user_links;
CREATE TRIGGER organization_user_links_set_updated_at
    BEFORE UPDATE ON organization_user_links
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS user_sessions_set_updated_at ON user_sessions;
CREATE TRIGGER user_sessions_set_updated_at
    BEFORE UPDATE ON user_sessions
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS assessment_pillars_set_updated_at ON assessment_pillars;
CREATE TRIGGER assessment_pillars_set_updated_at
    BEFORE UPDATE ON assessment_pillars
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS assessment_questions_set_updated_at ON assessment_questions;
CREATE TRIGGER assessment_questions_set_updated_at
    BEFORE UPDATE ON assessment_questions
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS assessment_question_options_set_updated_at ON assessment_question_options;
CREATE TRIGGER assessment_question_options_set_updated_at
    BEFORE UPDATE ON assessment_question_options
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS assessment_submissions_set_updated_at ON assessment_submissions;
CREATE TRIGGER assessment_submissions_set_updated_at
    BEFORE UPDATE ON assessment_submissions
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS assessment_answers_set_updated_at ON assessment_answers;
CREATE TRIGGER assessment_answers_set_updated_at
    BEFORE UPDATE ON assessment_answers
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS assessment_scores_set_updated_at ON assessment_scores;
CREATE TRIGGER assessment_scores_set_updated_at
    BEFORE UPDATE ON assessment_scores
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS certification_applications_set_updated_at ON certification_applications;
CREATE TRIGGER certification_applications_set_updated_at
    BEFORE UPDATE ON certification_applications
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS certification_documents_set_updated_at ON certification_documents;
CREATE TRIGGER certification_documents_set_updated_at
    BEFORE UPDATE ON certification_documents
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS certification_reviews_set_updated_at ON certification_reviews;
CREATE TRIGGER certification_reviews_set_updated_at
    BEFORE UPDATE ON certification_reviews
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS certifications_set_updated_at ON certifications;
CREATE TRIGGER certifications_set_updated_at
    BEFORE UPDATE ON certifications
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS certification_status_history_set_updated_at ON certification_status_history;
CREATE TRIGGER certification_status_history_set_updated_at
    BEFORE UPDATE ON certification_status_history
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS reports_set_updated_at ON reports;
CREATE TRIGGER reports_set_updated_at
    BEFORE UPDATE ON reports
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS report_assets_set_updated_at ON report_assets;
CREATE TRIGGER report_assets_set_updated_at
    BEFORE UPDATE ON report_assets
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS report_access_policies_set_updated_at ON report_access_policies;
CREATE TRIGGER report_access_policies_set_updated_at
    BEFORE UPDATE ON report_access_policies
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS custom_analysis_requests_set_updated_at ON custom_analysis_requests;
CREATE TRIGGER custom_analysis_requests_set_updated_at
    BEFORE UPDATE ON custom_analysis_requests
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS custom_analysis_attachments_set_updated_at ON custom_analysis_attachments;
CREATE TRIGGER custom_analysis_attachments_set_updated_at
    BEFORE UPDATE ON custom_analysis_attachments
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS custom_analysis_status_history_set_updated_at ON custom_analysis_status_history;
CREATE TRIGGER custom_analysis_status_history_set_updated_at
    BEFORE UPDATE ON custom_analysis_status_history
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS news_articles_set_updated_at ON news_articles;
CREATE TRIGGER news_articles_set_updated_at
    BEFORE UPDATE ON news_articles
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS cms_pages_set_updated_at ON cms_pages;
CREATE TRIGGER cms_pages_set_updated_at
    BEFORE UPDATE ON cms_pages
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS iid_team_members_set_updated_at ON iid_team_members;
CREATE TRIGGER iid_team_members_set_updated_at
    BEFORE UPDATE ON iid_team_members
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS iid_partners_set_updated_at ON iid_partners;
CREATE TRIGGER iid_partners_set_updated_at
    BEFORE UPDATE ON iid_partners
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();
