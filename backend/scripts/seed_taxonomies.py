from __future__ import annotations

import argparse
import json
from pathlib import Path

from backend.domain.taxonomies.seeder import TaxonomySeeder
from backend.domain.taxonomies.seed_loader import build_seed_bundle
from backend.libs.database import get_postgresql, setup_postgresql
from backend.service.config import config

DEFAULT_WORKBOOK_PATH = Path("docs/iMapVN/Data/BẢNG HỎI NHẬP LIỆU DỮ LIỆU SIBs (final).xlsx")


def main() -> None:
    parser = argparse.ArgumentParser(description="Seed taxonomy tables from docs sources.")
    parser.add_argument("--sample-data-dir", default=config.seed_data_dir)
    parser.add_argument("--workbook-path", default=str(DEFAULT_WORKBOOK_PATH))
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    sample_data_dir = Path(args.sample_data_dir)
    workbook_path = Path(args.workbook_path)

    bundle = build_seed_bundle(sample_data_dir=sample_data_dir, workbook_path=workbook_path)
    if args.dry_run:
        summary = {taxonomy.value: len(rows) for taxonomy, rows in bundle.items()}
        print(json.dumps({"mode": "dry-run", "summary": summary}, ensure_ascii=False, indent=2))
        return

    db = setup_postgresql(
        host=config.pg_host,
        port=config.pg_port,
        database=config.pg_database,
        user=config.pg_user,
        password=config.pg_password,
        min_connections=config.pg_min_conn,
        max_connections=config.pg_max_conn,
    )
    try:
        summary = TaxonomySeeder(db).seed_all(bundle)
        print(json.dumps({"mode": "write", "summary": summary}, ensure_ascii=False, indent=2))
    finally:
        get_postgresql().close()


if __name__ == "__main__":
    main()
