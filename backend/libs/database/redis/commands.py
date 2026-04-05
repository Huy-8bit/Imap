from __future__ import annotations

from typing import Any

from .client import RedisClient


class RedisCommands(RedisClient):
    """Mixin cung cấp các helper command theo nhóm dữ liệu Redis."""

    # ------------------------------------------------------------------
    # String
    # ------------------------------------------------------------------

    def get(self, key: str) -> str | None:
        return self.require().get(key)  # type: ignore[return-value]

    def set(
        self,
        key: str,
        value: str | bytes | int | float,
        *,
        ex: int | None = None,
        px: int | None = None,
        nx: bool = False,
        xx: bool = False,
    ) -> bool:
        return self.require().set(key, value, ex=ex, px=px, nx=nx, xx=xx) is True

    def delete(self, *keys: str) -> int:
        return self.require().delete(*keys)  # type: ignore[return-value]

    def exists(self, *keys: str) -> int:
        return self.require().exists(*keys)  # type: ignore[return-value]

    def expire(self, key: str, seconds: int) -> bool:
        return bool(self.require().expire(key, seconds))

    def ttl(self, key: str) -> int:
        return self.require().ttl(key)  # type: ignore[return-value]

    # ------------------------------------------------------------------
    # Hash
    # ------------------------------------------------------------------

    def hget(self, name: str, key: str) -> str | None:
        return self.require().hget(name, key)  # type: ignore[return-value]

    def hset(self, name: str, mapping: dict[str, Any]) -> int:
        return self.require().hset(name, mapping=mapping)  # type: ignore[return-value]

    def hgetall(self, name: str) -> dict[str, str]:
        return self.require().hgetall(name)  # type: ignore[return-value]

    def hdel(self, name: str, *keys: str) -> int:
        return self.require().hdel(name, *keys)  # type: ignore[return-value]

    # ------------------------------------------------------------------
    # List
    # ------------------------------------------------------------------

    def lpush(self, name: str, *values: Any) -> int:
        return self.require().lpush(name, *values)  # type: ignore[return-value]

    def rpush(self, name: str, *values: Any) -> int:
        return self.require().rpush(name, *values)  # type: ignore[return-value]

    def lpop(self, name: str) -> str | None:
        return self.require().lpop(name)  # type: ignore[return-value]

    def rpop(self, name: str) -> str | None:
        return self.require().rpop(name)  # type: ignore[return-value]

    def lrange(self, name: str, start: int, end: int) -> list[str]:
        return self.require().lrange(name, start, end)  # type: ignore[return-value]

    def llen(self, name: str) -> int:
        return self.require().llen(name)  # type: ignore[return-value]

    # ------------------------------------------------------------------
    # Set
    # ------------------------------------------------------------------

    def sadd(self, name: str, *values: Any) -> int:
        return self.require().sadd(name, *values)  # type: ignore[return-value]

    def srem(self, name: str, *values: Any) -> int:
        return self.require().srem(name, *values)  # type: ignore[return-value]

    def smembers(self, name: str) -> set[str]:
        return self.require().smembers(name)  # type: ignore[return-value]

    def sismember(self, name: str, value: Any) -> bool:
        return bool(self.require().sismember(name, value))
