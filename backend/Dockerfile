FROM python:3.14-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PYTHONPATH=/app

WORKDIR /app

COPY backend/requirements.txt /tmp/requirements.txt

RUN pip install --upgrade pip \
    && pip install -r /tmp/requirements.txt

COPY backend /app/backend
COPY docs /app/docs

RUN mkdir -p /app/storage /app/runtime_logs \
    && chmod +x /app/backend/scripts/docker-entrypoint.sh

EXPOSE 8010

ENTRYPOINT ["/app/backend/scripts/docker-entrypoint.sh"]
