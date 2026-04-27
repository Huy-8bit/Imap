from __future__ import annotations

import unittest
from pathlib import Path

from backend.domain.taxonomies.constants import TaxonomyName
from backend.domain.taxonomies.seed_loader import build_seed_bundle


ROOT_DIR = Path(__file__).resolve().parents[2]
SAMPLE_DATA_DIR = ROOT_DIR / "docs" / "iMapVN" / "Data" / "Sample-iMap-Json"
WORKBOOK_PATH = ROOT_DIR / "docs" / "iMapVN" / "Data" / "BẢNG HỎI NHẬP LIỆU DỮ LIỆU SIBs (final).xlsx"


class TaxonomySeedLoaderTests(unittest.TestCase):
    def test_build_seed_bundle_matches_expected_counts(self) -> None:
        bundle = build_seed_bundle(SAMPLE_DATA_DIR, WORKBOOK_PATH)

        self.assertEqual(len(bundle[TaxonomyName.OPERATIONAL_STATUSES]), 3)
        self.assertEqual(len(bundle[TaxonomyName.ORGANIZATION_TYPES]), 4)
        self.assertEqual(len(bundle[TaxonomyName.INDUSTRY_SECTORS]), 22)
        self.assertEqual(len(bundle[TaxonomyName.ENVIRONMENTAL_IMPACT_AREAS]), 9)
        self.assertEqual(len(bundle[TaxonomyName.PRODUCT_TYPES]), 2)
        self.assertEqual(len(bundle[TaxonomyName.PROVINCES]), 34)
        self.assertEqual(len(bundle[TaxonomyName.SDGS]), 17)

    def test_bundle_contains_bilingual_aliases_for_province(self) -> None:
        bundle = build_seed_bundle(SAMPLE_DATA_DIR, WORKBOOK_PATH)
        hcm = next(row for row in bundle[TaxonomyName.PROVINCES] if row.code == "ho_chi_minh_city")

        self.assertEqual(hcm.display_name_en, "Ho Chi Minh City")
        self.assertEqual(hcm.display_name_vi, "TP. Hồ Chí Minh")
        self.assertIn("Ho Chi Minh City", hcm.metadata["aliases"])
        self.assertIn("TP. Hồ Chí Minh", hcm.metadata["aliases"])
        self.assertIn("Hồ Chí Minh", hcm.metadata["aliases"])


if __name__ == "__main__":
    unittest.main(verbosity=2)
