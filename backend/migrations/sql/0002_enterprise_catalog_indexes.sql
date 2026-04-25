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
