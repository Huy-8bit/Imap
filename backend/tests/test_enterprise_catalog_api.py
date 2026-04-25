from __future__ import annotations

import os
import unittest
from pathlib import Path

from backend.domain.organizations import OrganizationImportRepository, OrganizationImportService
from backend.domain.taxonomies.seed_loader import build_seed_bundle
from backend.domain.taxonomies.seeder import TaxonomySeeder
from backend.libs.database.postgreSQL.client import PostgreSQLClient
from backend.libs.database.postgreSQL.config import PostgreSQLConfig
from backend.scripts.migrate import apply_migrations, ensure_schema_migrations_table


ROOT_DIR = Path(__file__).resolve().parents[2]
FIXTURE_DATASET_PATH = ROOT_DIR / "backend" / "tests" / "fixtures" / "enterprise_catalog_dataset.json"
SAMPLE_DATA_DIR = ROOT_DIR / "docs" / "iMapVN" / "Data" / "Sample-iMap-Json"
WORKBOOK_PATH = ROOT_DIR / "docs" / "iMapVN" / "Data" / "BẢNG HỎI NHẬP LIỆU DỮ LIỆU SIBs (final).xlsx"


def _build_postgresql_client() -> PostgreSQLClient:
    config = PostgreSQLConfig(
        host=os.getenv("PG_HOST", "127.0.0.1"),
        port=int(os.getenv("PG_PORT", "5432")),
        database=os.getenv("PG_DATABASE", "imap"),
        user=os.getenv("PG_USER", "postgres"),
        password=os.getenv("PG_PASSWORD", "postgres"),
    )
    client = PostgreSQLClient(config)
    client.connect()
    return client


class EnterpriseCatalogApiTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        try:
            cls._prepare_database()
            from fastapi.testclient import TestClient

            from backend.service.app import create_service

            cls._client_context = TestClient(create_service())
            cls.client = cls._client_context.__enter__()
        except Exception as exc:
            raise unittest.SkipTest(f"enterprise catalog integration tests require local Postgres/Redis: {exc}") from exc

    @classmethod
    def tearDownClass(cls) -> None:
        if hasattr(cls, "_client_context"):
            cls._client_context.__exit__(None, None, None)

    @classmethod
    def _prepare_database(cls) -> None:
        db = _build_postgresql_client()
        try:
            ensure_schema_migrations_table(db)
            apply_migrations(db)

            bundle = build_seed_bundle(SAMPLE_DATA_DIR, WORKBOOK_PATH)
            TaxonomySeeder(db).seed_all(bundle)

            OrganizationImportService(OrganizationImportRepository(db)).import_file(
                FIXTURE_DATASET_PATH,
                source_name="enterprise_catalog_fixture",
                dry_run=False,
            )

            rows = db.fetch_all(
                """
                SELECT id, external_code
                FROM organizations
                WHERE external_code LIKE 'ORG-CAT-%'
                ORDER BY external_code ASC
                """
            )
            cls.enterprise_ids = {row["external_code"]: row["id"] for row in rows}
        finally:
            db.close()

    def test_list_enterprises_returns_paginated_results(self) -> None:
        response = self.client.get("/api/enterprises", params={"page": 1, "page_size": 10})

        self.assertEqual(response.status_code, 200)
        payload = response.json()
        self.assertTrue(payload["success"])
        self.assertIn("meta", payload)
        self.assertGreaterEqual(payload["meta"]["total"], 3)
        external_codes = {item["external_code"] for item in payload["data"] if item["external_code"]}
        self.assertIn("ORG-CAT-001", external_codes)

    def test_list_enterprises_applies_filters(self) -> None:
        response = self.client.get(
            "/api/enterprises",
            params={
                "province": "ho_chi_minh_city",
                "operationalStatus": "active",
                "organizationType": "private_enterprise",
                "primaryIndustrySector": "manufacturing",
                "hasPositiveSocialImpact": "true",
                "environmentalImpactArea": "climate_change",
            },
        )

        self.assertEqual(response.status_code, 200)
        payload = response.json()
        self.assertEqual(payload["meta"]["total"], 1)
        self.assertEqual(payload["data"][0]["external_code"], "ORG-CAT-001")

    def test_search_enterprises_returns_ranked_matches(self) -> None:
        response = self.client.get(
            "/api/enterprises/search",
            params={"q": "Catalog Alpha", "page": 1, "page_size": 5},
        )

        self.assertEqual(response.status_code, 200)
        payload = response.json()
        self.assertGreaterEqual(payload["meta"]["total"], 1)
        self.assertEqual(payload["data"][0]["external_code"], "ORG-CAT-001")

    def test_search_enterprises_rejects_short_query(self) -> None:
        response = self.client.get("/api/enterprises/search", params={"q": "a"})

        self.assertEqual(response.status_code, 422)
        payload = response.json()
        self.assertFalse(payload["success"])
        self.assertEqual(payload["message"], "search query must contain at least 2 non-space characters")

    def test_get_enterprise_detail_returns_public_payload(self) -> None:
        enterprise_id = self.enterprise_ids["ORG-CAT-001"]
        response = self.client.get(f"/api/enterprises/{enterprise_id}")

        self.assertEqual(response.status_code, 200)
        payload = response.json()
        self.assertTrue(payload["success"])
        self.assertEqual(payload["data"]["external_code"], "ORG-CAT-001")
        self.assertEqual(payload["data"]["general"]["trade_name"], "Catalog Alpha Impact Co")
        self.assertEqual(payload["data"]["classification"]["organization_type"]["code"], "private_enterprise")
        self.assertEqual(payload["data"]["location"]["province"]["code"], "ho_chi_minh_city")
        self.assertEqual(payload["data"]["contacts"]["email"], "alpha@catalog.example.vn")

    def test_get_enterprise_detail_returns_404_for_missing_record(self) -> None:
        response = self.client.get("/api/enterprises/999999999")

        self.assertEqual(response.status_code, 404)
        payload = response.json()
        self.assertFalse(payload["success"])
        self.assertEqual(payload["message"], "enterprise not found")


if __name__ == "__main__":
    unittest.main(verbosity=2)
