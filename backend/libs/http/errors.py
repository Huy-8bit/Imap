from __future__ import annotations

import logging
from typing import TYPE_CHECKING, Any

from fastapi import Request
from fastapi.exceptions import RequestValidationError
from fastapi.responses import JSONResponse
from starlette.exceptions import HTTPException

if TYPE_CHECKING:
    from fastapi import FastAPI

logger = logging.getLogger("http.errors")


class AppError(Exception):
    """Base exception cho lỗi nghiệp vụ, map trực tiếp ra HTTP response."""

    def __init__(
        self,
        message: str,
        *,
        status_code: int = 400,
        detail: Any = None,
    ) -> None:
        super().__init__(message)
        self.message = message
        self.status_code = status_code
        self.detail = detail


class NotFoundError(AppError):
    def __init__(self, message: str = "not found", *, detail: Any = None) -> None:
        super().__init__(message, status_code=404, detail=detail)


class UnauthorizedError(AppError):
    def __init__(self, message: str = "unauthorized", *, detail: Any = None) -> None:
        super().__init__(message, status_code=401, detail=detail)


class ForbiddenError(AppError):
    def __init__(self, message: str = "forbidden", *, detail: Any = None) -> None:
        super().__init__(message, status_code=403, detail=detail)


class ConflictError(AppError):
    def __init__(self, message: str = "conflict", *, detail: Any = None) -> None:
        super().__init__(message, status_code=409, detail=detail)


# ------------------------------------------------------------------
# Handlers
# ------------------------------------------------------------------

async def _handle_app_error(request: Request, exc: AppError) -> JSONResponse:
    request_id = getattr(request.state, "request_id", "-")
    logger.warning(
        "AppError %s: %s",
        exc.status_code,
        exc.message,
        extra={"request_id": request_id, "path": request.url.path},
    )
    body: dict[str, Any] = {"success": False, "message": exc.message}
    if exc.detail is not None:
        body["detail"] = exc.detail
    return JSONResponse(status_code=exc.status_code, content=body)


async def _handle_http_exception(request: Request, exc: HTTPException) -> JSONResponse:
    request_id = getattr(request.state, "request_id", "-")
    logger.warning(
        "HTTPException %s: %s",
        exc.status_code,
        exc.detail,
        extra={"request_id": request_id, "path": request.url.path},
    )
    return JSONResponse(
        status_code=exc.status_code,
        content={"success": False, "message": str(exc.detail)},
    )


async def _handle_validation_error(request: Request, exc: RequestValidationError) -> JSONResponse:
    request_id = getattr(request.state, "request_id", "-")
    logger.debug(
        "ValidationError",
        extra={"request_id": request_id, "path": request.url.path, "errors": exc.errors()},
    )
    return JSONResponse(
        status_code=422,
        content={
            "success": False,
            "message": "validation error",
            "detail": exc.errors(),
        },
    )


async def _handle_unhandled(request: Request, exc: Exception) -> JSONResponse:
    request_id = getattr(request.state, "request_id", "-")
    logger.exception(
        "Unhandled exception",
        extra={"request_id": request_id, "path": request.url.path},
    )
    return JSONResponse(
        status_code=500,
        content={"success": False, "message": "internal server error"},
    )


def register_error_handlers(app: FastAPI) -> None:
    """Đăng ký tất cả error handler vào app."""
    app.add_exception_handler(AppError, _handle_app_error)  # type: ignore[arg-type]
    app.add_exception_handler(HTTPException, _handle_http_exception)  # type: ignore[arg-type]
    app.add_exception_handler(RequestValidationError, _handle_validation_error)  # type: ignore[arg-type]
    app.add_exception_handler(Exception, _handle_unhandled)  # type: ignore[arg-type]
