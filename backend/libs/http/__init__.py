"""HTTP server helpers — FastAPI factory, middleware, lifespan, responses, errors."""

from .app import create_app
from .errors import (
    AppError,
    ConflictError,
    ForbiddenError,
    NotFoundError,
    UnauthorizedError,
    register_error_handlers,
)
from .lifespan import build_lifespan
from .middleware import AccessLogMiddleware, RequestIdMiddleware, register_middleware
from .responses import (
    bad_request,
    conflict,
    created,
    forbidden,
    internal_error,
    no_content,
    not_found,
    ok,
    paginated,
    unauthorized,
    unprocessable,
)

__all__ = [
    # factory
    "create_app",
    # lifespan
    "build_lifespan",
    # middleware
    "AccessLogMiddleware",
    "RequestIdMiddleware",
    "register_middleware",
    # responses
    "bad_request",
    "conflict",
    "created",
    "forbidden",
    "internal_error",
    "no_content",
    "not_found",
    "ok",
    "paginated",
    "unauthorized",
    "unprocessable",
    # errors
    "AppError",
    "ConflictError",
    "ForbiddenError",
    "NotFoundError",
    "UnauthorizedError",
    "register_error_handlers",
]
