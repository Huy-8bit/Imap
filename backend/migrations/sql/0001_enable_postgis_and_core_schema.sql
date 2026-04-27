CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS pg_trgm;

CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

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

DROP TRIGGER IF EXISTS provinces_set_updated_at ON provinces;
CREATE TRIGGER provinces_set_updated_at
    BEFORE UPDATE ON provinces
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS organization_types_set_updated_at ON organization_types;
CREATE TRIGGER organization_types_set_updated_at
    BEFORE UPDATE ON organization_types
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS operational_statuses_set_updated_at ON operational_statuses;
CREATE TRIGGER operational_statuses_set_updated_at
    BEFORE UPDATE ON operational_statuses
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS industry_sectors_set_updated_at ON industry_sectors;
CREATE TRIGGER industry_sectors_set_updated_at
    BEFORE UPDATE ON industry_sectors
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS environmental_impact_areas_set_updated_at ON environmental_impact_areas;
CREATE TRIGGER environmental_impact_areas_set_updated_at
    BEFORE UPDATE ON environmental_impact_areas
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS product_types_set_updated_at ON product_types;
CREATE TRIGGER product_types_set_updated_at
    BEFORE UPDATE ON product_types
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS impact_entity_types_set_updated_at ON impact_entity_types;
CREATE TRIGGER impact_entity_types_set_updated_at
    BEFORE UPDATE ON impact_entity_types
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS sdgs_set_updated_at ON sdgs;
CREATE TRIGGER sdgs_set_updated_at
    BEFORE UPDATE ON sdgs
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS certification_levels_set_updated_at ON certification_levels;
CREATE TRIGGER certification_levels_set_updated_at
    BEFORE UPDATE ON certification_levels
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS user_roles_set_updated_at ON user_roles;
CREATE TRIGGER user_roles_set_updated_at
    BEFORE UPDATE ON user_roles
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS organizations_set_updated_at ON organizations;
CREATE TRIGGER organizations_set_updated_at
    BEFORE UPDATE ON organizations
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS organization_contacts_set_updated_at ON organization_contacts;
CREATE TRIGGER organization_contacts_set_updated_at
    BEFORE UPDATE ON organization_contacts
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();

DROP TRIGGER IF EXISTS organization_locations_set_updated_at ON organization_locations;
CREATE TRIGGER organization_locations_set_updated_at
    BEFORE UPDATE ON organization_locations
    FOR EACH ROW
    EXECUTE FUNCTION set_updated_at();
