from __future__ import annotations

import os


def _str(name: str, default: str = "") -> str:
    return os.getenv(name, default).strip()


def _int(name: str, default: int = 0) -> int:
    value = os.getenv(name)
    if value is None:
        return default
    try:
        return int(value.strip())
    except ValueError:
        return default


def _bool(name: str, default: bool = False) -> bool:
    value = os.getenv(name)
    if value is None:
        return default
    return value.strip().lower() in {"1", "true", "yes", "on"}


class AppConfig:
    # ── App ───────────────────────────────────────────────────────────
    name: str         = _str("APP_NAME", "imap")
    env: str          = _str("APP_ENV", "local")         # local | staging | production
    debug: bool       = _bool("APP_DEBUG", False)
    version: str      = _str("APP_VERSION", "0.1.0")

    # ── HTTP server ───────────────────────────────────────────────────
    host: str         = _str("HOST", "0.0.0.0")
    port: int         = _int("PORT", 8000)
    workers: int      = _int("WORKERS", 1)
    reload: bool      = _bool("RELOAD", False)

    # ── CORS ──────────────────────────────────────────────────────────
    cors_origins: list[str] = _str("CORS_ORIGINS", "*").split(",")

    # ── Logging ───────────────────────────────────────────────────────
    log_level: str    = _str("LOG_LEVEL", "INFO")
    log_json: bool    = _bool("LOG_JSON", False)
    log_file: bool    = _bool("LOG_FILE", False)
    log_dir: str      = _str("LOG_DIR", "runtime_logs")

    # ── PostgreSQL ────────────────────────────────────────────────────
    pg_host: str      = _str("PG_HOST", "localhost")
    pg_port: int      = _int("PG_PORT", 5432)
    pg_database: str  = _str("PG_DATABASE", "imap")
    pg_user: str      = _str("PG_USER", "postgres")
    pg_password: str  = _str("PG_PASSWORD", "")
    pg_min_conn: int  = _int("PG_MIN_CONN", 1)
    pg_max_conn: int  = _int("PG_MAX_CONN", 10)

    # ── Redis ─────────────────────────────────────────────────────────
    redis_host: str   = _str("REDIS_HOST", "localhost")
    redis_port: int   = _int("REDIS_PORT", 6379)
    redis_db: int     = _int("REDIS_DB", 0)
    redis_password: str | None = _str("REDIS_PASSWORD") or None

    @classmethod
    def is_production(cls) -> bool:
        return cls.env == "production"


config = AppConfig()
