from __future__ import annotations

import uvicorn

from .config import config


def main() -> None:
    uvicorn.run(
        "backend.service.app:app",
        host=config.host,
        port=config.port,
        workers=config.workers,
        reload=config.reload,
        log_config=None,  # dùng logging của libs/logs thay vì uvicorn default
    )


if __name__ == "__main__":
    main()
