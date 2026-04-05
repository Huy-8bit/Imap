from __future__ import annotations

from collections.abc import AsyncIterator
from contextlib import asynccontextmanager
from typing import Any

from fastapi import FastAPI

from .errors import register_error_handlers
from .middleware import register_middleware


def create_app(
    *,
    title: str = "API",
    version: str = "0.1.0",
    description: str = "",
    debug: bool = False,
    docs_url: str | None = "/docs",
    redoc_url: str | None = "/redoc",
    openapi_url: str | None = "/openapi.json",
    lifespan: Any = None,
    cors_origins: list[str] | None = None,
    cors_allow_credentials: bool = True,
    cors_allow_methods: list[str] | None = None,
    cors_allow_headers: list[str] | None = None,
    enable_request_id: bool = True,
    enable_access_log: bool = True,
) -> FastAPI:
    """Factory tạo FastAPI app đã gắn middleware và error handler.

    Parameters
    ----------
    title, version, description:
        Metadata hiện trong OpenAPI docs.
    debug:
        Bật chế độ debug của Starlette (trả về traceback trong response).
    docs_url / redoc_url / openapi_url:
        Set ``None`` để tắt endpoint tương ứng ở môi trường production.
    lifespan:
        Async context manager điều khiển startup/shutdown.
        Dùng ``build_lifespan()`` trong ``lifespan.py`` hoặc tự viết.
    cors_origins:
        Danh sách origin được phép. ``None`` → không gắn CORSMiddleware.
    enable_request_id:
        Gắn ``X-Request-Id`` header vào mỗi request/response.
    enable_access_log:
        Log mỗi request: method, path, status, latency.
    """
    app = FastAPI(
        title=title,
        version=version,
        description=description,
        debug=debug,
        docs_url=docs_url,
        redoc_url=redoc_url,
        openapi_url=openapi_url,
        lifespan=lifespan,
    )

    register_middleware(
        app,
        cors_origins=cors_origins,
        cors_allow_credentials=cors_allow_credentials,
        cors_allow_methods=cors_allow_methods or ["*"],
        cors_allow_headers=cors_allow_headers or ["*"],
        enable_request_id=enable_request_id,
        enable_access_log=enable_access_log,
    )
    register_error_handlers(app)

    return app
