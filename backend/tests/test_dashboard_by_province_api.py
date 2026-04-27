from __future__ import annotations

import os
import unittest
from pathlib import Path

from backend.domain.organizations import (
    DashboardBreakdownService,
    OrganizationImportRepository,
    OrganizationImportService,
)
from backend.domain.organizations.schemas import DashboardBreakdownDimension, DashboardBreakdownParams
from backend.domain.taxonomies.seed_loader import build_seed_bundle
from backend.domain.taxonomies.seeder import TaxonomySeeder
from backend.libs.database import get_redis
from backend.libs.database.postgreSQL.client import PostgreSQLClient
from backend.libs.database.postgreSQL.config import PostgreSQLConfig
from backend.scripts.migrate import apply_migrations, ensure_schema_migrations_table
from backend.service.config import config
from backend.service.dependencies import get_redis_client


ROOT_DIR = Path(__file__).resolve().parents[2]
FIXTURE_DATASET_PATH = ROOT_DIR / "backend" / "tests" / "fixtures" / "enterprise_catalog_dataset.json"
SAMPLE_DATA_DIR = ROOT_DIR / "docs" / "iMapVN" / "Data" / "Sample-iMap-Json"
WORKBOOK_PATH = ROOT_DIR / "docs" / "iMapVN" / "Data" / "BẢNG HỎI NHẬP LIỆU DỮ LIỆU SIBs (final).xlsx"


class FailingRedis:
    def get(self, key: str) -> str | None:
        raise RuntimeError("simulated redis read failure")

    def set(self, key: str, value, *, ex=None, px=None, nx=False, xx=False) -> bool:
        raise RuntimeError("simulated redis write failure")


def _build_postgresql_client() -> PostgreSQLClient:
    db_config = PostgreSQLConfig(
        host=os.getenv("PG_HOST", "127.0.0.1"),
        port=int(os.getenv("PG_PORT", "5432")),
        database=os.getenv("PG_DATABASE", "imap"),
        user=os.getenv("PG_USER", "postgres"),
        password=os.getenv("PG_PASSWORD", "postgres"),
    )
    client = PostgreSQLClient(db_config)
    client.connect()
    return client


class DashboardByProvinceApiTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        try:
            cls._prepare_database()
            from fastapi.testclient import TestClient

            from backend.service.app import create_service

            cls.app = create_service()
            cls._client_context = TestClient(cls.app)
            cls.client = cls._client_context.__enter__()
        except Exception as exc:
            raise unittest.SkipTest(f"dashboard by province integration tests require local Postgres/Redis: {exc}") from exc

    @classmethod
    def tearDownClass(cls) -> None:
        if hasattr(cls, "_client_context"):
            cls._client_context.__exit__(None, None, None)

    def tearDown(self) -> None:
        self.app.dependency_overrides.clear()

    @classmethod
    def _prepare_database(cls) -> None:
        db = _build_postgresql_client()
        try:
            ensure_schema_migrations_table(db)
            apply_migrations(db)

            bundle = build_seed_bundle(SAMPLE_DATA_DIR, WORKBOOK_PATH)
            TaxonomySeeder(db).seed_all(bundle)

            db.execute("TRUNCATE organization_import_errors RESTART IDENTITY CASCADE")
            db.execute("TRUNCATE organization_import_sources RESTART IDENTITY CASCADE")
            db.execute("TRUNCATE organization_import_runs RESTART IDENTITY CASCADE")
            db.execute("TRUNCATE organizations RESTART IDENTITY CASCADE")

            OrganizationImportService(OrganizationImportRepository(db)).import_file(
                FIXTURE_DATASET_PATH,
                source_name="dashboard_by_province_fixture",
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

    def _cache_key(self, **filters) -> str:
        params = DashboardBreakdownParams(**filters)
        return DashboardBreakdownService.build_cache_key(DashboardBreakdownDimension.PROVINCE, params)

    def test_dashboard_by_province_returns_breakdown_sorted_by_count_then_code(self) -> None:
        cache_key = self._cache_key()
        get_redis().delete(cache_key)

        response = self.client.get("/api/dashboard/by-province")

        self.assertEqual(response.status_code, 200)
        payload = response.json()
        self.assertTrue(payload["success"])
        self.assertEqual(payload["meta"]["group_by"], "province")
        self.assertEqual(payload["meta"]["matched_total"], 3)
        self.assertEqual(payload["meta"]["bucket_count"], 3)
        self.assertEqual(payload["meta"]["filters_applied"], {})
        self.assertFalse(payload["meta"]["cache_hit"])
        self.assertEqual(payload["meta"]["cache_ttl_seconds"], config.cache_overview_ttl_seconds)

        buckets = payload["data"]
        self.assertEqual(
            [bucket["province_code"] for bucket in buckets],
            ["da_nang", "hanoi", "ho_chi_minh_city"],
        )
        self.assertEqual(
            [bucket["organization_count"] for bucket in buckets],
            [1, 1, 1],
        )
        self.assertEqual(
            [bucket["mappable_count"] for bucket in buckets],
            [0, 1, 1],
        )

    def test_dashboard_by_province_applies_filters(self) -> None:
        cache_key = self._cache_key(
            operational_status="active",
            organization_type="private_enterprise",
            primary_industry_sector="manufacturing",
            has_positive_social_impact=True,
            environmental_impact_area="climate_change",
        )
        get_redis().delete(cache_key)

        response = self.client.get(
            "/api/dashboard/by-province",
            params={
                "operationalStatus": "active",
                "organizationType": "private_enterprise",
                "primaryIndustrySector": "manufacturing",
                "hasPositiveSocialImpact": "true",
                "environmentalImpactArea": "climate_change",
            },
        )

        self.assertEqual(response.status_code, 200)
        payload = response.json()
        self.assertEqual(payload["meta"]["matched_total"], 1)
        self.assertEqual(payload["meta"]["bucket_count"], 1)
        self.assertEqual(
            payload["meta"]["filters_applied"],
            {
                "operational_status": "active",
                "organization_type": "private_enterprise",
                "primary_industry_sector": "manufacturing",
                "has_positive_social_impact": True,
                "environmental_impact_area": "climate_change",
            },
        )
        self.assertEqual(payload["data"][0]["province_code"], "ho_chi_minh_city")
        self.assertEqual(payload["data"][0]["organization_count"], 1)
        self.assertEqual(payload["data"][0]["mappable_count"], 1)

    def test_dashboard_by_province_uses_redis_cache(self) -> None:
        cache_key = self._cache_key()
        redis = get_redis()
        redis.delete(cache_key)

        first_response = self.client.get("/api/dashboard/by-province")
        self.assertEqual(first_response.status_code, 200)
        first_payload = first_response.json()
        self.assertFalse(first_payload["meta"]["cache_hit"])
        self.assertEqual(redis.exists(cache_key), 1)
        self.assertGreater(redis.ttl(cache_key), 0)

        db = _build_postgresql_client()
        try:
            db.execute(
                """
                UPDATE organization_locations
                SET province_id = (SELECT id FROM provinces WHERE code = 'hanoi')
                WHERE organization_id = (
                    SELECT id FROM organizations WHERE external_code = 'ORG-CAT-001'
                )
                """
            )

            cached_response = self.client.get("/api/dashboard/by-province")
            self.assertEqual(cached_response.status_code, 200)
            cached_payload = cached_response.json()
            self.assertTrue(cached_payload["meta"]["cache_hit"])
            cached_counts = {bucket["province_code"]: bucket["organization_count"] for bucket in cached_payload["data"]}
            self.assertEqual(cached_counts["hanoi"], 1)
            self.assertEqual(cached_counts["ho_chi_minh_city"], 1)

            redis.delete(cache_key)

            uncached_response = self.client.get("/api/dashboard/by-province")
            self.assertEqual(uncached_response.status_code, 200)
            uncached_payload = uncached_response.json()
            self.assertFalse(uncached_payload["meta"]["cache_hit"])
            uncached_counts = {bucket["province_code"]: bucket["organization_count"] for bucket in uncached_payload["data"]}
            self.assertEqual(uncached_counts["hanoi"], 2)
            self.assertNotIn("ho_chi_minh_city", uncached_counts)
        finally:
            db.execute(
                """
                UPDATE organization_locations
                SET province_id = (SELECT id FROM provinces WHERE code = 'ho_chi_minh_city')
                WHERE organization_id = (
                    SELECT id FROM organizations WHERE external_code = 'ORG-CAT-001'
                )
                """
            )
            db.close()
            redis.delete(cache_key)

    def test_dashboard_by_province_falls_back_when_redis_cache_fails(self) -> None:
        self.app.dependency_overrides[get_redis_client] = lambda: FailingRedis()

        response = self.client.get(
            "/api/dashboard/by-province",
            params={"operationalStatus": "inactive"},
        )

        self.assertEqual(response.status_code, 200)
        payload = response.json()
        self.assertTrue(payload["success"])
        self.assertFalse(payload["meta"]["cache_hit"])
        self.assertEqual(payload["meta"]["matched_total"], 1)
        self.assertEqual(payload["data"][0]["province_code"], "hanoi")
        self.assertEqual(payload["data"][0]["organization_count"], 1)


if __name__ == "__main__":
    unittest.main(verbosity=2)
