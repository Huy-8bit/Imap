from __future__ import annotations

from typing import Any

try:
    import redis as redis_lib
    import redis.exceptions
except ImportError as e:
    raise ImportError("redis is required: pip install redis") from e

from .config import RedisConfig


class RedisClient:
    """Quản lý connection pool và cung cấp raw client."""

    def __init__(self, config: RedisConfig) -> None:
        self._config = config
        self._pool: redis_lib.ConnectionPool | None = None
        self._client: redis_lib.Redis | None = None

    def connect(self) -> None:
        if self._client is not None:
            return
        self._pool = redis_lib.ConnectionPool(
            host=self._config.host,
            port=self._config.port,
            db=self._config.db,
            password=self._config.password,
            username=self._config.username,
            ssl=self._config.ssl,
            socket_timeout=self._config.socket_timeout,
            socket_connect_timeout=self._config.socket_connect_timeout,
            max_connections=self._config.max_connections,
            decode_responses=self._config.decode_responses,
            **self._config.options,
        )
        self._client = redis_lib.Redis(connection_pool=self._pool)

    def close(self) -> None:
        if self._pool is not None:
            self._pool.disconnect()
        self._client = None
        self._pool = None

    def require(self) -> redis_lib.Redis:
        if self._client is None:
            raise RuntimeError("Redis chưa kết nối. Gọi connect() trước.")
        return self._client

    @property
    def raw(self) -> redis_lib.Redis:
        """Raw Redis client để dùng trực tiếp khi cần."""
        return self.require()

    def ping(self) -> bool:
        try:
            return bool(self.require().ping())
        except redis_lib.exceptions.RedisError:
            return False

    def pipeline(self, transaction: bool = True) -> redis_lib.client.Pipeline:
        return self.require().pipeline(transaction=transaction)

    @property
    def is_connected(self) -> bool:
        return self._client is not None

    def __repr__(self) -> str:
        status = "connected" if self.is_connected else "disconnected"
        return (
            f"<RedisClient "
            f"{self._config.host}:{self._config.port}/db{self._config.db} [{status}]>"
        )
