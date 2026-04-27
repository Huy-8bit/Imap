from __future__ import annotations

from backend.libs.database import PostgreSQLClient

from .schemas import (
    DashboardBreakdownDimension,
    DashboardBreakdownParams,
    DashboardGrowthParams,
    DashboardImpactFlowParams,
    EnterpriseFilterParams,
    EnterpriseFeaturedParams,
    EnterpriseListParams,
    EnterpriseListSort,
    EnterpriseMapParams,
    EnterpriseSearchParams,
    MapBoundingBox,
    SortOrder,
    StatsOverviewParams,
)
from .validators import clean_text

SORT_SQL: dict[EnterpriseListSort, str] = {
    EnterpriseListSort.NAME: "lower(coalesce(o.trade_name, o.registered_name, ''))",
    EnterpriseListSort.FOUNDED_YEAR: "o.founded_year",
    EnterpriseListSort.CREATED_AT: "o.created_at",
    EnterpriseListSort.UPDATED_AT: "o.updated_at",
}

SEARCH_DOCUMENT_SQL = "coalesce(o.trade_name, '') || ' ' || coalesce(o.registered_name, '')"
SEARCH_SIMILARITY_THRESHOLD = 0.1
ACTIVE_STATUS_CODE = "active"
FILTER_FROM_SQL = """
FROM organizations o
LEFT JOIN organization_locations ol ON ol.organization_id = o.id
LEFT JOIN provinces p ON p.id = ol.province_id
LEFT JOIN operational_statuses os ON os.id = o.operational_status_id
LEFT JOIN organization_types ot ON ot.id = o.organization_type_id
LEFT JOIN industry_sectors pis ON pis.id = o.primary_industry_sector_id
"""
CATALOG_FROM_SQL = """
FROM organizations o
LEFT JOIN organization_locations ol ON ol.organization_id = o.id
LEFT JOIN organization_contacts oc ON oc.organization_id = o.id
LEFT JOIN provinces p ON p.id = ol.province_id
LEFT JOIN operational_statuses os ON os.id = o.operational_status_id
LEFT JOIN organization_types ot ON ot.id = o.organization_type_id
LEFT JOIN industry_sectors pis ON pis.id = o.primary_industry_sector_id
LEFT JOIN impact_entity_types iet ON iet.id = o.impact_entity_type_id
LEFT JOIN LATERAL (
    SELECT
        coalesce(
            jsonb_agg(
                jsonb_build_object(
                    'id', eia.id,
                    'code', eia.code,
                    'display_name', eia.display_name
                )
                ORDER BY oei.sort_order ASC, eia.display_name ASC
            ),
            '[]'::jsonb
        ) AS environmental_impact_areas
    FROM organization_environmental_impacts oei
    JOIN environmental_impact_areas eia ON eia.id = oei.environmental_impact_area_id
    WHERE oei.organization_id = o.id
) env ON TRUE
"""
MAPPABLE_GEOMETRY_SQL = """
ol.geom IS NOT NULL
AND ST_IsValid(ol.geom)
AND GeometryType(ol.geom) = 'POINT'
"""
DASHBOARD_BREAKDOWN_DIMENSIONS: dict[DashboardBreakdownDimension, dict[str, str]] = {
    DashboardBreakdownDimension.PROVINCE: {
        "code_sql": "p.code",
        "name_sql": "p.display_name",
        "nonnull_sql": "p.id IS NOT NULL",
    },
    DashboardBreakdownDimension.ORGANIZATION_TYPE: {
        "code_sql": "ot.code",
        "name_sql": "ot.display_name",
        "nonnull_sql": "ot.id IS NOT NULL",
    },
    DashboardBreakdownDimension.PRIMARY_INDUSTRY_SECTOR: {
        "code_sql": "pis.code",
        "name_sql": "pis.display_name",
        "nonnull_sql": "pis.id IS NOT NULL",
    },
}


class OrganizationCatalogRepository:
    def __init__(self, db: PostgreSQLClient) -> None:
        self._db = db

    def list_featured_enterprises(self, params: EnterpriseFeaturedParams) -> list[dict]:
        return self._db.fetch_all(
            f"""
            SELECT
                o.id,
                o.external_code,
                coalesce(o.trade_name, o.registered_name) AS display_name,
                o.trade_name,
                o.registered_name,
                {self._taxonomy_json("p")} AS province,
                {self._taxonomy_json("ot")} AS organization_type,
                {self._taxonomy_json("pis")} AS primary_industry_sector,
                o.star_rating,
                oc.website,
                o.is_featured
            {CATALOG_FROM_SQL}
            WHERE o.is_featured IS TRUE
            ORDER BY o.star_rating DESC NULLS LAST, o.updated_at DESC, o.id DESC
            LIMIT %(limit)s
            """,
            {"limit": params.limit},
        )

    def list_enterprises(self, params: EnterpriseListParams) -> tuple[list[dict], int]:
        where_sql, where_params = self._build_filter_query(params)
        total = self._count_enterprises(where_sql, where_params)

        query_params = {
            **where_params,
            "limit": params.page_size,
            "offset": (params.page - 1) * params.page_size,
        }
        rows = self._db.fetch_all(
            f"""
            SELECT
                o.id,
                o.external_code,
                coalesce(o.trade_name, o.registered_name) AS display_name,
                o.trade_name,
                o.registered_name,
                o.founded_year,
                {self._taxonomy_json("p")} AS province,
                ol.ward_name,
                {self._taxonomy_json("os")} AS operational_status,
                {self._taxonomy_json("ot")} AS organization_type,
                {self._taxonomy_json("pis")} AS primary_industry_sector,
                coalesce(env.environmental_impact_areas, '[]'::jsonb) AS environmental_impact_areas,
                o.has_positive_social_impact,
                {self._taxonomy_json("iet")} AS impact_entity_type,
                o.star_rating,
                o.is_featured,
                oc.website,
                ol.location_precision,
                o.source_status
            {CATALOG_FROM_SQL}
            WHERE {where_sql}
            ORDER BY {self._build_order_clause(params.sort, params.order)}
            LIMIT %(limit)s OFFSET %(offset)s
            """,
            query_params,
        )
        return rows, total

    def search_enterprises(self, params: EnterpriseSearchParams) -> tuple[list[dict], int]:
        normalized_query = clean_text(params.q)
        search_params = {
            "q": normalized_query,
            "prefix_q": f"{normalized_query}%",
            "contains_q": f"%{normalized_query}%",
        }

        total_row = self._db.fetch_one(
            f"""
            SELECT COUNT(*) AS total
            FROM organizations o
            WHERE similarity({SEARCH_DOCUMENT_SQL}, %(q)s) >= %(similarity_threshold)s
               OR {SEARCH_DOCUMENT_SQL} ILIKE %(contains_q)s
            """,
            {
                **search_params,
                "similarity_threshold": SEARCH_SIMILARITY_THRESHOLD,
            },
        )
        total = int(total_row["total"]) if total_row else 0

        rows = self._db.fetch_all(
            f"""
            SELECT
                o.id,
                o.external_code,
                coalesce(o.trade_name, o.registered_name) AS display_name,
                o.trade_name,
                o.registered_name,
                o.founded_year,
                {self._taxonomy_json("p")} AS province,
                ol.ward_name,
                {self._taxonomy_json("os")} AS operational_status,
                {self._taxonomy_json("ot")} AS organization_type,
                {self._taxonomy_json("pis")} AS primary_industry_sector,
                coalesce(env.environmental_impact_areas, '[]'::jsonb) AS environmental_impact_areas,
                o.has_positive_social_impact,
                {self._taxonomy_json("iet")} AS impact_entity_type,
                o.star_rating,
                o.is_featured,
                oc.website,
                ol.location_precision,
                o.source_status
            {CATALOG_FROM_SQL}
            WHERE similarity({SEARCH_DOCUMENT_SQL}, %(q)s) >= %(similarity_threshold)s
               OR {SEARCH_DOCUMENT_SQL} ILIKE %(contains_q)s
            ORDER BY
                CASE
                    WHEN lower(coalesce(o.trade_name, '')) = lower(%(q)s) THEN 1.0
                    WHEN lower(coalesce(o.registered_name, '')) = lower(%(q)s) THEN 0.99
                    WHEN lower(coalesce(o.trade_name, '')) LIKE lower(%(prefix_q)s) THEN 0.95
                    WHEN lower(coalesce(o.registered_name, '')) LIKE lower(%(prefix_q)s) THEN 0.90
                    ELSE greatest(
                        similarity({SEARCH_DOCUMENT_SQL}, %(q)s),
                        similarity(coalesce(o.trade_name, ''), %(q)s),
                        similarity(coalesce(o.registered_name, ''), %(q)s)
                    )
                END DESC,
                lower(coalesce(o.trade_name, o.registered_name, '')) ASC,
                o.id ASC
            LIMIT %(limit)s OFFSET %(offset)s
            """,
            {
                **search_params,
                "similarity_threshold": SEARCH_SIMILARITY_THRESHOLD,
                "limit": params.page_size,
                "offset": (params.page - 1) * params.page_size,
            },
        )
        return rows, total

    def get_enterprise_map(
        self,
        params: EnterpriseMapParams,
    ) -> tuple[list[dict], int, int]:
        where_sql, where_params = self._build_filter_query(params)
        matched_total = self._count_enterprises(where_sql, where_params)
        mappable_total = self._count_enterprises(
            where_sql,
            where_params,
            extra_condition=MAPPABLE_GEOMETRY_SQL,
        )

        bbox_sql = self._build_bbox_clause(params.bbox, where_params)
        feature_conditions = [where_sql, MAPPABLE_GEOMETRY_SQL]
        if bbox_sql is not None:
            feature_conditions.append(bbox_sql)

        rows = self._db.fetch_all(
            f"""
            SELECT
                ST_AsGeoJSON(ol.geom)::jsonb AS geometry,
                o.id,
                o.external_code,
                coalesce(o.trade_name, o.registered_name) AS display_name,
                o.trade_name,
                o.registered_name,
                {self._taxonomy_json("p")} AS province,
                {self._taxonomy_json("os")} AS operational_status,
                {self._taxonomy_json("ot")} AS organization_type,
                {self._taxonomy_json("pis")} AS primary_industry_sector,
                coalesce(env.environmental_impact_areas, '[]'::jsonb) AS environmental_impact_areas,
                o.has_positive_social_impact,
                o.star_rating,
                ol.location_precision,
                oc.website
            {CATALOG_FROM_SQL}
            WHERE {" AND ".join(feature_conditions)}
            ORDER BY lower(coalesce(o.trade_name, o.registered_name, '')) ASC, o.id ASC
            """,
            where_params,
        )
        return rows, matched_total, mappable_total

    def get_stats_overview(self, params: StatsOverviewParams) -> dict:
        where_sql, where_params = self._build_filter_query(params)
        row = self._db.fetch_one(
            f"""
            SELECT
                COUNT(*)::bigint AS total_organizations,
                COUNT(*) FILTER (WHERE os.code = %(active_status_code)s)::bigint AS active_organizations,
                COUNT(DISTINCT ol.province_id)::bigint AS provinces_count,
                COUNT(*) FILTER (WHERE o.has_positive_social_impact IS TRUE)::bigint AS social_impact_organizations,
                COUNT(*) FILTER (
                    WHERE EXISTS (
                        SELECT 1
                        FROM organization_environmental_impacts oei
                        WHERE oei.organization_id = o.id
                    )
                )::bigint AS environmental_impact_organizations,
                COUNT(*) FILTER (
                    WHERE {MAPPABLE_GEOMETRY_SQL}
                )::bigint AS mappable_organizations
            {FILTER_FROM_SQL}
            WHERE {where_sql}
            """,
            {
                **where_params,
                "active_status_code": ACTIVE_STATUS_CODE,
            },
        )
        return row or {
            "total_organizations": 0,
            "active_organizations": 0,
            "provinces_count": 0,
            "social_impact_organizations": 0,
            "environmental_impact_organizations": 0,
            "mappable_organizations": 0,
        }

    def get_dashboard_breakdown(
        self,
        params: DashboardBreakdownParams,
        *,
        dimension: DashboardBreakdownDimension,
    ) -> tuple[list[dict], int]:
        config = DASHBOARD_BREAKDOWN_DIMENSIONS[dimension]
        where_sql, where_params = self._build_filter_query(params)
        matched_total = self._count_enterprises(where_sql, where_params)

        rows = self._db.fetch_all(
            f"""
            SELECT
                {config["code_sql"]} AS bucket_code,
                {config["name_sql"]} AS bucket_name,
                COUNT(*)::bigint AS organization_count,
                COUNT(*) FILTER (
                    WHERE {MAPPABLE_GEOMETRY_SQL}
                )::bigint AS mappable_count
            {FILTER_FROM_SQL}
            WHERE {where_sql}
              AND {config["nonnull_sql"]}
            GROUP BY {config["code_sql"]}, {config["name_sql"]}
            ORDER BY organization_count DESC, lower({config["code_sql"]}) ASC
            """
            ,
            where_params,
        )
        return rows, matched_total

    def get_dashboard_growth(self, params: DashboardGrowthParams) -> tuple[list[dict], int]:
        where_sql, query_params = self._build_filter_query(params)
        conditions = [where_sql, "o.founded_year IS NOT NULL"]
        if params.year_from is not None:
            conditions.append("o.founded_year >= %(year_from)s")
            query_params["year_from"] = params.year_from
        if params.year_to is not None:
            conditions.append("o.founded_year <= %(year_to)s")
            query_params["year_to"] = params.year_to

        final_where_sql = " AND ".join(conditions)
        matched_total = self._count_enterprises(final_where_sql, query_params)
        rows = self._db.fetch_all(
            f"""
            SELECT
                o.founded_year,
                COUNT(*)::bigint AS total_count,
                COUNT(*) FILTER (WHERE os.code = %(active_status_code)s)::bigint AS active_count,
                COUNT(*) FILTER (
                    WHERE os.code IS DISTINCT FROM %(active_status_code)s
                )::bigint AS inactive_count,
                COUNT(*) FILTER (
                    WHERE o.has_positive_social_impact IS TRUE
                )::bigint AS social_impact_count
            {FILTER_FROM_SQL}
            WHERE {final_where_sql}
            GROUP BY o.founded_year
            ORDER BY o.founded_year ASC
            """,
            {
                **query_params,
                "active_status_code": ACTIVE_STATUS_CODE,
            },
        )
        return rows, matched_total

    def get_dashboard_impact_flows(self, params: DashboardImpactFlowParams) -> tuple[list[dict], int]:
        where_sql, query_params = self._build_filter_query(params)
        matched_total = self._count_enterprises(where_sql, query_params)
        query_params = {**query_params, "limit": params.limit}

        rows = self._db.fetch_all(
            f"""
            SELECT
                {self._taxonomy_json("pis")} AS primary_industry_sector,
                {self._taxonomy_json("eia")} AS environmental_impact_area,
                {self._taxonomy_json("p")} AS province,
                {self._taxonomy_json("ot")} AS organization_type,
                COUNT(DISTINCT o.id)::bigint AS organization_count,
                COUNT(DISTINCT o.id) FILTER (
                    WHERE o.has_positive_social_impact IS TRUE
                )::bigint AS social_impact_count,
                COUNT(DISTINCT o.id) FILTER (
                    WHERE {MAPPABLE_GEOMETRY_SQL}
                )::bigint AS mappable_count
            {FILTER_FROM_SQL}
            JOIN organization_environmental_impacts oei ON oei.organization_id = o.id
            JOIN environmental_impact_areas eia ON eia.id = oei.environmental_impact_area_id
            WHERE {where_sql}
            GROUP BY pis.id, p.id, ot.id, eia.id
            ORDER BY organization_count DESC, lower(pis.code) ASC, lower(eia.code) ASC
            LIMIT %(limit)s
            """,
            query_params,
        )
        return rows, matched_total

    def get_enterprise_quick(self, organization_id: int) -> dict | None:
        return self._db.fetch_one(
            f"""
            SELECT
                o.id,
                o.external_code,
                coalesce(o.trade_name, o.registered_name) AS display_name,
                o.trade_name,
                o.registered_name,
                {self._taxonomy_json("p")} AS province,
                ol.full_address,
                oc.website,
                {self._taxonomy_json("ot")} AS organization_type,
                {self._taxonomy_json("os")} AS operational_status,
                ol.location_precision
            FROM organizations o
            LEFT JOIN organization_contacts oc ON oc.organization_id = o.id
            LEFT JOIN organization_locations ol ON ol.organization_id = o.id
            LEFT JOIN provinces p ON p.id = ol.province_id
            LEFT JOIN organization_types ot ON ot.id = o.organization_type_id
            LEFT JOIN operational_statuses os ON os.id = o.operational_status_id
            WHERE o.id = %s
            LIMIT 1
            """,
            (organization_id,),
        )

    def get_latest_assessment_snapshot(self, organization_id: int) -> dict | None:
        return self._db.fetch_one(
            """
            SELECT
                organization_id,
                overall_score,
                pillars_json,
                summary_json,
                scoring_version,
                created_at
            FROM assessment_result_snapshots
            WHERE organization_id = %s
            ORDER BY created_at DESC, id DESC
            LIMIT 1
            """,
            (organization_id,),
        )

    def list_assessment_pillars(self) -> list[dict]:
        return self._db.fetch_all(
            """
            SELECT id, code, display_name, description, sort_order
            FROM assessment_pillars
            WHERE is_active IS TRUE
            ORDER BY sort_order ASC, id ASC
            """
        )

    def get_enterprise_detail(self, organization_id: int) -> dict | None:
        return self._db.fetch_one(
            f"""
            SELECT
                o.id,
                o.external_code,
                coalesce(o.trade_name, o.registered_name) AS display_name,
                o.source_status,
                o.is_featured,
                o.created_at,
                o.updated_at,
                jsonb_build_object(
                    'trade_name', o.trade_name,
                    'registered_name', o.registered_name,
                    'founded_year', o.founded_year,
                    'tax_code', o.tax_code,
                    'operational_status', {self._taxonomy_json("os")},
                    'closed_year', o.closed_year
                ) AS general,
                jsonb_build_object(
                    'organization_type', {self._taxonomy_json("ot")},
                    'primary_industry_sector', {self._taxonomy_json("pis")},
                    'other_industry_sectors', coalesce(sec.other_industry_sectors, '[]'::jsonb),
                    'environmental_impact_areas', coalesce(env.environmental_impact_areas, '[]'::jsonb),
                    'has_positive_social_impact', o.has_positive_social_impact,
                    'primary_product_type', {self._taxonomy_json("ppt")},
                    'other_product_type', {self._taxonomy_json("opt")},
                    'impact_entity_type', {self._taxonomy_json("iet")},
                    'star_rating', o.star_rating
                ) AS classification,
                jsonb_build_object(
                    'website', oc.website,
                    'email', oc.email,
                    'phone', oc.phone
                ) AS contacts,
                jsonb_build_object(
                    'province', {self._taxonomy_json("p")},
                    'ward_name', ol.ward_name,
                    'full_address', ol.full_address,
                    'latitude', ol.latitude,
                    'longitude', ol.longitude,
                    'location_precision', ol.location_precision,
                    'geocode_source', ol.geocode_source
                ) AS location
            FROM organizations o
            LEFT JOIN organization_contacts oc ON oc.organization_id = o.id
            LEFT JOIN organization_locations ol ON ol.organization_id = o.id
            LEFT JOIN provinces p ON p.id = ol.province_id
            LEFT JOIN operational_statuses os ON os.id = o.operational_status_id
            LEFT JOIN organization_types ot ON ot.id = o.organization_type_id
            LEFT JOIN industry_sectors pis ON pis.id = o.primary_industry_sector_id
            LEFT JOIN product_types ppt ON ppt.id = o.primary_product_type_id
            LEFT JOIN product_types opt ON opt.id = o.other_product_type_id
            LEFT JOIN impact_entity_types iet ON iet.id = o.impact_entity_type_id
            LEFT JOIN LATERAL (
                SELECT
                    coalesce(
                        jsonb_agg(
                            jsonb_build_object(
                                'id', is2.id,
                                'code', is2.code,
                                'display_name', is2.display_name
                            )
                            ORDER BY ois.sort_order ASC, is2.display_name ASC
                        ),
                        '[]'::jsonb
                    ) AS other_industry_sectors
                FROM organization_industry_sectors ois
                JOIN industry_sectors is2 ON is2.id = ois.industry_sector_id
                WHERE ois.organization_id = o.id
            ) sec ON TRUE
            LEFT JOIN LATERAL (
                SELECT
                    coalesce(
                        jsonb_agg(
                            jsonb_build_object(
                                'id', eia.id,
                                'code', eia.code,
                                'display_name', eia.display_name
                            )
                            ORDER BY oei.sort_order ASC, eia.display_name ASC
                        ),
                        '[]'::jsonb
                    ) AS environmental_impact_areas
                FROM organization_environmental_impacts oei
                JOIN environmental_impact_areas eia ON eia.id = oei.environmental_impact_area_id
                WHERE oei.organization_id = o.id
            ) env ON TRUE
            WHERE o.id = %s
            """,
            (organization_id,),
        )

    def _build_filter_query(self, params: EnterpriseFilterParams) -> tuple[str, dict]:
        filters: list[str] = ["1 = 1"]
        query_params: dict[str, object] = {}

        province = clean_text(params.province)
        if province is not None:
            filters.append("p.code = %(province)s")
            query_params["province"] = province

        operational_status = clean_text(params.operational_status)
        if operational_status is not None:
            filters.append("os.code = %(operational_status)s")
            query_params["operational_status"] = operational_status

        organization_type = clean_text(params.organization_type)
        if organization_type is not None:
            filters.append("ot.code = %(organization_type)s")
            query_params["organization_type"] = organization_type

        primary_industry_sector = clean_text(params.primary_industry_sector)
        if primary_industry_sector is not None:
            filters.append("pis.code = %(primary_industry_sector)s")
            query_params["primary_industry_sector"] = primary_industry_sector

        if params.has_positive_social_impact is not None:
            filters.append("o.has_positive_social_impact = %(has_positive_social_impact)s")
            query_params["has_positive_social_impact"] = params.has_positive_social_impact

        environmental_impact_area = clean_text(params.environmental_impact_area)
        if environmental_impact_area is not None:
            filters.append(
                """
                EXISTS (
                    SELECT 1
                    FROM organization_environmental_impacts oei_filter
                    JOIN environmental_impact_areas eia_filter
                        ON eia_filter.id = oei_filter.environmental_impact_area_id
                    WHERE oei_filter.organization_id = o.id
                      AND eia_filter.code = %(environmental_impact_area)s
                )
                """
            )
            query_params["environmental_impact_area"] = environmental_impact_area

        return " AND ".join(filters), query_params

    def _count_enterprises(
        self,
        where_sql: str,
        query_params: dict,
        *,
        extra_condition: str | None = None,
    ) -> int:
        conditions = [where_sql]
        if extra_condition is not None:
            conditions.append(extra_condition)

        row = self._db.fetch_one(
            f"""
            SELECT COUNT(*) AS total
            {FILTER_FROM_SQL}
            WHERE {" AND ".join(conditions)}
            """,
            query_params,
        )
        return int(row["total"]) if row else 0

    def _build_bbox_clause(self, bbox: MapBoundingBox | None, query_params: dict[str, object]) -> str | None:
        if bbox is None:
            return None

        query_params.update(
            {
                "bbox_min_longitude": bbox.min_longitude,
                "bbox_min_latitude": bbox.min_latitude,
                "bbox_max_longitude": bbox.max_longitude,
                "bbox_max_latitude": bbox.max_latitude,
            }
        )
        return """
        ST_Intersects(
            ol.geom,
            ST_MakeEnvelope(
                %(bbox_min_longitude)s,
                %(bbox_min_latitude)s,
                %(bbox_max_longitude)s,
                %(bbox_max_latitude)s,
                4326
            )
        )
        """

    def _build_order_clause(self, sort: EnterpriseListSort, order: SortOrder) -> str:
        expression = SORT_SQL[sort]
        direction = "DESC" if order == SortOrder.DESC else "ASC"
        tie_breaker = "o.id DESC" if order == SortOrder.DESC else "o.id ASC"
        return f"{expression} {direction} NULLS LAST, {tie_breaker}"

    def _taxonomy_json(self, alias: str) -> str:
        return (
            f"CASE WHEN {alias}.id IS NULL THEN NULL "
            f"ELSE jsonb_build_object("
            f"'id', {alias}.id, "
            f"'code', {alias}.code, "
            f"'display_name', {alias}.display_name"
            f") END"
        )
