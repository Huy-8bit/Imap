from __future__ import annotations

import logging
import time
from typing import TYPE_CHECKING

from starlette.middleware.base import BaseHTTPMiddleware, RequestResponseEndpoint
from starlette.requests import Request
from starlette.responses import JSONResponse, Response

if TYPE_CHECKING:
    from fastapi import FastAPI

logger = logging.getLogger(__name__)

_RATE_LIMIT_PREFIX = "rl"


class RateLimitMiddleware(BaseHTTPMiddleware):
    """Redis sliding window rate limiter.

    Public requests (no auth header): giới hạn theo client IP.
    Authenticated requests (Bearer token): giới hạn theo user_id từ JWT claims.
    user_id được đọc từ request.state khi auth middleware đã chạy,
    nếu không có thì fallback về IP.
    """

    def __init__(
        self,
        app,
        *,
        public_limit: int,
        authenticated_limit: int,
        window_seconds: int,
    ) -> None:
        super().__init__(app)
        self._public_limit = public_limit
        self._authenticated_limit = authenticated_limit
        self._window_seconds = window_seconds

    async def dispatch(self, request: Request, call_next: RequestResponseEndpoint) -> Response:
        from backend.libs.database import get_redis

        key, limit = self._resolve_key_and_limit(request)

        try:
            redis = get_redis().require()
            now_ms = int(time.time() * 1000)
            window_start_ms = now_ms - self._window_seconds * 1000

            pipe = redis.pipeline()
            pipe.zremrangebyscore(key, "-inf", window_start_ms)
            pipe.zadd(key, {str(now_ms): now_ms})
            pipe.zcount(key, window_start_ms, "+inf")
            pipe.expire(key, self._window_seconds * 2)
            results = pipe.execute()

            request_count = int(results[2])
        except Exception as exc:
            # Redis down → fallback allow (không chặn traffic khi cache lỗi)
            logger.warning("rate_limit redis error: %s", exc)
            return await call_next(request)

        if request_count > limit:
            return JSONResponse(
                status_code=429,
                content={"success": False, "message": "rate limit exceeded"},
                headers={
                    "Retry-After": str(self._window_seconds),
                    "X-RateLimit-Limit": str(limit),
                    "X-RateLimit-Remaining": "0",
                    "X-RateLimit-Reset": str(int(time.time()) + self._window_seconds),
                },
            )

        response = await call_next(request)
        response.headers["X-RateLimit-Limit"] = str(limit)
        response.headers["X-RateLimit-Remaining"] = str(max(0, limit - request_count))
        return response

    def _resolve_key_and_limit(self, request: Request) -> tuple[str, int]:
        # Ưu tiên user_id từ state nếu có (set bởi auth dependency)
        user_id = getattr(request.state, "rate_limit_user_id", None)
        if user_id is not None:
            return f"{_RATE_LIMIT_PREFIX}:user:{user_id}", self._authenticated_limit

        auth_header = request.headers.get("Authorization", "")
        if auth_header.startswith("Bearer "):
            # Token có nhưng chưa decode — vẫn rate limit theo IP với authenticated limit
            # để không expose user_id extraction ở đây
            client_ip = self._get_client_ip(request)
            return f"{_RATE_LIMIT_PREFIX}:auth:{client_ip}", self._authenticated_limit

        client_ip = self._get_client_ip(request)
        return f"{_RATE_LIMIT_PREFIX}:ip:{client_ip}", self._public_limit

    @staticmethod
    def _get_client_ip(request: Request) -> str:
        forwarded_for = request.headers.get("X-Forwarded-For")
        if forwarded_for:
            return forwarded_for.split(",")[0].strip()
        if request.client:
            return request.client.host
        return "unknown"


def register_rate_limit(
    app: FastAPI,
    *,
    public_limit: int,
    authenticated_limit: int,
    window_seconds: int,
) -> None:
    app.add_middleware(
        RateLimitMiddleware,
        public_limit=public_limit,
        authenticated_limit=authenticated_limit,
        window_seconds=window_seconds,
    )
