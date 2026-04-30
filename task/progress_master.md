# iMapVietnam Backend Progress

Ngày cập nhật: 2026-04-27

## Update 2026-04-30

- Đã dockerize backend hoàn chỉnh:
  - thêm `backend/Dockerfile`
  - thêm `backend/scripts/docker-entrypoint.sh`
  - mở rộng `devops/docker-compose.yml` với service `backend`
- Backend compose flow hiện:
  - wait `postgres` + `redis`
  - migrate `up`
  - seed taxonomies
  - import organizations từ sample dataset
  - boot FastAPI app
- Backend compose expose host `127.0.0.1:8010` để khớp `fe/.env.example`
- Cập nhật `devops/.env.example`, `backend/.env.example`, `README.md`, `fe/README.md`
- Minimal verification Docker:
  - `docker compose --env-file devops/.env.example -f devops/docker-compose.yml up --build -d`
  - `curl http://127.0.0.1:8010/api/health`


## Trạng thái hiện tại

Backend đã được nối gần đầy đủ cho phần implementable của master plan trên schema thật:

- Foundation + PostGIS + migration framework
- Taxonomy seed + organization import pipeline
- Public catalog/map/stats/dashboard APIs
- Auth + RBAC cơ bản
- Assessment foundation + submissions/results/history
- Certification directory/application/review/upgrade workflow foundation
- News CRUD + IID about/team/partners CMS reads + about write
- Reports catalog + aggregate endpoints + custom analysis workflow

## Phần đã implement

### 1. Foundation + data model

- `backend/scripts/migrate.py` + migrations `0001`, `0002`, `0003`
- PostGIS + `pg_trgm`
- Core taxonomy tables
- Organization core tables + import audit tables
- Application domain tables:
  - `users`
  - `organization_user_links`
  - `user_sessions`
  - `assessment_*`
  - `certification_*`
  - `reports`, `report_*`
  - `custom_analysis_*`
  - `news_articles`
  - `cms_pages`
  - `iid_team_members`
  - `iid_partners`

### 2. Taxonomy + import

- Taxonomy seed từ `dataEng.json` + sheet `Danh mục`
- Seed assumptions:
  - `impact_entity_types`
  - `sdgs`
  - `certification_levels`
  - `user_roles`
- Import JSON production-ready:
  - validate/normalize fields
  - taxonomy alias mapping EN/VI/code
  - dedupe theo `tax_code`, fallback `registered_name`
  - upsert organization/contact/location/link tables

### 3. Public enterprise + map + dashboard

- `GET /api/taxonomies`
- `GET /api/taxonomies/{taxonomy_name}`
- `GET /api/enterprises`
- `GET /api/enterprises/search`
- `GET /api/enterprises/{id}`
- `GET /api/enterprises/{id}/quick`
- `GET /api/enterprises/{id}/radar`
- `GET /api/enterprises/featured`
- `GET /api/map/enterprises`
- `GET /api/stats/overview`
- `GET /api/dashboard/by-province`
- `GET /api/dashboard/by-sector`
- `GET /api/dashboard/by-organization-type`
- `GET /api/dashboard/growth`
- `GET /api/dashboard/impact-flows`

Dashboard/reports foundation hiện reuse:

- shared filter semantics theo taxonomy `code`
- aggregate cache pattern qua Redis
- generic dashboard breakdown query theo dimension

### 4. Auth + RBAC

- `POST /api/auth/register`
- `POST /api/auth/login`
- `POST /api/auth/logout`
- `POST /api/auth/refresh`
- `GET /api/auth/me`

Behavior hiện tại:

- password hashing dùng PBKDF2
- access/refresh token ký HMAC
- refresh rotate session và revoke session cũ
- RBAC dependency `require_roles(...)`
- enterprise register có thể link organization qua `tax_code`

### 5. Assessment foundation

- `GET /api/assessment/questions`
- `POST /api/assessment/submit`
- `GET /api/assessment/{enterpriseId}/results`
- `GET /api/assessment/{enterpriseId}/history`

Implementation hiện tại:

- question bank/config schema generic
- scoring engine generic theo question type
- snapshot kết quả để enterprise radar/public reads dùng lại
- chưa hardcode 5 pillars formula từ IID

### 6. Certification workflow foundation

- `GET /api/certification/directory`
- `GET /api/certification/{enterpriseId}`
- `POST /api/certification/apply`
- `PUT /api/certification/{id}/review`
- `PUT /api/certification/{id}/upgrade`

Implementation hiện tại:

- apply/review/upgrade/state history chạy trên DB thật
- directory đọc từ current certification record
- level taxonomy dùng `basic`, `verified`, `gold`
- review/upgrade là admin-driven, chưa có rubric business tự động

### 7. Content + CMS

- `GET /api/news`
- `POST /api/news`
- `PUT /api/news/{id}`
- `DELETE /api/news/{id}`
- `GET /api/iid/about`
- `GET /api/iid/team`
- `GET /api/iid/partners`
- `PUT /api/iid/about`

### 8. Reports + custom analysis

- `GET /api/reports`
- `GET /api/reports/{id}`
- `GET /api/reports/{id}/download`
- `POST /api/reports`
- `GET /api/reports/province`
- `GET /api/reports/sector`
- `GET /api/reports/due-dil`
- `GET /api/reports/sroi`
- `POST /api/reports/custom-request`
- `GET /api/reports/custom-request`
- `PUT /api/reports/custom-request/{id}`

Implementation hiện tại:

- report metadata/catalog/access policy/logging
- aggregate report endpoints reuse organization/dashboard foundation
- `sroi` trả scaffold raw signals, không tự bịa formula
- custom analysis có create/list/update/status history

## Phần generic/scaffold, chưa phải business-final

- Assessment scoring là generic engine, chưa phải official IID 5-pillars formula
- Certification workflow chạy được nhưng rubric level vẫn admin-driven
- `featured` enterprises hiện dùng curated flag/admin-managed, không có ranking algorithm
- `enterprise radar` đọc score snapshot nếu có, chưa tự suy luận score khác
- Reports hiện là metadata + aggregate workflow + download reference, chưa có generation/storage engine hoàn chỉnh
- IID team/partners hiện có read endpoints; chưa có write endpoints vì không nằm trong scope master plan ưu tiên của sprint này

## Assumptions đang dùng

- `impact_entity_type` chỉ seed taxonomy `SE/SIB/IB`, không auto-classify
- `sdgs` chỉ seed taxonomy 1-17, chưa auto-map organization
- `star_rating` nullable, không tự tính
- `organization_locations.location_precision` để `unknown` nếu chưa có geocode thật
- Public filters nhận taxonomy `code`, không nhận free-text label
- Search query dưới 2 ký tự bị reject với `422`
- Map endpoint chỉ coi record là mappable khi có `geom` `POINT` hợp lệ
- Overview/breakdown cache key dùng canonical JSON của filter params + hash digest
- Auth assumption theo plan:
  - login bằng email/password
  - enterprise link organization qua `tax_code`
- Assessment assumption:
  - question config quyết định cách normalize score
  - text answers không bị chấm điểm tự động
- Certification assumption:
  - level taxonomy chỉ là directory taxonomy + workflow input
  - review/upgrade không tự suy luận level từ assessment
- Reports assumption:
  - download endpoint trả storage/download reference hiện có
  - `sroi` chỉ trả raw cohort signals khi chưa có formula IID

## Minimal verification đã chạy

- `backend/.venv/bin/python -m compileall backend/domain backend/service backend/scripts`
- `docker compose --env-file devops/.env.example -f devops/docker-compose.yml up -d`
- `env PG_HOST=127.0.0.1 PG_PORT=5432 PG_DATABASE=imap PG_USER=postgres PG_PASSWORD=postgres backend/.venv/bin/python -m backend.scripts.migrate up`
- `env PG_HOST=127.0.0.1 PG_PORT=5432 PG_DATABASE=imap PG_USER=postgres PG_PASSWORD=postgres backend/.venv/bin/python -m backend.scripts.seed_taxonomies`
- `env PG_HOST=127.0.0.1 PG_PORT=5432 PG_DATABASE=imap PG_USER=postgres PG_PASSWORD=postgres backend/.venv/bin/python -m backend.scripts.import_organizations --dataset-path docs/iMapVN/Data/Sample-iMap-Json/dataEng.json`
- `env PG_HOST=127.0.0.1 PG_PORT=5432 PG_DATABASE=imap PG_USER=postgres PG_PASSWORD=postgres backend/.venv/bin/python -m backend.scripts.import_organizations --dataset-path backend/tests/fixtures/enterprise_catalog_dataset.json`
- Boot app thật trên `127.0.0.1:8008`
- Smoke representative flows đã pass:
  - `GET /api/health`
  - `GET /api/dashboard/by-organization-type`
  - `GET /api/dashboard/growth`
  - `GET /api/dashboard/impact-flows`
  - `GET /api/enterprises/featured`
  - `GET /api/enterprises/1/quick`
  - `GET /api/enterprises/1/radar`
  - `GET /api/news`
  - `GET /api/iid/about`
  - `GET /api/iid/team`
  - `GET /api/iid/partners`
  - `POST /api/auth/login`
  - `POST /api/auth/refresh`
  - `GET /api/auth/me`
  - `POST /api/auth/logout`
  - `POST /api/news`
  - `PUT /api/news/{id}`
  - `DELETE /api/news/{id}`
  - `GET /api/assessment/questions`
  - `POST /api/assessment/submit`
  - `GET /api/assessment/{enterpriseId}/results`
  - `GET /api/assessment/{enterpriseId}/history`
  - `POST /api/certification/apply`
  - `GET /api/certification/{enterpriseId}`
  - `PUT /api/certification/{id}/review`
  - `PUT /api/certification/{id}/upgrade`
  - `GET /api/certification/directory`
  - `POST /api/reports`
  - `GET /api/reports`
  - `GET /api/reports/{id}`
  - `GET /api/reports/{id}/download`
  - `GET /api/reports/province`
  - `GET /api/reports/sector`
  - `GET /api/reports/due-dil`
  - `GET /api/reports/sroi`
  - `POST /api/reports/custom-request`
  - `GET /api/reports/custom-request`
  - `PUT /api/reports/custom-request/{id}`

## Phần chưa verify sâu

- Chưa chạy full unittest/regression suite sau sprint breadth-first này
- Chưa có auth matrix test đầy đủ cho role/public/premium/admin
- Chưa có assessment scoring regression cho từng question type/config combination
- Chưa có certification workflow edge-case test matrix
- Chưa có report/custom-analysis contract regression matrix
- Chưa có performance/load verification cho dashboard aggregates + Redis cache

## Blocker thật còn lại

- Chưa có dataset production đầy đủ trong repo để verify breadth trên data thật lớn
- Chưa có geocode/backfill chuẩn từ IID cho map coverage production
- Chưa có business rules cuối cho:
  - `SE/SIB/IB classification`
  - `star_rating`
  - `SDG mapping`
  - `5 pillars scoring`
  - `certification rubric`
  - `SROI formula`
- Chưa có storage integration/business workflow chi tiết cho report binary generation và file uploads thực

## Bước tiếp theo nên làm

- Chạy stabilization pass tập trung vào contract/regression/auth matrix/workflow edge cases cho toàn bộ module vừa implement; chi tiết backlog ở `task/stabilization_backlog.md`.
