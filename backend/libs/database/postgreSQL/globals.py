from __future__ import annotations

from .client import PostgreSQLClient
from .config import PostgreSQLConfig

_client: PostgreSQLClient | None = None


def setup_postgresql(
    *,
    host: str = "localhost",
    port: int = 5432,
    database: str,
    user: str,
    password: str,
    min_connections: int = 1,
    max_connections: int = 10,
    connect_timeout: int = 10,
    connect: bool = True,
) -> PostgreSQLClient:
    """Khởi tạo và đăng ký global client.

    Gọi một lần khi app khởi động, sau đó dùng ``get_postgresql()`` ở bất kỳ đâu.
    """
    global _client

    config = PostgreSQLConfig(
        host=host,
        port=port,
        database=database,
        user=user,
        password=password,
        min_connections=min_connections,
        max_connections=max_connections,
        connect_timeout=connect_timeout,
    )
    _client = PostgreSQLClient(config)

    if connect:
        _client.connect()

    return _client


def get_postgresql() -> PostgreSQLClient:
    """Trả về global PostgreSQLClient đã được setup."""
    if _client is None:
        raise RuntimeError("PostgreSQL chưa được khởi tạo. Gọi setup_postgresql() trước.")
    return _client
