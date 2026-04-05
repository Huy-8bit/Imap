from __future__ import annotations

from fastapi import FastAPI

from libs.database import get_postgresql, get_redis, setup_postgresql, setup_redis
from libs.http import build_lifespan, create_app
from libs.logs import setup_logging

from .config import config
from .routes import api_router


async def _on_startup() -> None:
    setup_logging(
        service_name=config.name,
        level=config.log_level,
        json_logs=config.log_json,
        enable_console=True,
        enable_file=config.log_file,
        log_dir=config.log_dir,
        filename=f"{config.name}.log",
    )

    setup_postgresql(
        host=config.pg_host,
        port=config.pg_port,
        database=config.pg_database,
        user=config.pg_user,
        password=config.pg_password,
        min_connections=config.pg_min_conn,
        max_connections=config.pg_max_conn,
    )

    setup_redis(
        host=config.redis_host,
        port=config.redis_port,
        db=config.redis_db,
        password=config.redis_password,
    )


async def _on_shutdown() -> None:
    get_postgresql().close()
    get_redis().close()


def create_service() -> FastAPI:
    app = create_app(
        title=config.name,
        version=config.version,
        debug=config.debug,
        cors_origins=config.cors_origins,
        docs_url=None if config.is_production() else "/docs",
        redoc_url=None if config.is_production() else "/redoc",
        openapi_url=None if config.is_production() else "/openapi.json",
        lifespan=build_lifespan(
            on_startup=[_on_startup],
            on_shutdown=[_on_shutdown],
        ),
    )

    app.include_router(api_router, prefix="/api")

    return app


app = create_service()
