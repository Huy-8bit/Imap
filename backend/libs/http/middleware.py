from __future__ import annotations

import time
import uuid
from typing import TYPE_CHECKING

from starlette.middleware.base import BaseHTTPMiddleware, RequestResponseEndpoint
from starlette.requests import Request
from starlette.responses import Response

if TYPE_CHECKING:
    from fastapi import FastAPI

try:
    from fastapi.middleware.cors import CORSMiddleware
    _CORS_AVAILABLE = True
except ImportError:
    _CORS_AVAILABLE = False

REQUEST_ID_HEADER = "X-Request-Id"


class RequestIdMiddleware(BaseHTTPMiddleware):
    """Gắn X-Request-Id vào mỗi request và response."""

    async def dispatch(self, request: Request, call_next: RequestResponseEndpoint) -> Response:
        request_id = request.headers.get(REQUEST_ID_HEADER) or str(uuid.uuid4())
        request.state.request_id = request_id

        response = await call_next(request)
        response.headers[REQUEST_ID_HEADER] = request_id
        return response


class AccessLogMiddleware(BaseHTTPMiddleware):
    """Log method, path, status code và latency của mỗi request."""

    async def dispatch(self, request: Request, call_next: RequestResponseEndpoint) -> Response:
        import logging
        logger = logging.getLogger("http.access")

        start = time.perf_counter()
        response = await call_next(request)
        latency_ms = (time.perf_counter() - start) * 1000

        request_id = getattr(request.state, "request_id", "-")

        logger.info(
            "%s %s %s",
            request.method,
            request.url.path,
            response.status_code,
            extra={
                "request_id": request_id,
                "method": request.method,
                "path": request.url.path,
                "status_code": response.status_code,
                "latency_ms": round(latency_ms, 2),
                "client": request.client.host if request.client else "-",
            },
        )
        return response


def register_middleware(
    app: FastAPI,
    *,
    cors_origins: list[str] | None = None,
    cors_allow_credentials: bool = True,
    cors_allow_methods: list[str] | None = None,
    cors_allow_headers: list[str] | None = None,
    enable_request_id: bool = True,
    enable_access_log: bool = True,
) -> None:
    """Gắn toàn bộ middleware vào app theo thứ tự đúng.

    Starlette thêm middleware theo kiểu stack (LIFO), nên thứ tự add ở đây
    là từ ngoài vào trong — middleware add sau sẽ chạy trước.
    """
    # CORS phải là lớp ngoài cùng
    if cors_origins is not None:
        if not _CORS_AVAILABLE:
            raise ImportError("fastapi[all] hoặc starlette là required để dùng CORSMiddleware.")
        app.add_middleware(
            CORSMiddleware,
            allow_origins=cors_origins,
            allow_credentials=cors_allow_credentials,
            allow_methods=cors_allow_methods or ["*"],
            allow_headers=cors_allow_headers or ["*"],
        )

    if enable_access_log:
        app.add_middleware(AccessLogMiddleware)

    if enable_request_id:
        app.add_middleware(RequestIdMiddleware)
