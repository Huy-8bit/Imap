from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any


@dataclass
class PostgreSQLConfig:
    host: str = "localhost"
    port: int = 5432
    database: str = ""
    user: str = ""
    password: str = ""
    min_connections: int = 1
    max_connections: int = 10
    connect_timeout: int = 10
    options: dict[str, Any] = field(default_factory=dict)

    def dsn(self) -> str:
        return (
            f"host={self.host} "
            f"port={self.port} "
            f"dbname={self.database} "
            f"user={self.user} "
            f"password={self.password} "
            f"connect_timeout={self.connect_timeout}"
        )

    def url(self) -> str:
        return (
            f"postgresql://{self.user}:{self.password}"
            f"@{self.host}:{self.port}/{self.database}"
        )
