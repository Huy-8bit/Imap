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


class EnterpriseMapApiTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        try:
            cls._prepare_database()
            from fastapi.testclient import TestClient

            from backend.service.app import create_service

            cls._client_context = TestClient(create_service())
            cls.client = cls._client_context.__enter__()
        except Exception as exc:
            raise unittest.SkipTest(f"enterprise map integration tests require local Postgres/Redis: {exc}") from exc

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
                source_name="enterprise_map_fixture",
                dry_run=False,
            )

            db.execute(
                """
                UPDATE organization_locations ol
                SET
                    latitude = data.latitude,
                    longitude = data.longitude,
                    geom = ST_SetSRID(ST_MakePoint(data.longitude, data.latitude), 4326),
                    location_precision = data.location_precision,
                    geocode_source = 'fixture',
                    full_address = data.full_address,
                    updated_at = NOW()
                FROM (
                    VALUES
                        ('ORG-CAT-001', 10.776889::double precision, 106.700806::double precision, 'exact', '1 Nguyen Hue, Ho Chi Minh City'),
                        ('ORG-CAT-002', 21.045993::double precision, 105.840816::double precision, 'approximate', '12 Truc Bach, Hanoi')
                ) AS data(external_code, latitude, longitude, location_precision, full_address)
                JOIN organizations o ON o.external_code = data.external_code
                WHERE ol.organization_id = o.id
                """
            )
        finally:
            db.close()

    def test_map_enterprises_returns_geojson_feature_collection(self) -> None:
        response = self.client.get(
            "/api/map/enterprises",
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
        self.assertTrue(payload["success"])
        self.assertEqual(payload["data"]["type"], "FeatureCollection")
        self.assertEqual(payload["meta"]["matched_total"], 1)
        self.assertEqual(payload["meta"]["mappable_total"], 1)
        self.assertEqual(payload["meta"]["unmapped_total"], 0)
        self.assertEqual(payload["meta"]["returned_total"], 1)

        feature = payload["data"]["features"][0]
        self.assertEqual(feature["type"], "Feature")
        self.assertEqual(feature["geometry"]["type"], "Point")
        self.assertAlmostEqual(feature["geometry"]["coordinates"][0], 106.700806, places=6)
        self.assertAlmostEqual(feature["geometry"]["coordinates"][1], 10.776889, places=6)
        self.assertEqual(feature["properties"]["external_code"], "ORG-CAT-001")
        self.assertEqual(feature["properties"]["province"]["code"], "ho_chi_minh_city")
        self.assertEqual(feature["properties"]["location_precision"], "exact")

    def test_map_enterprises_applies_bbox_filter(self) -> None:
        response = self.client.get(
            "/api/map/enterprises",
            params={"bbox": "105.80,21.00,105.90,21.08"},
        )

        self.assertEqual(response.status_code, 200)
        payload = response.json()
        self.assertEqual(payload["meta"]["returned_total"], 1)
        self.assertEqual(payload["meta"]["bbox"]["min_longitude"], 105.8)
        self.assertEqual(payload["data"]["features"][0]["properties"]["external_code"], "ORG-CAT-002")

    def test_map_enterprises_skips_unmapped_records_and_reports_meta(self) -> None:
        response = self.client.get(
            "/api/map/enterprises",
            params={
                "province": "da_nang",
                "organizationType": "foreign_invested_enterprise",
            },
        )

        self.assertEqual(response.status_code, 200)
        payload = response.json()
        self.assertEqual(payload["data"]["features"], [])
        self.assertEqual(payload["meta"]["matched_total"], 1)
        self.assertEqual(payload["meta"]["mappable_total"], 0)
        self.assertEqual(payload["meta"]["unmapped_total"], 1)
        self.assertEqual(payload["meta"]["returned_total"], 0)

    def test_map_enterprises_rejects_invalid_bbox(self) -> None:
        response = self.client.get("/api/map/enterprises", params={"bbox": "106.1,10.7,105.9,10.8"})

        self.assertEqual(response.status_code, 422)
        payload = response.json()
        self.assertFalse(payload["success"])
        self.assertEqual(payload["message"], "bbox min values must be smaller than max values")


if __name__ == "__main__":
    unittest.main(verbosity=2)
