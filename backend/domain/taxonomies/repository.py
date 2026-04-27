from __future__ import annotations

from backend.libs.database import PostgreSQLClient

from .constants import PUBLIC_TAXONOMIES, TAXONOMY_TABLES, TaxonomyName


class TaxonomyRepository:
    def __init__(self, db: PostgreSQLClient) -> None:
        self._db = db

    def list_taxonomy(self, name: TaxonomyName, *, include_inactive: bool = False) -> list[dict]:
        table = TAXONOMY_TABLES[name]
        where_clause = "" if include_inactive else "WHERE is_active = TRUE"
        query = f"""
            SELECT
                id,
                code,
                display_name,
                display_name_en,
                display_name_vi,
                sort_order,
                metadata
            FROM {table}
            {where_clause}
            ORDER BY sort_order ASC, display_name ASC, id ASC
        """
        return self._db.fetch_all(query)

    def list_all(self, *, include_inactive: bool = False) -> dict[str, list[dict]]:
        return {
            taxonomy.value: self.list_taxonomy(taxonomy, include_inactive=include_inactive)
            for taxonomy in PUBLIC_TAXONOMIES
        }
