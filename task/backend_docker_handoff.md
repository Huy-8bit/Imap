# Backend Docker Handoff

Ngày cập nhật: 2026-04-30

## Những gì đã thêm

- `backend/Dockerfile`
- `backend/scripts/docker-entrypoint.sh`
- service `backend` trong `devops/docker-compose.yml`
- backend expose host port `8010`

## Startup flow trong container

1. Wait `postgres:5432`
2. Wait `redis:6379`
3. `python -m backend.scripts.migrate up`
4. `python -m backend.scripts.seed_taxonomies`
5. `python -m backend.scripts.import_organizations --dataset-path ...`
6. `python -m backend.service.main`

## Env knobs cho compose

- `BACKEND_HOST_PORT`
- `JWT_SECRET`
- `BOOTSTRAP_WAIT_TIMEOUT_SECONDS`
- `BOOTSTRAP_SEED_TAXONOMIES`
- `BOOTSTRAP_IMPORT_ORGANIZATIONS`
- `ORGANIZATION_DATASET_PATH`

## Ghi chú

- Không dockerize FE trong lượt này.
- Compose build context là root repo, để image có cả `backend/` và `docs/`.
- Không mount source code vào container; image build tĩnh để start path đơn giản và ít phụ thuộc host hơn.
