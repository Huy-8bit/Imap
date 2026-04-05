from __future__ import annotations

from typing import Any

from fastapi.responses import JSONResponse


def ok(data: Any = None, *, message: str = "ok", meta: dict[str, Any] | None = None) -> JSONResponse:
    """200 — thành công, có data."""
    body: dict[str, Any] = {"success": True, "message": message, "data": data}
    if meta:
        body["meta"] = meta
    return JSONResponse(status_code=200, content=body)


def created(data: Any = None, *, message: str = "created") -> JSONResponse:
    """201 — tạo mới thành công."""
    return JSONResponse(
        status_code=201,
        content={"success": True, "message": message, "data": data},
    )


def no_content() -> JSONResponse:
    """204 — không có nội dung trả về."""
    return JSONResponse(status_code=204, content=None)


def bad_request(message: str = "bad request", *, detail: Any = None) -> JSONResponse:
    """400 — request không hợp lệ."""
    return _error(400, message, detail)


def unauthorized(message: str = "unauthorized", *, detail: Any = None) -> JSONResponse:
    """401 — chưa xác thực."""
    return _error(401, message, detail)


def forbidden(message: str = "forbidden", *, detail: Any = None) -> JSONResponse:
    """403 — không có quyền."""
    return _error(403, message, detail)


def not_found(message: str = "not found", *, detail: Any = None) -> JSONResponse:
    """404 — không tìm thấy resource."""
    return _error(404, message, detail)


def conflict(message: str = "conflict", *, detail: Any = None) -> JSONResponse:
    """409 — xung đột dữ liệu."""
    return _error(409, message, detail)


def unprocessable(message: str = "unprocessable entity", *, detail: Any = None) -> JSONResponse:
    """422 — dữ liệu đúng format nhưng không hợp lệ về logic."""
    return _error(422, message, detail)


def internal_error(message: str = "internal server error", *, detail: Any = None) -> JSONResponse:
    """500 — lỗi server không mong muốn."""
    return _error(500, message, detail)


def paginated(
    items: list[Any],
    *,
    total: int,
    page: int,
    page_size: int,
    message: str = "ok",
) -> JSONResponse:
    """200 — danh sách có phân trang."""
    return JSONResponse(
        status_code=200,
        content={
            "success": True,
            "message": message,
            "data": items,
            "meta": {
                "total": total,
                "page": page,
                "page_size": page_size,
                "total_pages": -(-total // page_size),  # ceiling division
            },
        },
    )


def _error(status_code: int, message: str, detail: Any) -> JSONResponse:
    body: dict[str, Any] = {"success": False, "message": message}
    if detail is not None:
        body["detail"] = detail
    return JSONResponse(status_code=status_code, content=body)
