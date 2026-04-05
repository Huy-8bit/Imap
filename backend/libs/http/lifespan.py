from __future__ import annotations

from collections.abc import AsyncIterator, Callable, Coroutine
from contextlib import asynccontextmanager
from typing import Any

from fastapi import FastAPI

# Hook type: async callable nhận không tham số, không trả về gì
StartupHook = Callable[[], Coroutine[Any, Any, None]]
ShutdownHook = Callable[[], Coroutine[Any, Any, None]]


def build_lifespan(
    *,
    on_startup: list[StartupHook] | None = None,
    on_shutdown: list[ShutdownHook] | None = None,
) -> Callable[[FastAPI], AsyncIterator[None]]:
    """Tạo lifespan context manager từ danh sách startup / shutdown hooks.

    Usage::

        async def init_db() -> None:
            setup_postgresql(...)

        async def close_db() -> None:
            get_postgresql().close()

        app = create_app(
            lifespan=build_lifespan(
                on_startup=[init_db],
                on_shutdown=[close_db],
            )
        )
    """
    startup_hooks: list[StartupHook] = on_startup or []
    shutdown_hooks: list[ShutdownHook] = on_shutdown or []

    @asynccontextmanager
    async def lifespan(_app: FastAPI) -> AsyncIterator[None]:
        for hook in startup_hooks:
            await hook()
        try:
            yield
        finally:
            for hook in reversed(shutdown_hooks):
                await hook()

    return lifespan
