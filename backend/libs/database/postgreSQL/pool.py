from __future__ import annotations

from contextlib import contextmanager
from typing import Iterator

try:
    import psycopg2
    import psycopg2.pool
except ImportError as e:
    raise ImportError("psycopg2 is required: pip install psycopg2-binary") from e

from .config import PostgreSQLConfig


class PostgreSQLPool:
    """Quản lý vòng đời của ThreadedConnectionPool."""

    def __init__(self, config: PostgreSQLConfig) -> None:
        self._config = config
        self._pool: psycopg2.pool.ThreadedConnectionPool | None = None

    def open(self) -> None:
        if self._pool is not None:
            return
        self._pool = psycopg2.pool.ThreadedConnectionPool(
            minconn=self._config.min_connections,
            maxconn=self._config.max_connections,
            dsn=self._config.dsn(),
        )

    def close(self) -> None:
        if self._pool is not None:
            self._pool.closeall()
            self._pool = None

    def _require(self) -> psycopg2.pool.ThreadedConnectionPool:
        if self._pool is None:
            raise RuntimeError("Pool chưa mở. Gọi open() trước.")
        return self._pool

    @contextmanager
    def acquire(self) -> Iterator[psycopg2.extensions.connection]:
        """Mượn một connection từ pool, trả lại khi xong."""
        pool = self._require()
        conn = pool.getconn()
        try:
            yield conn
        finally:
            pool.putconn(conn)

    @property
    def is_open(self) -> bool:
        return self._pool is not None
