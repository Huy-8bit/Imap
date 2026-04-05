from __future__ import annotations

from contextlib import contextmanager
from typing import Any, Iterator

try:
    import psycopg2
    import psycopg2.extras
except ImportError as e:
    raise ImportError("psycopg2 is required: pip install psycopg2-binary") from e

from .config import PostgreSQLConfig
from .pool import PostgreSQLPool


class PostgreSQLClient:
    """API cấp cao để thực thi query, bọc pool bên dưới."""

    def __init__(self, config: PostgreSQLConfig) -> None:
        self._config = config
        self._pool = PostgreSQLPool(config)

    def connect(self) -> None:
        self._pool.open()

    def close(self) -> None:
        self._pool.close()

    @contextmanager
    def cursor(
        self,
        *,
        autocommit: bool = False,
        cursor_factory: Any = psycopg2.extras.RealDictCursor,
    ) -> Iterator[psycopg2.extras.RealDictCursor]:
        """Context manager trả về cursor, tự động commit / rollback."""
        with self._pool.acquire() as conn:
            conn.autocommit = autocommit
            with conn.cursor(cursor_factory=cursor_factory) as cur:
                try:
                    yield cur
                    if not autocommit:
                        conn.commit()
                except Exception:
                    if not autocommit:
                        conn.rollback()
                    raise

    def ping(self) -> bool:
        try:
            with self.cursor() as cur:
                cur.execute("SELECT 1")
            return True
        except Exception:
            return False

    def fetch_all(self, query: str, params: Any = None) -> list[dict[str, Any]]:
        """Trả về tất cả rows dưới dạng list of dict."""
        with self.cursor() as cur:
            cur.execute(query, params)
            if cur.description:
                return list(cur.fetchall())
            return []

    def fetch_one(self, query: str, params: Any = None) -> dict[str, Any] | None:
        """Trả về row đầu tiên hoặc None."""
        with self.cursor() as cur:
            cur.execute(query, params)
            if cur.description:
                row = cur.fetchone()
                return dict(row) if row else None
            return None

    def execute(self, query: str, params: Any = None) -> None:
        """Thực thi DML không cần lấy kết quả (INSERT / UPDATE / DELETE)."""
        with self.cursor() as cur:
            cur.execute(query, params)

    def execute_many(self, query: str, params_seq: list[Any]) -> None:
        """Bulk insert / update với execute_batch."""
        with self.cursor() as cur:
            psycopg2.extras.execute_batch(cur, query, params_seq)

    def __repr__(self) -> str:
        status = "open" if self._pool.is_open else "closed"
        return (
            f"<PostgreSQLClient "
            f"{self._config.host}:{self._config.port}/{self._config.database} [{status}]>"
        )
