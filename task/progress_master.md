# iMapVietnam Backend Progress

Ngày cập nhật: 2026-04-25

## Đã xong trong lượt này

- Hoàn thành public map API trên schema hiện tại:
  - `GET /api/map/enterprises`
  - trả `GeoJSON FeatureCollection` trong `data`
  - reuse filter semantics từ enterprise catalog theo taxonomy `code`
  - hỗ trợ `bbox=minLng,minLat,maxLng,maxLat`
  - chỉ trả feature có `organization_locations.geom` hợp lệ, không fabricate centroid/lat-lng
  - meta public-safe gồm `matched_total`, `mappable_total`, `unmapped_total`, `returned_total`, `bbox`
- Thêm integration test `backend/tests/test_enterprise_map_api.py` verify:
  - GeoJSON structure
  - filter path
  - bbox path
  - unmapped records không bị trả thành feature
  - meta đếm đúng matched/mappable/unmapped/returned

- Hoàn thành public enterprise catalog APIs trên schema mới:
  - `GET /api/enterprises`
  - `GET /api/enterprises/search`
  - `GET /api/enterprises/{id}`
  - filter thật theo `province`, `operationalStatus`, `organizationType`, `primaryIndustrySector`, `hasPositiveSocialImpact`, `environmentalImpactArea`
  - pagination thật
  - sort/order thật cho list endpoint
  - ranked search trên `trade_name` + `registered_name`
  - detail payload public-safe với `general`, `classification`, `contacts`, `location`
- Thêm `EnterpriseCatalogService` + read repository + response schemas rõ ràng.
- Thêm migration `0002_enterprise_catalog_indexes.sql` để tối ưu filter/sort path dùng lại được cho map/dashboard sau này.
- Thêm integration test `backend/tests/test_enterprise_catalog_api.py` chạy trên DB thật + app thật qua `TestClient`.

- Hoàn thành Phase 0 slice khả dụng:
  - đổi Docker PostgreSQL sang `postgis/postgis:16-3.4-alpine`
  - thêm config nền cho cache/JWT/storage/import paths
  - thêm route module mới `GET /api/taxonomies` và `GET /api/taxonomies/{taxonomy_name}`
  - thêm dependency helper cho PostgreSQL/Redis và pagination
- Hoàn thành Phase 0 + Phase 1 schema foundation:
  - thêm SQL migration framework `backend/scripts/migrate.py`
  - thêm migration `0001_enable_postgis_and_core_schema.sql`
  - bật `postgis` + `pg_trgm`
  - tạo bảng taxonomy seed
  - tạo bảng `organizations`, `organization_contacts`, `organization_locations`
  - tạo bảng link `organization_industry_sectors`, `organization_environmental_impacts`, `organization_sdgs`
  - tạo audit tables `organization_import_runs`, `organization_import_errors`, `organization_import_sources`
- Hoàn thành taxonomy seed framework:
  - loader đọc `docs/iMapVN/Data/Sample-iMap-Json/dataEng.json`
  - loader đọc sheet `Danh mục` trong file xlsx để lấy label VI
  - seed thêm taxonomy assumptions đã có trong plan: `impact_entity_types`, `sdgs`, `certification_levels`, `user_roles`
- Hoàn thành organization import pipeline:
  - validate/normalize `tax_code`, `phone`, `email`, `year`, boolean
  - map taxonomy qua alias EN/VI/code
  - dedupe ưu tiên `tax_code`, fallback `registered_name`
  - upsert organization/contact/location/link tables
  - ghi import run + import error + source audit
- Vừa vá bug runtime có sẵn trong skeleton:
  - Redis client không còn truyền `ssl` sai vào plain connection của `redis-py 7`
  - `GET /api/health` hoạt động lại khi chạy stack thật

## Chưa xong

- Chưa có public read APIs còn lại của Phase 2:
  - `GET /api/stats/overview`
  - `GET /api/dashboard/*`
- Chưa có geocode/backfill cho `organization_locations.geom`
- Chưa có auth/assessment/certification/reports/CMS
- Chưa có import từ file xlsx record-level, mới hoàn thành JSON pipeline production-ready trước

## Assumptions đang dùng

- `impact_entity_type` chỉ seed taxonomy `SE/SIB/IB`, không auto-classify.
- `sdgs` chỉ seed taxonomy 1-17, chưa map organization.
- `star_rating` nullable, không tự tính.
- `organization_locations.location_precision` đang để `unknown` nếu chưa có lat/lng/geocode thật.
- `province`/taxonomy matching dùng alias EN + VI + code để chịu được source JSON hiện tại và source nhập liệu Việt hoá.
- `registered_name` có thể fallback từ `trade_name` nếu source không có tên đăng ký nhưng vẫn có ít nhất một tên.
- Public enterprise catalog filters hiện nhận taxonomy `code` đã seed, không nhận free-text display label.
- Search query dưới 2 ký tự hữu ích bị reject với `422` để tránh request mơ hồ/quá ngắn.
- `GET /api/map/enterprises` dùng cùng filter semantics với catalog; `bbox` chỉ giới hạn feature trả về, không đổi `matched_total` và `mappable_total`.
- Map endpoint chỉ coi record là mappable khi `organization_locations.geom` là `POINT` hợp lệ; lat/lng null hoặc geom null thì record nằm ở `unmapped_total`.

## Blocker thật còn lại

- Chưa có source toạ độ hoặc rule geocoding chuẩn từ IID cho dataset production, nên coverage map thực tế vẫn thấp dù API contract đã chạy được.
- Chưa có formula business cho:
  - `SE/SIB/IB classification`
  - `star_rating`
  - `SDG mapping`
  - `5 pillars`
  - `certification rules`
- Dataset production chưa có trong repo; mới verify với sample dataset 1 record.

## Verify đã chạy

- `backend/.venv/bin/python -m unittest backend.tests.test_logs backend.tests.test_taxonomy_seed_loader backend.tests.test_organization_importer backend.tests.test_redis_client`
- `env PG_HOST=127.0.0.1 PG_PORT=5432 PG_DATABASE=imap PG_USER=postgres PG_PASSWORD=postgres REDIS_HOST=127.0.0.1 REDIS_PORT=6379 backend/.venv/bin/python -m unittest backend.tests.test_logs backend.tests.test_taxonomy_seed_loader backend.tests.test_organization_importer backend.tests.test_redis_client backend.tests.test_enterprise_catalog_api`
- `backend/.venv/bin/python -m backend.scripts.seed_taxonomies --dry-run`
- `docker compose --env-file devops/.env.example -f devops/docker-compose.yml up -d`
- `env ... backend/.venv/bin/python -m backend.scripts.migrate up`
- `env ... backend/.venv/bin/python -m backend.scripts.seed_taxonomies`
- `env ... backend/.venv/bin/python -m backend.scripts.import_organizations --dataset-path docs/iMapVN/Data/Sample-iMap-Json/dataEng.json`
- chạy import lần 2 để verify dedupe: `updated_count = 1`, `inserted_count = 0`
- boot app local và smoke test:
  - `curl http://127.0.0.1:8002/api/health`
  - `curl http://127.0.0.1:8002/api/taxonomies/organization_types?include_inactive=false`
- boot app local cho enterprise catalog smoke test:
  - `curl "http://127.0.0.1:8003/api/enterprises?province=ho_chi_minh_city&operationalStatus=active&organizationType=private_enterprise&primaryIndustrySector=manufacturing&hasPositiveSocialImpact=true&environmentalImpactArea=climate_change"`
  - `curl "http://127.0.0.1:8003/api/enterprises/search?q=Catalog%20Alpha&page=1&page_size=5"`
  - `curl "http://127.0.0.1:8003/api/enterprises/2"`
- `env PG_HOST=127.0.0.1 PG_PORT=5432 PG_DATABASE=imap PG_USER=postgres PG_PASSWORD=postgres REDIS_HOST=127.0.0.1 REDIS_PORT=6379 backend/.venv/bin/python -m unittest backend.tests.test_logs backend.tests.test_taxonomy_seed_loader backend.tests.test_organization_importer backend.tests.test_redis_client backend.tests.test_enterprise_catalog_api backend.tests.test_enterprise_map_api`
- cập nhật geometry fixture bằng SQL để verify map path có feature thật:
  - `docker compose --env-file devops/.env.example -f devops/docker-compose.yml exec -T postgres psql -U postgres -d imap -c "UPDATE ..."`
- boot app local cho map smoke test:
  - `curl "http://127.0.0.1:8004/api/map/enterprises?province=ho_chi_minh_city&operationalStatus=active&organizationType=private_enterprise&primaryIndustrySector=manufacturing&hasPositiveSocialImpact=true&environmentalImpactArea=climate_change"`
  - `curl "http://127.0.0.1:8004/api/map/enterprises?bbox=105.80,21.00,105.90,21.08"`
  - `curl "http://127.0.0.1:8004/api/map/enterprises?province=da_nang&organizationType=foreign_invested_enterprise"`
  - `curl "http://127.0.0.1:8004/api/map/enterprises?bbox=106.1,10.7,105.9,10.8"`

## Bước tiếp theo nên làm

- Triển khai `GET /api/stats/overview` với aggregate thật trên schema hiện tại và cache Redis, để mở đường trực tiếp cho dashboard public phase kế tiếp.
