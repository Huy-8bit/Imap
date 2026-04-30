# IMAP Backend

Backend Python dùng `FastAPI`, có sẵn thư viện dùng chung cho HTTP, logging, PostgreSQL/PostGIS và Redis.

Backend có thể chạy theo 2 mode:

- `docker compose`: backend + PostGIS + Redis cùng network, backend expose host `127.0.0.1:8010`
- host Python local: dùng `backend/.env` và tự chạy `python -m backend.service.main`

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
│       ├── enterprises.py     # /api/enterprises* public catalog APIs
│       ├── health.py          # /api/health kiểm tra PostgreSQL + Redis
│       ├── iid.py             # /api/iid/*
│       ├── map.py             # /api/map/enterprises public GeoJSON map API
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

### 2. Chạy full backend stack bằng Docker Compose

```bash
docker compose --env-file devops/.env -f devops/docker-compose.yml up -d
```

Compose này sẽ tạo:

- `postgis/postgis:16-3.4-alpine`
- `redis:7-alpine`
- `backend` build từ `backend/Dockerfile`
- volume persist cho cả PostgreSQL và Redis
- healthcheck cho 3 service

Backend container startup flow:

- wait `postgres` + `redis`
- `python -m backend.scripts.migrate up`
- `python -m backend.scripts.seed_taxonomies`
- `python -m backend.scripts.import_organizations`
- `python -m backend.service.main`

Sau khi stack lên:

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
  "success": true,
  "message": "ok",
  "data": {
    "status": "ok",
    "dependencies": {
      "postgresql": "ok",
      "redis": "ok"
    }
  }
}
```

### Taxonomy check

```bash
curl http://127.0.0.1:8010/api/taxonomies/provinces
```

### Enterprise catalog checks

```bash
curl "http://127.0.0.1:8010/api/enterprises?page=1&page_size=20"
curl "http://127.0.0.1:8010/api/enterprises/search?q=Catalog%20Alpha&page=1&page_size=5"
curl "http://127.0.0.1:8010/api/enterprises/2"
```

### Enterprise map checks

```bash
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
  backend.tests.test_dashboard_by_sector_api
```

## Public API notes

- `/api/enterprises`, `/api/map/enterprises`, `/api/stats/overview`, `/api/dashboard/by-province` và `/api/dashboard/by-sector` đang dùng cùng filter semantics theo taxonomy `code` đã seed:
  - `province`
  - `operationalStatus`
  - `organizationType`
  - `primaryIndustrySector`
  - `hasPositiveSocialImpact`
  - `environmentalImpactArea`
- `/api/map/enterprises` trả `GeoJSON FeatureCollection` trong `data`.
- `bbox` của map API có format `minLng,minLat,maxLng,maxLat`.
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
- `backend/service/routes/enterprises.py` hiện có:
  - `GET /api/enterprises`
  - `GET /api/enterprises/search`
  - `GET /api/enterprises/featured`
  - `GET /api/enterprises/{id}/quick`
  - `GET /api/enterprises/{id}/radar`
  - `GET /api/enterprises/{id}`
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
