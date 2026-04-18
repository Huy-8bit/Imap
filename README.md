# IMAP Backend

Backend Python dùng `FastAPI`, có sẵn thư viện dùng chung cho HTTP, logging, PostgreSQL và Redis.

## Tổng quan source code

```text
backend/
├── service/                  # entrypoint FastAPI và routes
│   ├── app.py                # tạo app, startup/shutdown, inject router
│   ├── config.py             # đọc biến môi trường
│   ├── main.py               # lệnh chạy uvicorn
│   └── routes/health.py      # /api/health kiểm tra PostgreSQL + Redis
├── libs/
│   ├── http/                 # app factory, middleware, error handlers, responses
│   ├── logs/                 # logging helpers
│   └── database/
│       ├── postgreSQL/       # pool/client PostgreSQL
│       └── redis/            # client/helper Redis
└── tests/
    └── test_logs.py          # unit test cho logging
```

### Dependency mà backend đang cần

- `PostgreSQL`: app kết nối ngay ở startup qua `setup_postgresql(...)`.
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

### 2. Chạy dependency bằng Docker Compose

```bash
docker compose --env-file devops/.env -f devops/docker-compose.yml up -d
```

Compose này sẽ tạo:

- `postgres:16-alpine`
- `redis:7-alpine`
- volume persist cho cả PostgreSQL và Redis
- healthcheck cho 2 service

Muốn dừng:

```bash
docker compose --env-file devops/.env -f devops/docker-compose.yml down
```

Muốn dừng và xoá luôn data local:

```bash
docker compose --env-file devops/.env -f devops/docker-compose.yml down -v
```

### 3. Cài Python dependencies

Nếu chưa có virtualenv:

```bash
python3 -m venv backend/.venv
```

Cài package:

```bash
backend/.venv/bin/pip install -r backend/requirements.txt
```

### 4. Export biến môi trường cho backend

Repo hiện tại đọc config trực tiếp từ environment variables, nên cần load file `backend/.env` vào shell trước khi chạy app:

```bash
set -a
source backend/.env
set +a
```

### 5. Chạy backend

```bash
backend/.venv/bin/python -m backend.service.main
```

Backend mặc định chạy ở:

- `http://127.0.0.1:8000`
- Swagger docs: `http://127.0.0.1:8000/docs`

## Kiểm tra nhanh

### Health check

```bash
curl http://127.0.0.1:8000/api/health
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

### Chạy test

```bash
backend/.venv/bin/python -m unittest backend.tests.test_logs
```

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

## Ghi chú vận hành

- `backend/service/main.py` hiện đã dùng import path `backend.service.app:app`, nên chạy từ root repo.
- `backend/service/routes/health.py` sẽ gọi `ping()` tới PostgreSQL và Redis ở mỗi lần check.
- Nếu muốn ghi log file local, bật `LOG_FILE=true`; file sẽ nằm ở thư mục `LOG_DIR`.

## File mới phục vụ local dev

- `backend/.env.example`: mẫu env cho backend chạy trên host machine.
- `devops/.env.example`: biến dùng cho Docker Compose.
- `devops/docker-compose.yml`: khởi động PostgreSQL và Redis local.
