from __future__ import annotations

import argparse
import json
from pathlib import Path

from backend.domain.organizations import OrganizationImportRepository, OrganizationImportService
from backend.domain.organizations.importer import summary_to_dict
from backend.libs.database import get_postgresql, setup_postgresql
from backend.service.config import config


def main() -> None:
    parser = argparse.ArgumentParser(description="Import organizations into iMapVietnam schema.")
    parser.add_argument("--dataset-path", default=config.organization_dataset_path)
    parser.add_argument("--source-name", default=None)
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    dataset_path = Path(args.dataset_path)
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
        repository = OrganizationImportRepository(db)
        service = OrganizationImportService(repository)
        summary = service.import_file(
            dataset_path=dataset_path,
            source_name=args.source_name,
            dry_run=args.dry_run,
        )
        print(json.dumps(summary_to_dict(summary), ensure_ascii=False, indent=2))
    finally:
        get_postgresql().close()


if __name__ == "__main__":
    main()
