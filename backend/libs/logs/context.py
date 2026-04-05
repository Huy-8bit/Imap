from __future__ import annotations

from contextlib import contextmanager
from contextvars import ContextVar
from typing import Any, Iterator

_log_context: ContextVar[dict[str, Any] | None] = ContextVar("log_context", default=None)


def get_log_context() -> dict[str, Any]:
    """Return the current request-scoped logging context."""
    return dict(_log_context.get() or {})


def bind_log_context(**values: Any) -> dict[str, Any]:
    """Merge new values into the current logging context."""
    context = get_log_context()
    context.update({key: value for key, value in values.items() if value is not None})
    _log_context.set(context)
    return context


def unbind_log_context(*keys: str) -> dict[str, Any]:
    """Remove keys from the current logging context."""
    context = get_log_context()
    for key in keys:
        context.pop(key, None)
    _log_context.set(context)
    return context


def clear_log_context() -> None:
    """Reset the current logging context."""
    _log_context.set({})


@contextmanager
def scoped_log_context(**values: Any) -> Iterator[dict[str, Any]]:
    """Temporarily bind values for the duration of the context block."""
    previous_context = get_log_context()
    bind_log_context(**values)
    try:
        yield get_log_context()
    finally:
        _log_context.set(previous_context)
