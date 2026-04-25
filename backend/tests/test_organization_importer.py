from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path

from backend.domain.organizations import OrganizationImportService
from backend.domain.taxonomies.constants import TaxonomyName
from backend.domain.taxonomies.seed_loader import build_seed_bundle
from backend.domain.organizations.validators import normalize_lookup_key


ROOT_DIR = Path(__file__).resolve().parents[2]
SAMPLE_DATA_DIR = ROOT_DIR / "docs" / "iMapVN" / "Data" / "Sample-iMap-Json"
WORKBOOK_PATH = ROOT_DIR / "docs" / "iMapVN" / "Data" / "BẢNG HỎI NHẬP LIỆU DỮ LIỆU SIBs (final).xlsx"
SAMPLE_DATASET_PATH = SAMPLE_DATA_DIR / "dataEng.json"


class FakeOrganizationImportRepository:
    def __init__(self) -> None:
        bundle = build_seed_bundle(SAMPLE_DATA_DIR, WORKBOOK_PATH)
        self.lookups: dict[str, dict[str, int]] = {}
        for taxonomy_name in OrganizationImportService.REQUIRED_TAXONOMIES:
            lookup: dict[str, int] = {}
            for index, row in enumerate(bundle[taxonomy_name], start=1):
                candidates = [
                    row.code,
                    row.display_name,
                    row.display_name_en,
                    row.display_name_vi,
                    *row.metadata.get("aliases", []),
                ]
                for candidate in candidates:
                    key = normalize_lookup_key(candidate)
                    if key:
                        lookup[key] = index
            self.lookups[taxonomy_name.value] = lookup

    def load_taxonomy_lookups(self, taxonomy_names: tuple[TaxonomyName, ...]) -> dict[str, dict[str, int]]:
        return {name.value: self.lookups[name.value] for name in taxonomy_names}


class OrganizationImporterTests(unittest.TestCase):
    def test_dry_run_accepts_sample_dataset(self) -> None:
        service = OrganizationImportService(FakeOrganizationImportRepository())
        summary = service.import_file(SAMPLE_DATASET_PATH, dry_run=True)

        self.assertEqual(summary.status, "dry_run")
        self.assertEqual(summary.total_records, 1)
        self.assertEqual(summary.error_count, 0)
        self.assertEqual(summary.skipped_count, 0)

    def test_dry_run_reports_invalid_phone(self) -> None:
        dataset = json.loads(SAMPLE_DATASET_PATH.read_text(encoding="utf-8"))
        dataset["organizations"][0]["general"]["contacts"]["phone"] = "09 09 invalid"

        with tempfile.TemporaryDirectory() as temp_dir:
            temp_path = Path(temp_dir) / "dataset.json"
            temp_path.write_text(json.dumps(dataset, ensure_ascii=False), encoding="utf-8")

            service = OrganizationImportService(FakeOrganizationImportRepository())
            summary = service.import_file(temp_path, dry_run=True)

        self.assertEqual(summary.error_count, 1)
        self.assertEqual(summary.skipped_count, 1)
        self.assertEqual(summary.errors[0].field_name, "general.contacts.phone")
        self.assertEqual(summary.errors[0].error_code, "invalid_phone")


if __name__ == "__main__":
    unittest.main(verbosity=2)
