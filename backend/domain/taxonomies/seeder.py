from __future__ import annotations

import json

from backend.libs.database import PostgreSQLClient

from .constants import TAXONOMY_TABLES, TaxonomyName
from .seed_loader import TaxonomySeedRow


class TaxonomySeeder:
    def __init__(self, db: PostgreSQLClient) -> None:
        self._db = db

    def seed_all(self, bundle: dict[TaxonomyName, list[TaxonomySeedRow]]) -> dict[str, int]:
        summary: dict[str, int] = {}
        for taxonomy_name, rows in bundle.items():
            table = TAXONOMY_TABLES[taxonomy_name]
            count = self._seed_table(table, rows)
            summary[taxonomy_name.value] = count
        return summary

    def _seed_table(self, table: str, rows: list[TaxonomySeedRow]) -> int:
        if not rows:
            return 0

        query = f"""
            INSERT INTO {table} (
                code,
                display_name,
                display_name_en,
                display_name_vi,
                sort_order,
                is_active,
                metadata
            )
            VALUES (
                %(code)s,
                %(display_name)s,
                %(display_name_en)s,
                %(display_name_vi)s,
                %(sort_order)s,
                TRUE,
                %(metadata)s::jsonb
            )
            ON CONFLICT (code) DO UPDATE
            SET
                display_name = EXCLUDED.display_name,
                display_name_en = EXCLUDED.display_name_en,
                display_name_vi = EXCLUDED.display_name_vi,
                sort_order = EXCLUDED.sort_order,
                is_active = TRUE,
                metadata = EXCLUDED.metadata,
                updated_at = NOW()
        """
        params = [
            {
                "code": row.code,
                "display_name": row.display_name,
                "display_name_en": row.display_name_en,
                "display_name_vi": row.display_name_vi,
                "sort_order": row.sort_order,
                "metadata": json.dumps(row.metadata, ensure_ascii=False),
            }
            for row in rows
        ]
        self._db.execute_many(query, params)
        return len(rows)
