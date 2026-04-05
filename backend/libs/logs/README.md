# libs/logs

Thư viện log dùng chung cho project, viết bằng Python standard library.

## API chính

```python
from libs.logs import bind_log_context, clear_log_context, get_logger, scoped_log_context, setup_logging

setup_logging(
    service_name="imap-api",
    level="INFO",
    json_logs=True,
    enable_console=True,
    enable_file=True,
)

logger = get_logger(__name__, component="http")

bind_log_context(request_id="req-123")
logger.info("Server started", extra={"port": 8080})

with scoped_log_context(user_id=42):
    logger.info("Processing request")

clear_log_context()
```

Nếu muốn tự quy định text format thì dùng `build_log_formatter(...)` rồi truyền vào `setup_logging(formatter=...)`.

## Tính năng

- Text log để đọc local.
- JSON log để đẩy sang collector.
- `RotatingFileHandler` để xoay file log.
- `contextvars` để gắn `request_id`, `user_id`, trace id theo scope hiện tại.
- `build_log_formatter(...)` để quy định format log ở một chỗ.
