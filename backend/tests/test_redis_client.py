from __future__ import annotations

import unittest
from unittest.mock import MagicMock, patch

from backend.libs.database.redis.client import RedisClient
from backend.libs.database.redis.config import RedisConfig


class RedisClientTests(unittest.TestCase):
    @patch("backend.libs.database.redis.client.redis_lib.Redis")
    @patch("backend.libs.database.redis.client.redis_lib.ConnectionPool")
    def test_connect_omits_ssl_kw_for_plain_connections(self, pool_cls: MagicMock, redis_cls: MagicMock) -> None:
        client = RedisClient(RedisConfig(host="127.0.0.1", port=6379, ssl=False))
        pool_instance = MagicMock()
        pool_cls.return_value = pool_instance

        client.connect()

        pool_cls.assert_called_once()
        kwargs = pool_cls.call_args.kwargs
        self.assertNotIn("ssl", kwargs)
        self.assertNotIn("connection_class", kwargs)
        redis_cls.assert_called_once_with(connection_pool=pool_instance)

    @patch("backend.libs.database.redis.client.redis_lib.Redis")
    @patch("backend.libs.database.redis.client.redis_lib.ConnectionPool")
    @patch("backend.libs.database.redis.client.redis_lib.SSLConnection")
    def test_connect_switches_to_ssl_connection_class_when_enabled(
        self,
        ssl_connection_cls: MagicMock,
        pool_cls: MagicMock,
        redis_cls: MagicMock,
    ) -> None:
        client = RedisClient(RedisConfig(host="127.0.0.1", port=6379, ssl=True))
        pool_instance = MagicMock()
        pool_cls.return_value = pool_instance

        client.connect()

        kwargs = pool_cls.call_args.kwargs
        self.assertEqual(kwargs["connection_class"], ssl_connection_cls)
        redis_cls.assert_called_once_with(connection_pool=pool_instance)


if __name__ == "__main__":
    unittest.main(verbosity=2)
