# iMapVietnam Frontend

Frontend app trong `fe/` dùng:

- React 19
- TypeScript
- Vite
- React Router
- TanStack Query
- Leaflet / React Leaflet
- Recharts

## Chạy local

```bash
cd fe
cp .env.example .env
npm install
npm run dev -- --host 127.0.0.1 --port 5173
```

Mặc định app gọi backend tại:

- `VITE_API_BASE_URL=http://127.0.0.1:8010`

Khi build bằng Docker cho server, biến này được truyền từ `devops/.env.server.example`:

- `VITE_API_BASE_URL=http://103.1.236.121`

Để bật Google Sign-In, tạo OAuth Web Client ID trong Google Cloud Console rồi điền cùng một client ID vào:

- `fe/.env`: `VITE_GOOGLE_CLIENT_ID=...`
- `backend/.env` hoặc `devops/.env`: `GOOGLE_CLIENT_ID=...`

Flow khuyến nghị cho local dev:

1. Từ root repo, chạy backend bằng Docker Compose:

```bash
docker compose --env-file devops/.env.example -f devops/docker-compose.yml up --build -d
```

2. Sau khi `curl http://127.0.0.1:8010/api/health` trả `success=true`, start FE local bằng các lệnh ở trên.

Nếu backend chạy port khác, đổi lại biến trên.

## Build

```bash
npm run build
```

## Docker deploy

Compose ở `devops/docker-compose.yml` build `fe/Dockerfile`, serve static bằng nginx ở port 80 và proxy `/api` về backend nội bộ. Với env server hiện tại, frontend public là:

- `http://103.1.236.121`

## Ghi chú

- App dùng API thật, không dựa vào mock data ngoài các empty state tối thiểu để tránh crash.
- Auth dùng access token + refresh token và tự refresh session khi gặp `401/403`.
- Với phần backend/business chưa hoàn tất như map geometry, pillar analytics, assessment questions, team/partners data, app render trạng thái degrade rõ ràng thay vì bịa dữ liệu.
