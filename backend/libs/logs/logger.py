from __future__ import annotations

import json
import logging
from datetime import datetime, timezone
from logging.handlers import RotatingFileHandler
from pathlib import Path
from typing import Any

from .context import get_log_context

DEFAULT_LOG_FILENAME = "application.log"
DEFAULT_MAX_BYTES = 10 * 1024 * 1024
DEFAULT_BACKUP_COUNT = 5

_RESERVED_LOG_RECORD_FIELDS = {
    "args",
    "asctime",
    "created",
    "exc_info",
    "exc_text",
    "filename",
    "funcName",
    "levelname",
    "levelno",
    "lineno",
    "module",
    "msecs",
    "message",
    "msg",
    "name",
    "pathname",
    "process",
    "processName",
    "relativeCreated",
    "stack_info",
    "thread",
    "threadName",
    "taskName",
}


def _normalize_level(level: str | int) -> int:
    if isinstance(level, int):
        return level

    normalized = logging.getLevelName(level.upper())
    if isinstance(normalized, int):
        return normalized

    raise ValueError(f"Unsupported log level: {level}")


def _serialize_value(value: Any) -> Any:
    if isinstance(value, (str, int, float, bool)) or value is None:
        return value
    if isinstance(value, Path):
        return str(value)
    return repr(value)


def _collect_extra(record: logging.LogRecord) -> dict[str, Any]:
    extras: dict[str, Any] = {}
    for key, value in record.__dict__.items():
        if key in _RESERVED_LOG_RECORD_FIELDS or key.startswith("_"):
            continue
        extras[key] = _serialize_value(value)
    return extras


class TextFormatter(logging.Formatter):
    """Human-readable formatter for local development."""

    def __init__(
        self,
        service_name: str | None = None,
        *,
        template: str | None = None,
        datefmt: str | None = None,
    ) -> None:
        super().__init__(datefmt=datefmt)
        self.service_name = service_name or "-"
        self.template = template

    def formatTime(
        self,
        record: logging.LogRecord,
        datefmt: str | None = None,
    ) -> str:
        datefmt = datefmt or self.datefmt
        timestamp = datetime.fromtimestamp(record.created, tz=timezone.utc).astimezone()
        if datefmt:
            return timestamp.strftime(datefmt)
        return timestamp.isoformat(timespec="milliseconds")

    def format(self, record: logging.LogRecord) -> str:
        message = record.getMessage()
        extras = _collect_extra(record)
        context_text = " ".join(f"{key}={json.dumps(value, default=str)}" for key, value in sorted(extras.items()))
        exception_text = self.formatException(record.exc_info) if record.exc_info else ""
        stack_text = record.stack_info or ""

        if self.template:
            payload = {
                "timestamp": self.formatTime(record),
                "level": record.levelname,
                "service": self.service_name,
                "logger": record.name,
                "message": message,
                "context": context_text,
                "location": f"{record.pathname}:{record.lineno}",
                "module": record.module,
                "function": record.funcName,
                "filename": record.filename,
                "pathname": record.pathname,
                "lineno": record.lineno,
                "process": record.process,
                "process_name": record.processName,
                "thread": record.thread,
                "thread_name": record.threadName,
                "exception": exception_text,
                "stack": stack_text,
            }
            return self.template.format_map(_SafeFormatDict(payload)).strip()

        parts = [
            self.formatTime(record),
            record.levelname.ljust(8),
            self.service_name,
            record.name,
            message,
        ]

        if context_text:
            parts.append(context_text)

        if record.exc_info:
            parts.append(exception_text)

        if record.stack_info:
            parts.append(stack_text)

        return " | ".join(parts)


class JsonFormatter(logging.Formatter):
    """Structured JSON formatter for production or ingestion pipelines."""

    def __init__(self, service_name: str | None = None, *, datefmt: str | None = None) -> None:
        super().__init__(datefmt=datefmt)
        self.service_name = service_name

    def formatTime(
        self,
        record: logging.LogRecord,
        datefmt: str | None = None,
    ) -> str:
        datefmt = datefmt or self.datefmt
        timestamp = datetime.fromtimestamp(record.created, tz=timezone.utc).astimezone()
        if datefmt:
            return timestamp.strftime(datefmt)
        return timestamp.isoformat(timespec="milliseconds")

    def format(self, record: logging.LogRecord) -> str:
        payload: dict[str, Any] = {
            "timestamp": self.formatTime(record),
            "level": record.levelname,
            "logger": record.name,
            "message": record.getMessage(),
            "location": f"{record.pathname}:{record.lineno}",
        }

        if self.service_name:
            payload["service"] = self.service_name

        extras = _collect_extra(record)
        if extras:
            payload["context"] = extras

        if record.exc_info:
            payload["exception"] = self.formatException(record.exc_info)

        if record.stack_info:
            payload["stack"] = record.stack_info

        return json.dumps(payload, default=str, ensure_ascii=False)


class ContextLoggerAdapter(logging.LoggerAdapter):
    """Logger adapter that merges adapter-specific and request-scoped context."""

    def process(self, msg: Any, kwargs: dict[str, Any]) -> tuple[Any, dict[str, Any]]:
        adapter_extra = dict(self.extra or {})
        scoped_extra = get_log_context()
        runtime_extra = dict(kwargs.pop("extra", {}) or {})
        kwargs["extra"] = {**adapter_extra, **scoped_extra, **runtime_extra}
        return msg, kwargs


def get_logger(name: str | None = None, **extra: Any) -> ContextLoggerAdapter:
    """Return a context-aware logger adapter."""
    return ContextLoggerAdapter(logging.getLogger(name), extra)


class _SafeFormatDict(dict[str, Any]):
    def __missing__(self, key: str) -> str:
        return ""


def build_log_formatter(
    *,
    json_logs: bool = False,
    service_name: str | None = None,
    text_format: str | None = None,
    datefmt: str | None = None,
) -> logging.Formatter:
    """Create a formatter that defines how each log line is rendered."""
    if json_logs:
        return JsonFormatter(service_name=service_name, datefmt=datefmt)
    return TextFormatter(service_name=service_name, template=text_format, datefmt=datefmt)


def setup_logging(
    *,
    service_name: str | None = None,
    level: str | int = "INFO",
    json_logs: bool = False,
    formatter: logging.Formatter | None = None,
    text_format: str | None = None,
    datefmt: str | None = None,
    enable_console: bool = True,
    enable_file: bool = False,
    log_dir: str | Path = "logs",
    filename: str = DEFAULT_LOG_FILENAME,
    max_bytes: int = DEFAULT_MAX_BYTES,
    backup_count: int = DEFAULT_BACKUP_COUNT,
    force: bool = False,
) -> logging.Logger:
    """
    Configure the root logger for the application.

    Set ``force=True`` to replace any existing handlers.
    """
    root_logger = logging.getLogger()
    if root_logger.handlers and not force:
        return root_logger

    if force:
        for handler in list(root_logger.handlers):
            root_logger.removeHandler(handler)
            handler.close()

    level_value = _normalize_level(level)
    formatter = formatter or build_log_formatter(
        json_logs=json_logs,
        service_name=service_name,
        text_format=text_format,
        datefmt=datefmt,
    )

    handlers: list[logging.Handler] = []

    if enable_console:
        console_handler = logging.StreamHandler()
        console_handler.setLevel(level_value)
        console_handler.setFormatter(formatter)
        handlers.append(console_handler)

    if enable_file:
        target_dir = Path(log_dir)
        target_dir.mkdir(parents=True, exist_ok=True)

        file_handler = RotatingFileHandler(
            target_dir / filename,
            maxBytes=max_bytes,
            backupCount=backup_count,
            encoding="utf-8",
        )
        file_handler.setLevel(level_value)
        file_handler.setFormatter(formatter)
        handlers.append(file_handler)

    if not handlers:
        raise ValueError("At least one logging handler must be enabled.")

    root_logger.setLevel(level_value)
    for handler in handlers:
        root_logger.addHandler(handler)

    logging.captureWarnings(True)
    return root_logger
