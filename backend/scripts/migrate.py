from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

from backend.libs.database import get_postgresql, setup_postgresql
from backend.service.config import config

MIGRATIONS_DIR = Path(__file__).resolve().parents[1] / "migrations" / "sql"


def main() -> None:
    parser = argparse.ArgumentParser(description="Apply backend SQL migrations.")
    parser.add_argument("command", choices=("up", "status"))
    args = parser.parse_args()

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
        ensure_schema_migrations_table(db)
        if args.command == "status":
            print(json.dumps(build_status(db), ensure_ascii=False, indent=2))
            return

        summary = apply_migrations(db)
        print(json.dumps(summary, ensure_ascii=False, indent=2))
    finally:
        get_postgresql().close()


def ensure_schema_migrations_table(db) -> None:
    db.execute(
        """
        CREATE TABLE IF NOT EXISTS schema_migrations (
            filename TEXT PRIMARY KEY,
            checksum TEXT NOT NULL,
            applied_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
        )
        """
    )


def build_status(db) -> dict[str, Any]:
    applied_rows = db.fetch_all(
        """
        SELECT filename, checksum, applied_at
        FROM schema_migrations
        ORDER BY filename ASC
        """
    )
    applied_map = {row["filename"]: row for row in applied_rows}
    pending = []
    applied = []

    for migration_path in list_migration_files():
        checksum = compute_checksum(migration_path)
        applied_row = applied_map.get(migration_path.name)
        if applied_row is None:
            pending.append({"filename": migration_path.name, "checksum": checksum})
            continue

        applied.append(
            {
                "filename": migration_path.name,
                "checksum": checksum,
                "applied_at": applied_row["applied_at"].isoformat(),
            }
        )

    return {"applied": applied, "pending": pending}


def apply_migrations(db) -> dict[str, Any]:
    applied_rows = db.fetch_all("SELECT filename, checksum FROM schema_migrations")
    applied_map = {row["filename"]: row["checksum"] for row in applied_rows}
    executed: list[str] = []

    for migration_path in list_migration_files():
        checksum = compute_checksum(migration_path)
        existing_checksum = applied_map.get(migration_path.name)
        if existing_checksum is not None:
            if existing_checksum != checksum:
                raise RuntimeError(f"Checksum mismatch for applied migration: {migration_path.name}")
            continue

        sql = migration_path.read_text(encoding="utf-8")
        with db.cursor() as cursor:
            cursor.execute(sql)
            cursor.execute(
                """
                INSERT INTO schema_migrations (filename, checksum)
                VALUES (%s, %s)
                """,
                (migration_path.name, checksum),
            )
        executed.append(migration_path.name)

    return {
        "executed": executed,
        "pending_count": max(len(list_migration_files()) - len(applied_map) - len(executed), 0),
    }


def list_migration_files() -> list[Path]:
    return sorted(MIGRATIONS_DIR.glob("*.sql"))


def compute_checksum(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


if __name__ == "__main__":
    main()
