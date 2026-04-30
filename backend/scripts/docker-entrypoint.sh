#!/bin/sh
set -eu

is_truthy() {
  value="$(printf '%s' "${1:-}" | tr '[:upper:]' '[:lower:]')"
  case "$value" in
    1|true|yes|on)
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

wait_for_tcp() {
  host="$1"
  port="$2"
  timeout_seconds="$3"

  python - "$host" "$port" "$timeout_seconds" <<'PY'
import socket
import sys
import time

host = sys.argv[1]
port = int(sys.argv[2])
timeout_seconds = float(sys.argv[3])
deadline = time.time() + timeout_seconds

while time.time() < deadline:
    try:
        with socket.create_connection((host, port), timeout=2):
            sys.exit(0)
    except OSError:
        time.sleep(1)

print(f"Timed out waiting for {host}:{port}", file=sys.stderr)
sys.exit(1)
PY
}

WAIT_TIMEOUT="${BOOTSTRAP_WAIT_TIMEOUT_SECONDS:-120}"
PG_HOST_VALUE="${PG_HOST:-postgres}"
PG_PORT_VALUE="${PG_PORT:-5432}"
REDIS_HOST_VALUE="${REDIS_HOST:-redis}"
REDIS_PORT_VALUE="${REDIS_PORT:-6379}"

echo "Waiting for PostgreSQL at ${PG_HOST_VALUE}:${PG_PORT_VALUE}..."
wait_for_tcp "$PG_HOST_VALUE" "$PG_PORT_VALUE" "$WAIT_TIMEOUT"

echo "Waiting for Redis at ${REDIS_HOST_VALUE}:${REDIS_PORT_VALUE}..."
wait_for_tcp "$REDIS_HOST_VALUE" "$REDIS_PORT_VALUE" "$WAIT_TIMEOUT"

echo "Applying SQL migrations..."
python -m backend.scripts.migrate up

if is_truthy "${BOOTSTRAP_SEED_TAXONOMIES:-true}"; then
  echo "Seeding taxonomies..."
  python -m backend.scripts.seed_taxonomies
fi

if is_truthy "${BOOTSTRAP_IMPORT_ORGANIZATIONS:-true}"; then
  echo "Importing organizations from ${ORGANIZATION_DATASET_PATH:-docs/iMapVN/Data/Sample-iMap-Json/dataEng.json}..."
  python -m backend.scripts.import_organizations --dataset-path "${ORGANIZATION_DATASET_PATH:-docs/iMapVN/Data/Sample-iMap-Json/dataEng.json}"
fi

if [ "$#" -gt 0 ]; then
  exec "$@"
fi

exec python -m backend.service.main
