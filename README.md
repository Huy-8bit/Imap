# IMAP Backend

Backend Python dùng `FastAPI`, có sẵn thư viện dùng chung cho HTTP, logging, PostgreSQL/PostGIS và Redis.

Backend có thể chạy theo 2 mode:

- `docker compose`: frontend + backend + PostGIS + Redis cùng network; local expose FE `127.0.0.1:8080`, backend `127.0.0.1:8010`
- host Python local: dùng `backend/.env` và tự chạy `python -m backend.service.main`

Tài liệu API tổng hợp 1 file:

- [docs/API_README.md](docs/API_README.md)

## Tổng quan source code

```text
backend/
├── domain/
│   ├── assessment/           # question bank + submissions + result snapshots
│   ├── auth/                 # users, sessions, tokens, RBAC helpers
│   ├── certification/        # directory + application/review/upgrade workflow
│   ├── iid/                  # about/team/partners CMS read/write services
│   ├── news/                 # news CRUD services
│   ├── organizations/        # import pipeline + catalog/map/dashboard queries
│   ├── reports/              # report catalog + custom analysis workflow
│   └── taxonomies/           # taxonomy seed loader / repository / service
├── service/                   # entrypoint FastAPI và routes
│   ├── app.py                 # tạo app, startup/shutdown, inject router
│   ├── config.py              # đọc biến môi trường
│   ├── dependencies.py        # DB/Redis dependencies + auth helpers
│   ├── main.py                # lệnh chạy uvicorn
│   └── routes/
│       ├── assessment.py      # /api/assessment/*
│       ├── auth.py            # /api/auth/*
│       ├── certification.py   # /api/certification/*
│       ├── dashboard.py       # /api/dashboard/* public breakdowns + Redis cache
│       ├── enterprises.py     # /api/v1/orgs* (và /api/enterprises* deprecated) public catalog APIs
│       ├── health.py          # /api/health kiểm tra PostgreSQL + Redis
│       ├── iid.py             # /api/iid/*
│       ├── map.py             # /api/map/enterprises (full-featured), /api/v1/map/pins (lean GeoJSON)
│       ├── news.py            # /api/news CRUD
│       ├── reports.py         # /api/reports/*
│       ├── stats.py           # /api/stats/overview public aggregates + Redis cache
│       └── taxonomies.py      # /api/taxonomies phục vụ filter public
├── libs/
│   ├── http/                  # app factory, middleware, error handlers, responses
│   ├── logs/                  # logging helpers
│   └── database/
│       ├── postgreSQL/        # pool/client PostgreSQL
│       └── redis/             # client/helper Redis
├── migrations/
│   └── sql/                   # SQL migrations tracked trong DB
├── scripts/
│   ├── migrate.py             # apply/status migrations
│   ├── seed_taxonomies.py     # seed taxonomy từ docs
│   └── import_organizations.py
└── tests/
    ├── test_logs.py
    ├── test_organization_importer.py
    ├── test_redis_client.py
    └── test_taxonomy_seed_loader.py
```

### Dependency mà backend đang cần

- `PostgreSQL/PostGIS`: app kết nối ngay ở startup qua `setup_postgresql(...)`.
- `Redis`: app kết nối ngay ở startup qua `setup_redis(...)`.
- Nếu một trong hai service chưa sẵn sàng, backend sẽ fail khi boot.

## Yêu cầu môi trường

- `Python 3.14.x` được dùng để kiểm tra repo hiện tại.
- `Docker` và `Docker Compose`.

## Setup local

### 1. Tạo file môi trường

Từ thư mục gốc repo:

```bash
cp backend/.env.example backend/.env
cp devops/.env.example devops/.env
```

`backend/.env.example` đã map sẵn về local host:

- PostgreSQL: `127.0.0.1:5432`
- Redis: `127.0.0.1:6379`
- Google auth: điền `GOOGLE_CLIENT_ID` trong `backend/.env` và `VITE_GOOGLE_CLIENT_ID` trong `fe/.env` bằng OAuth Web Client ID nếu muốn bật nút đăng nhập Google

### 2. Chạy full backend stack bằng Docker Compose

```bash
docker compose --env-file devops/.env -f devops/docker-compose.yml up -d
```

Compose này sẽ tạo:

- `postgis/postgis:16-3.4-alpine`
- `redis:7-alpine`
- `backend` build từ `backend/Dockerfile`
- `frontend` build từ `fe/Dockerfile`, serve static bằng nginx và proxy `/api` về backend nội bộ
- volume persist cho cả PostgreSQL và Redis
- healthcheck cho backend/dependencies

Backend container startup flow:

- wait `postgres` + `redis`
- `python -m backend.scripts.migrate up`
- `python -m backend.scripts.seed_taxonomies`
- `python -m backend.scripts.import_organizations`
- `python -m backend.service.main`

Sau khi stack lên:

- Frontend local: `http://127.0.0.1:8080`
- API base: `http://127.0.0.1:8010`
- Swagger docs: `http://127.0.0.1:8010/docs`

Muốn dừng:

```bash
docker compose --env-file devops/.env -f devops/docker-compose.yml down
```

Muốn dừng và xoá luôn data local:

```bash
docker compose --env-file devops/.env -f devops/docker-compose.yml down -v
```

Logs backend:

```bash
docker compose --env-file devops/.env -f devops/docker-compose.yml logs -f backend
```

## Deploy server `103.1.236.121`

Tạo env từ mẫu server:

```bash
cp devops/.env.server.example devops/.env
```

Trước khi chạy, đổi ít nhất:

- `POSTGRES_PASSWORD`
- `JWT_SECRET`
- `GOOGLE_CLIENT_ID` và `VITE_GOOGLE_CLIENT_ID` nếu bật Google Sign-In

Chạy full stack:

```bash
docker compose --env-file devops/.env -f devops/docker-compose.yml up --build -d
```

Mặc định server deploy:

- Frontend public: `http://103.1.236.121`
- Backend chỉ bind host-local: `127.0.0.1:8010`
- PostgreSQL/Redis chỉ bind host-local để tránh mở DB/cache ra internet
- nginx frontend proxy `/api/*` tới backend container, nên FE gọi API cùng origin

Kiểm tra:

```bash
curl http://103.1.236.121/api/health
curl http://127.0.0.1:8010/api/health
```

Nếu server có firewall, mở inbound TCP `80`. Chỉ mở `8010`, `5433`, `6379` khi có nhu cầu vận hành riêng và đã giới hạn IP truy cập.

### 3. Chạy backend bằng Python local

Nếu không muốn dùng backend container, có thể vẫn chạy PostGIS/Redis bằng compose rồi start backend trên host machine.

Chạy riêng dependency:

```bash
docker compose --env-file devops/.env -f devops/docker-compose.yml up -d postgres redis
```

### 4. Cài Python dependencies

Nếu chưa có virtualenv:

```bash
python3 -m venv backend/.venv
```

Cài package:

```bash
backend/.venv/bin/pip install -r backend/requirements.txt
```

### 5. Export biến môi trường cho backend

Repo hiện tại đọc config trực tiếp từ environment variables, nên cần load file `backend/.env` vào shell trước khi chạy app:

```bash
set -a
source backend/.env
set +a
```

`backend/.env.example` hiện mặc định `PORT=8010` để khớp FE local.

### 6. Chạy migration + seed

```bash
backend/.venv/bin/python -m backend.scripts.migrate up
backend/.venv/bin/python -m backend.scripts.seed_taxonomies
backend/.venv/bin/python -m backend.scripts.import_organizations \
  --dataset-path docs/iMapVN/Data/Sample-iMap-Json/dataEng.json
```

Muốn chỉ validate source mà chưa ghi DB:

```bash
backend/.venv/bin/python -m backend.scripts.seed_taxonomies --dry-run
backend/.venv/bin/python -m backend.scripts.import_organizations --dry-run
```

### 7. Chạy backend

```bash
backend/.venv/bin/python -m backend.service.main
```

Backend mặc định chạy ở:

- `http://127.0.0.1:8010`
- Swagger docs: `http://127.0.0.1:8010/docs`

## Kiểm tra nhanh

### Health check

```bash
curl http://127.0.0.1:8010/api/health
```

Response mong đợi khi đủ dependency:

```json
{
  "data": {
    "status": "ok",
    "dependencies": {
      "postgresql": "ok",
      "redis": "ok"
    }
  },
  "meta": null,
  "error": null
}
```

### Taxonomy check

```bash
curl http://127.0.0.1:8010/api/taxonomies/provinces
```

### Enterprise catalog checks

```bash
curl "http://127.0.0.1:8010/api/v1/orgs?page=1&page_size=20"
curl "http://127.0.0.1:8010/api/v1/orgs?q=Catalog%20Alpha&page=1&page_size=5"
curl "http://127.0.0.1:8010/api/v1/orgs/2"
```

### Enterprise map checks

```bash
# Lean pin endpoint — trả GeoJSON FeatureCollection với id, status, primary_ai_tag
curl "http://127.0.0.1:8010/api/v1/map/pins"

# Full-featured map (có filter + bbox)
curl "http://127.0.0.1:8010/api/map/enterprises"
curl "http://127.0.0.1:8010/api/map/enterprises?province=ho_chi_minh_city&operationalStatus=active&organizationType=private_enterprise&primaryIndustrySector=manufacturing&hasPositiveSocialImpact=true&environmentalImpactArea=climate_change"
curl "http://127.0.0.1:8010/api/map/enterprises?bbox=105.80,21.00,105.90,21.08"
```

### Overview stats checks

```bash
curl "http://127.0.0.1:8010/api/stats/overview"
curl "http://127.0.0.1:8010/api/stats/overview?province=ho_chi_minh_city&operationalStatus=active&organizationType=private_enterprise&primaryIndustrySector=manufacturing&hasPositiveSocialImpact=true&environmentalImpactArea=climate_change"
```

### Dashboard breakdown checks

```bash
curl "http://127.0.0.1:8010/api/dashboard/by-province"
curl "http://127.0.0.1:8010/api/dashboard/by-province?operationalStatus=active&organizationType=private_enterprise&primaryIndustrySector=manufacturing&hasPositiveSocialImpact=true&environmentalImpactArea=climate_change"
curl "http://127.0.0.1:8010/api/dashboard/by-sector"
curl "http://127.0.0.1:8010/api/dashboard/by-sector?province=ho_chi_minh_city&operationalStatus=active&organizationType=private_enterprise&hasPositiveSocialImpact=true&environmentalImpactArea=climate_change"
curl "http://127.0.0.1:8010/api/dashboard/by-organization-type"
curl "http://127.0.0.1:8010/api/dashboard/growth"
curl "http://127.0.0.1:8010/api/dashboard/impact-flows?limit=10"
```

### Auth + CMS quick checks

```bash
curl -X POST "http://127.0.0.1:8010/api/auth/login" \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@example.com","password":"Password123"}'
curl -X POST "http://127.0.0.1:8010/api/auth/google" \
  -H "Content-Type: application/json" \
  -d '{"credential":"<google_id_token>"}'
curl "http://127.0.0.1:8010/api/iid/about"
curl "http://127.0.0.1:8010/api/iid/team"
curl "http://127.0.0.1:8010/api/iid/partners"
curl "http://127.0.0.1:8010/api/news"
```

### Assessment, certification, reports quick checks

```bash
curl "http://127.0.0.1:8010/api/assessment/questions"
curl "http://127.0.0.1:8010/api/certification/directory"
curl "http://127.0.0.1:8010/api/reports"
curl "http://127.0.0.1:8010/api/reports/province"
curl "http://127.0.0.1:8010/api/reports/sector"
curl "http://127.0.0.1:8010/api/reports/due-dil"
curl "http://127.0.0.1:8010/api/reports/sroi"
```

### Chạy regression tests đã có

```bash
backend/.venv/bin/python -m unittest \
  backend.tests.test_logs \
  backend.tests.test_taxonomy_seed_loader \
  backend.tests.test_organization_importer \
  backend.tests.test_redis_client \
  backend.tests.test_enterprise_catalog_api \
  backend.tests.test_enterprise_map_api \
  backend.tests.test_stats_overview_api \
  backend.tests.test_dashboard_by_province_api \
  backend.tests.test_dashboard_by_sector_api \
  backend.tests.test_google_auth_service
```

## Response envelope

Tất cả successful response của API đều theo contract sau:

```json
{
  "data": "<payload>",
  "meta": "<object hoặc null>",
  "error": null
}
```

| Field | Kiểu | Mô tả |
| --- | --- | --- |
| `data` | any | Payload chính — object, list, hoặc dict tuỳ endpoint |
| `meta` | object \| null | Pagination, cache info, aggregation context, v.v. `null` cho các single-item response |
| `error` | string \| null | Luôn `null` khi thành công |

### Ví dụ — single object (no pagination)

```json
{
  "data": { "id": 1, "display_name": "Alpha Corp", ... },
  "meta": null,
  "error": null
}
```

### Ví dụ — paginated list

```json
{
  "data": [ ... ],
  "meta": {
    "total": 42,
    "page": 1,
    "page_size": 20,
    "total_pages": 3
  },
  "error": null
}
```

### Error response (4xx / 5xx)

Error response đến từ global error handler (`libs/http/responses.py`), **không dùng envelope trên**, mà trả:

```json
{
  "success": false,
  "message": "enterprise not found"
}
```

Hoặc validation error (422) từ FastAPI:

```json
{
  "success": false,
  "message": "...",
  "detail": [...]
}
```

### Thay đổi so với phiên bản cũ

Trước đây (trước refactor) tất cả response trả thêm 2 field:

```json
{
  "success": true,
  "message": "ok",
  "data": ...,
  "meta": ...
}
```

Đã xoá `success` và `message` khỏi tất cả 40 `*Envelope` class trong `domain/*/schemas.py`, thêm `error: str | None = None`. Nếu FE hoặc client cũ đang đọc `payload.success` hoặc `payload.message` từ successful response thì cần cập nhật lại.

## Public API notes

- `/api/v1/orgs` (primary), `/api/enterprises` (deprecated), `/api/map/enterprises`, `/api/stats/overview`, `/api/dashboard/by-province` và `/api/dashboard/by-sector` đang dùng cùng filter semantics theo taxonomy `code` đã seed:
  - `province`
  - `operationalStatus`
  - `organizationType`
  - `primaryIndustrySector`
  - `hasPositiveSocialImpact`
  - `environmentalImpactArea`
- `/api/map/enterprises` trả `GeoJSON FeatureCollection` đầy đủ field trong `data`.
- `/api/v1/map/pins` trả `GeoJSON FeatureCollection` tối giản cho map rendering — mỗi feature chỉ có `id`, `status`, `primary_ai_tag` trong `properties`. Không hỗ trợ filter hay bbox.
- `bbox` của `/api/map/enterprises` có format `minLng,minLat,maxLng,maxLat`.
- Map meta hiện trả:
  - `matched_total`: số organization khớp attribute filters trước khi áp bbox
  - `mappable_total`: số organization khớp filters và có geometry hợp lệ
  - `unmapped_total`: số organization khớp filters nhưng chưa có geometry hợp lệ
  - `returned_total`: số feature thực tế trả về sau khi áp bbox nếu có
- `/api/stats/overview` hiện trả các metric sau trong `data`:
  - `total_organizations`
  - `active_organizations`
  - `provinces_count`
  - `social_impact_organizations`
  - `environmental_impact_organizations`
  - `mappable_organizations`
- `environmental_impact_organizations` là số organization khớp filter và có ít nhất một record trong `organization_environmental_impacts`, không phải tổng số link impact.
- `/api/stats/overview` dùng Redis cache với TTL đọc từ `CACHE_OVERVIEW_TTL_SECONDS` và cache key canonicalized theo đầy đủ filter đầu vào.
- Nếu Redis read/write lỗi trong lúc xử lý overview endpoint, request vẫn fallback về PostgreSQL thay vì fail.
- `/api/dashboard/by-province` hiện trả breakdown buckets với các field:
  - `province_code`
  - `province_name`
  - `organization_count`
  - `mappable_count`
- `/api/dashboard/by-province` mặc định sort theo:
  - `organization_count DESC`
  - tie-break `province_code ASC`
- `/api/dashboard/by-sector` hiện trả breakdown buckets với các field:
  - `primary_industry_sector_code`
  - `primary_industry_sector_name`
  - `organization_count`
  - `mappable_count`
- `/api/dashboard/by-organization-type` dùng cùng breakdown foundation và hiện trả:
  - `organization_type_code`
  - `organization_type_name`
  - `organization_count`
  - `mappable_count`
- `/api/dashboard/by-sector` mặc định sort theo:
  - `organization_count DESC`
  - tie-break `primary_industry_sector_code ASC`
- `/api/dashboard/by-organization-type` mặc định sort theo:
  - `organization_count DESC`
  - tie-break `organization_type_code ASC`
- Meta của `/api/dashboard/by-province` hiện trả:
  - `group_by`
  - `matched_total`
  - `bucket_count`
  - `filters_applied`
  - `cache_hit`
  - `cache_ttl_seconds`
- Meta của `/api/dashboard/by-sector` và `/api/dashboard/by-organization-type` dùng cùng contract với `/api/dashboard/by-province`.
- Dashboard breakdown hiện reuse Redis cache pattern của overview:
  - key canonicalized theo filter đầu vào
  - TTL reuse `CACHE_OVERVIEW_TTL_SECONDS`
  - Redis read/write lỗi thì fallback DB
- `/api/dashboard/growth` hiện trả chuỗi thời gian theo năm thành lập trên dữ liệu đang có; chưa suy luận tăng trưởng kinh doanh vì IID chưa có rule khác.
- `/api/dashboard/impact-flows` hiện trả cell aggregate giữa `primaryIndustrySector` và `environmentalImpactArea`, phục vụ dashboard/public report cohort views.
- `/api/enterprises/featured` hiện là curated list admin-managed theo cờ `is_featured`; backend không tự tính ranking.
- `/api/enterprises/{id}/quick` trả tóm tắt public-safe cho popup/card.
- `/api/enterprises/{id}/radar` trả score snapshot gần nhất; nếu chưa có assessment snapshot thì trả structure hợp lệ với `scores=[]` và `overall_score=null`.
- `/api/auth/refresh` rotate session: refresh thành công sẽ revoke session cũ, nên access token cũ không còn dùng được.
- `/api/assessment/*` đang dùng scoring engine generic/config-driven:
  - single/multi choice dựa trên `weight`
  - boolean -> `0/1`
  - numeric/scale -> normalize theo config min/max nếu có
  - chưa có công thức business 5 pillars cuối cùng từ IID
- `/api/certification/*` dùng workflow generic:
  - apply -> review -> current certification -> upgrade
  - level taxonomy seed sẵn `basic/verified/gold`
  - chưa có rubric chấm level chi tiết, nên review/upgrade là admin-driven
- `/api/reports/*` hiện mới quản lý metadata, access policy và custom analysis workflow; chưa có report generation engine hay binary storage service.

## Biến môi trường backend

| Biến | Mặc định | Ý nghĩa |
| --- | --- | --- |
| `APP_NAME` | `imap` | Tên service |
| `APP_ENV` | `local` | Môi trường chạy |
| `APP_DEBUG` | `false` | Bật debug mode |
| `APP_VERSION` | `0.1.0` | Version app |
| `HOST` | `0.0.0.0` | Host bind cho uvicorn |
| `PORT` | `8000` | Port backend |
| `WORKERS` | `1` | Số worker uvicorn |
| `RELOAD` | `false` | Bật auto reload |
| `CORS_ORIGINS` | `*` | Danh sách origins cách nhau bởi dấu phẩy |
| `LOG_LEVEL` | `INFO` | Log level |
| `LOG_JSON` | `false` | Xuất log JSON |
| `LOG_FILE` | `false` | Ghi log ra file |
| `LOG_DIR` | `runtime_logs` | Thư mục lưu log |
| `CACHE_DEFAULT_TTL_SECONDS` | `300` | TTL cache mặc định |
| `CACHE_OVERVIEW_TTL_SECONDS` | `3600` | TTL cho aggregate overview |
| `PG_HOST` | `localhost` | Host PostgreSQL |
| `PG_PORT` | `5432` | Port PostgreSQL |
| `PG_DATABASE` | `imap` | Tên database |
| `PG_USER` | `postgres` | User PostgreSQL |
| `PG_PASSWORD` | trống | Password PostgreSQL |
| `PG_MIN_CONN` | `1` | Min connection pool |
| `PG_MAX_CONN` | `10` | Max connection pool |
| `REDIS_HOST` | `localhost` | Host Redis |
| `REDIS_PORT` | `6379` | Port Redis |
| `REDIS_DB` | `0` | Redis DB index |
| `REDIS_PASSWORD` | trống | Password Redis |
| `JWT_SECRET` | `change-me` | Secret ký access/refresh token |
| `JWT_ACCESS_TTL_MINUTES` | `15` | TTL access token |
| `JWT_REFRESH_TTL_DAYS` | `30` | TTL refresh token |
| `FILE_STORAGE_ROOT` | `storage` | Root path cho file/report storage |
| `SEED_DATA_DIR` | `docs/iMapVN/Data/Sample-iMap-Json` | Source path cho taxonomy seed |
| `ORGANIZATION_DATASET_PATH` | `docs/iMapVN/Data/Sample-iMap-Json/dataEng.json` | Source path import organization |

## Ghi chú vận hành

- `backend/service/main.py` hiện đã dùng import path `backend.service.app:app`, nên chạy từ root repo.
- `backend/service/routes/health.py` sẽ gọi `ping()` tới PostgreSQL và Redis ở mỗi lần check.
- `backend/service/routes/taxonomies.py` trả taxonomy đã seed theo response envelope hiện có.
- `backend/service/routes/enterprises.py` mount ở 2 prefix: `/api/v1/orgs` (primary) và `/api/enterprises` (deprecated). Hiện có:
  - `GET /api/v1/orgs` — list + search qua `q` param
  - `POST /api/v1/orgs` — admin upsert 1 organization
  - `POST /api/v1/orgs/import` — admin bulk import
  - `POST /api/v1/orgs/self-registration` — enterprise tự đăng ký
  - `GET /api/v1/orgs/featured`
  - `GET /api/v1/orgs/{id}/quick`
  - `GET /api/v1/orgs/{id}/radar`
  - `GET /api/v1/orgs/{id}`
- `backend/service/routes/map.py` mount ở cả `/api/map` và `/api/v1/map`. Hiện có:
  - `GET /api/v1/map/pins` — lean GeoJSON chỉ có id/status/primary_ai_tag, dùng cho map rendering
  - `GET /api/map/enterprises` — full-featured map với filter + bbox
- Admin hiện có 2 đường ingest organization qua HTTP:
  - `POST /api/v1/orgs`: upsert 1 organization
  - `POST /api/v1/orgs/import`: import nhiều organization, hỗ trợ `dryRun`
- Các script `backend.scripts.migrate`, `backend.scripts.seed_taxonomies`, `backend.scripts.import_organizations` vẫn là đường bootstrap/import nền của môi trường.
- `backend/service/routes/dashboard.py` hiện có:
  - `GET /api/dashboard/by-province`
  - `GET /api/dashboard/by-sector`
  - `GET /api/dashboard/by-organization-type`
  - `GET /api/dashboard/growth`
  - `GET /api/dashboard/impact-flows`
- `backend/service/routes/news.py` hiện có CRUD:
  - `GET /api/news`
  - `POST /api/news`
  - `PUT /api/news/{id}`
  - `DELETE /api/news/{id}`
- `backend/service/routes/iid.py` hiện có:
  - `GET /api/iid/about`
  - `GET /api/iid/team`
  - `GET /api/iid/partners`
  - `PUT /api/iid/about`
- `backend/service/routes/auth.py`, `assessment.py`, `certification.py`, `reports.py` đã nối đầy đủ route/service/repository trên schema mới.
- Enterprise filter params dùng taxonomy `code` đã seed, ví dụ:
  - `province=ho_chi_minh_city`
  - `operationalStatus=active`
  - `organizationType=private_enterprise`
  - `primaryIndustrySector=manufacturing`
  - `environmentalImpactArea=climate_change`
- Nếu muốn ghi log file local, bật `LOG_FILE=true`; file sẽ nằm ở thư mục `LOG_DIR`.

## File mới phục vụ local dev

- `backend/.env.example`: mẫu env cho backend chạy trên host machine.
- `devops/.env.example`: biến dùng cho Docker Compose.
- `devops/docker-compose.yml`: khởi động PostGIS và Redis local.

## Frontend (`fe/`)

Frontend trong `fe/` hiện là app React + TypeScript + Vite, nối trực tiếp vào backend hiện có.

### Cài dependencies

```bash
cd fe
npm install
```

### Tạo env

```bash
cp fe/.env.example fe/.env
```

Biến quan trọng:

- `VITE_API_BASE_URL`: base URL của backend, mặc định `http://127.0.0.1:8010`

### Chạy local

```bash
cd fe
npm run dev -- --host 127.0.0.1 --port 5173
```

### Build

```bash
cd fe
npm run build
```

### Ghi chú FE

- FE dùng API thật cho home, map, dashboard, enterprise detail, auth, assessment, certification, reports, IID CMS.
- Auth flow dùng access token + refresh token; `/api/auth/refresh` rotate session nên access token cũ sẽ không còn hợp lệ sau refresh.
- Những phần backend/business chưa đủ dữ liệu sẽ render rõ ràng theo trạng thái thật:
  - map geometry chưa có -> không render marker giả
  - featured enterprises rỗng -> empty state
  - assessment questions rỗng -> placeholder thay vì form SIM giả
  - pillar analytics chưa có endpoint -> “Đang cập nhật”
  - SROI chưa có formula -> chỉ hiển thị raw signals
  - IID team/partners rỗng -> empty state
