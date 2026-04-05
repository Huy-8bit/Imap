from __future__ import annotations

from .commands import RedisCommands
from .config import RedisConfig

_client: RedisCommands | None = None


def setup_redis(
    *,
    host: str = "localhost",
    port: int = 6379,
    db: int = 0,
    password: str | None = None,
    username: str | None = None,
    ssl: bool = False,
    socket_timeout: float = 5.0,
    socket_connect_timeout: float = 5.0,
    max_connections: int = 10,
    decode_responses: bool = True,
    connect: bool = True,
) -> RedisCommands:
    """Khởi tạo và đăng ký global client.

    Gọi một lần khi app khởi động, sau đó dùng ``get_redis()`` ở bất kỳ đâu.
    """
    global _client

    config = RedisConfig(
        host=host,
        port=port,
        db=db,
        password=password,
        username=username,
        ssl=ssl,
        socket_timeout=socket_timeout,
        socket_connect_timeout=socket_connect_timeout,
        max_connections=max_connections,
        decode_responses=decode_responses,
    )
    _client = RedisCommands(config)

    if connect:
        _client.connect()

    return _client


def get_redis() -> RedisCommands:
    """Trả về global RedisCommands đã được setup."""
    if _client is None:
        raise RuntimeError("Redis chưa được khởi tạo. Gọi setup_redis() trước.")
    return _client
