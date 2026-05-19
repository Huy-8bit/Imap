# iMapVietnam API README

Tài liệu này là bản tóm tắt 1 file cho toàn bộ API backend hiện có trong repo.

Mục tiêu:

- giải thích backend đang expose những API nào
- phân biệt public API, authenticated API, admin API
- chỉ rõ API nào ghi dữ liệu vào hệ thống
- note riêng luồng import dữ liệu ban đầu vì hiện tại import chính không đi qua HTTP endpoint

## 1. Tổng quan

- Base URL local mặc định: `http://127.0.0.1:8010`
- Swagger docs local: `http://127.0.0.1:8010/docs`
- Router prefix chung: `/api`

Ví dụ:

- health check: `GET /api/health`
- enterprise list: `GET /api/enterprises`

## 2. Response envelope chung

Phần lớn API trả theo envelope:

```json
{
  "success": true,
  "message": "ok",
  "data": {},
  "meta": {}
}
```

Ghi chú:

- `data`: payload chính
- `meta`: pagination, cache info, filter info, aggregate info
- một số endpoint đơn giản có thể không trả `meta` hoặc `meta=null`

## 3. Auth model

Backend hiện dùng Bearer token:

```http
Authorization: Bearer <access_token>
```

Role đang dùng:

- `public`
- `premium`
- `enterprise`
- `admin`

Một số hành vi quan trọng:

- `POST /api/auth/refresh` sẽ rotate session
- sau khi refresh thành công, access token cũ gắn với session cũ sẽ không còn hợp lệ

## 4. Nhóm API theo module

### 4.1 Health

#### `GET /api/health`

Mục đích:

- kiểm tra backend, PostgreSQL và Redis còn sống hay không

Auth:

- public

Trả về:

- `status`
- `dependencies.postgresql`
- `dependencies.redis`

---

### 4.2 Taxonomies

#### `GET /api/taxonomies`

Mục đích:

- trả toàn bộ taxonomy public để FE build filter/options

Query chính:

- `include_inactive=false|true`

Auth:

- public

#### `GET /api/taxonomies/{taxonomy_name}`

Mục đích:

- trả 1 nhóm taxonomy cụ thể

Taxonomy hiện có:

- `provinces`
- `organization_types`
- `operational_statuses`
- `industry_sectors`
- `environmental_impact_areas`
- `product_types`
- `impact_entity_types`
- `sdgs`
- `certification_levels`
- `user_roles`

Auth:

- public

---

### 4.3 Enterprises

#### `GET /api/enterprises`

Mục đích:

- danh sách doanh nghiệp public

Query chính:

- `page`
- `page_size`
- `sort`
- `order`
- `province`
- `operationalStatus`
- `organizationType`
- `primaryIndustrySector`
- `hasPositiveSocialImpact`
- `environmentalImpactArea`

Auth:

- public

#### `POST /api/enterprises`

Mục đích:

- admin tạo mới hoặc upsert 1 organization bằng payload import-compatible

Auth:

- `admin`

Ghi chú:

- reuse đúng pipeline normalize/validate/upsert của import service
- response trả cả `operation` (`inserted` hoặc `updated`) và enterprise detail sau khi ghi DB

#### `GET /api/enterprises/search`

Mục đích:

- tìm kiếm doanh nghiệp theo tên

Query chính:

- `q` bắt buộc
- `page`
- `page_size`

Auth:

- public

#### `POST /api/enterprises/import`

Mục đích:

- admin import nhiều organization qua HTTP

Auth:

- `admin`

Body chính:

- `records`: mảng organization records theo format import hiện có
- `sourceName`: optional
- `dryRun`: optional

Ghi chú:

- `dryRun=true` chỉ validate và trả summary/errors, không ghi DB
- `dryRun=false` sẽ create/update organization thật và ghi audit import run

#### `GET /api/enterprises/featured`

Mục đích:

- danh sách enterprise featured dạng curated

Query chính:

- `limit`

Auth:

- public

#### `GET /api/enterprises/{id}`

Mục đích:

- enterprise detail public-safe

Auth:

- public

#### `GET /api/enterprises/{id}/quick`

Mục đích:

- summary ngắn cho popup/card

Auth:

- public

#### `GET /api/enterprises/{id}/radar`

Mục đích:

- radar/score snapshot gần nhất của enterprise

Auth:

- public

Ghi chú:

- nếu chưa có assessment snapshot thì API vẫn trả structure hợp lệ với dữ liệu rỗng/null

---

### 4.4 Map

#### `GET /api/map/enterprises`

Mục đích:

- trả GeoJSON `FeatureCollection` cho doanh nghiệp có geometry hợp lệ

Query chính:

- `province`
- `operationalStatus`
- `organizationType`
- `primaryIndustrySector`
- `hasPositiveSocialImpact`
- `environmentalImpactArea`
- `bbox=minLng,minLat,maxLng,maxLat`

Auth:

- public

Ghi chú:

- chỉ record có `geom` hợp lệ mới ra `features`
- `meta` có `matched_total`, `mappable_total`, `unmapped_total`, `returned_total`

---

### 4.5 Stats

#### `GET /api/stats/overview`

Mục đích:

- các số aggregate overview cho dashboard

Query chính:

- `province`
- `operationalStatus`
- `organizationType`
- `primaryIndustrySector`
- `hasPositiveSocialImpact`
- `environmentalImpactArea`

Auth:

- public

Ghi chú:

- dùng Redis cache

---

### 4.6 Dashboard

#### `GET /api/dashboard/by-province`

- breakdown theo tỉnh/thành

#### `GET /api/dashboard/by-sector`

- breakdown theo `primaryIndustrySector`

#### `GET /api/dashboard/by-organization-type`

- breakdown theo `organizationType`

#### `GET /api/dashboard/growth`

- growth buckets theo năm thành lập / cohort hiện có trong dữ liệu

#### `GET /api/dashboard/impact-flows`

- ma trận aggregate giữa `primaryIndustrySector` và `environmentalImpactArea`

Query/filter chung:

- `province`
- `operationalStatus`
- `organizationType`
- `primaryIndustrySector`
- `hasPositiveSocialImpact`
- `environmentalImpactArea`

Auth:

- public

Ghi chú:

- các endpoint dashboard đang reuse query/filter/cache foundation của organizations domain

---

### 4.7 Auth

#### `POST /api/auth/register`

Mục đích:

- tạo user mới và trả token

Body chính:

- `email`
- `password`
- `full_name`
- `tax_code`

Auth:

- public

Ghi chú:

- `tax_code` dùng để link enterprise user với organization nếu match

#### `POST /api/auth/login`

Mục đích:

- login và trả access/refresh token

Body chính:

- `email`
- `password`

Auth:

- public

#### `POST /api/auth/logout`

Mục đích:

- revoke session hiện tại

Auth:

- authenticated

#### `POST /api/auth/refresh`

Mục đích:

- rotate refresh/access token

Body chính:

- `refresh_token`

Auth:

- public, nhưng cần refresh token hợp lệ

#### `GET /api/auth/me`

Mục đích:

- trả profile user hiện tại

Auth:

- authenticated

---

### 4.8 Assessment

#### `GET /api/assessment/questions`

Mục đích:

- trả question bank hiện có

Auth:

- public

#### `POST /api/assessment/submit`

Mục đích:

- enterprise submit assessment

Auth:

- `enterprise`

#### `GET /api/assessment/{enterpriseId}/results`

Mục đích:

- lấy kết quả assessment hiện tại

Auth:

- `enterprise` hoặc `premium`

#### `GET /api/assessment/{enterpriseId}/history`

Mục đích:

- lịch sử submission/result

Query chính:

- `page`
- `page_size`

Auth:

- `enterprise` hoặc `premium`

Ghi chú:

- scoring engine hiện generic/config-driven, chưa phải công thức business cuối của IID

---

### 4.9 Certification

#### `GET /api/certification/directory`

Mục đích:

- directory public của doanh nghiệp đã có certification/current status

Query chính:

- `page`
- `page_size`
- `province`
- `organizationType`
- `primaryIndustrySector`
- `certificationLevel`

Auth:

- public

#### `POST /api/certification/apply`

Mục đích:

- enterprise nộp hồ sơ certification

Auth:

- `enterprise`

#### `GET /api/certification/{enterpriseId}`

Mục đích:

- xem current certification + applications/history của enterprise

Auth:

- public

#### `PUT /api/certification/{applicationId}/review`

Mục đích:

- admin review application

Auth:

- `admin`

#### `PUT /api/certification/{certificationId}/upgrade`

Mục đích:

- admin upgrade/update certification hiện tại

Auth:

- `admin`

Ghi chú:

- workflow certification hiện admin-driven
- chưa có rubric business tự động để suy luận level

---

### 4.10 News

#### `GET /api/news`

Mục đích:

- list bài viết news/trends

Query chính:

- `page`
- `page_size`
- `tag`

Auth:

- public

#### `POST /api/news`

Mục đích:

- admin tạo bài news

Auth:

- `admin`

#### `PUT /api/news/{article_id}`

Mục đích:

- admin update bài news

Auth:

- `admin`

#### `DELETE /api/news/{article_id}`

Mục đích:

- admin xoá bài news

Auth:

- `admin`

---

### 4.11 IID CMS

#### `GET /api/iid/about`

- lấy nội dung about IID

#### `GET /api/iid/team`

- lấy danh sách team members

#### `GET /api/iid/partners`

- lấy danh sách partners

Auth:

- 3 API trên là public

#### `PUT /api/iid/about`

Mục đích:

- admin update nội dung about IID

Auth:

- `admin`

---

### 4.12 Reports

#### `GET /api/reports`

Mục đích:

- list báo cáo public

Query chính:

- `page`
- `page_size`
- `category`

Auth:

- public

#### `POST /api/reports`

Mục đích:

- admin tạo report metadata

Auth:

- `admin`

#### `GET /api/reports/{id}`

Mục đích:

- report detail

Auth:

- public

#### `GET /api/reports/{id}/download`

Mục đích:

- trả download/storage reference cho report

Auth:

- public hoặc authenticated tuỳ report premium/public

Ghi chú:

- report premium sẽ check access policy theo role

#### `GET /api/reports/province`

- aggregate report theo tỉnh

#### `GET /api/reports/sector`

- aggregate report theo sector

#### `GET /api/reports/due-dil`

- due diligence aggregate/scaffold

#### `GET /api/reports/sroi`

- scaffold SROI/raw cohort signals

Auth:

- các API aggregate trên là public

#### `POST /api/reports/custom-request`

Mục đích:

- gửi yêu cầu custom analysis

Auth:

- public hoặc authenticated

#### `GET /api/reports/custom-request`

Mục đích:

- admin list custom requests

Auth:

- `admin`

#### `PUT /api/reports/custom-request/{id}`

Mục đích:

- admin update status/quote/note cho custom request

Auth:

- `admin`

---

## 5. API nào ghi dữ liệu vào hệ thống

Đây là các HTTP API dạng write/mutation hiện có:

### Public hoặc semi-public writes

- `POST /api/auth/register`
- `POST /api/auth/login`
- `POST /api/auth/refresh`
- `POST /api/assessment/submit`
- `POST /api/certification/apply`
- `POST /api/reports/custom-request`

### Authenticated writes

- `POST /api/auth/logout`

### Admin writes

- `POST /api/enterprises`
- `POST /api/enterprises/import`
- `PUT /api/certification/{applicationId}/review`
- `PUT /api/certification/{certificationId}/upgrade`
- `POST /api/news`
- `PUT /api/news/{article_id}`
- `DELETE /api/news/{article_id}`
- `PUT /api/iid/about`
- `POST /api/reports`
- `PUT /api/reports/custom-request/{id}`

## 6. API nào để import data vào

Đây là phần quan trọng để tránh nhầm:

Hiện tại backend có **2 đường import/admin ingest qua HTTP**:

- `POST /api/enterprises`
- `POST /api/enterprises/import`

Nhưng backend vẫn **chưa có** HTTP endpoint riêng cho:

- migrate schema
- seed taxonomies
- bulk import taxonomy/master data ngoài organizations

### Data import ban đầu và bootstrap hệ thống vẫn đi qua CLI/scripts

Các entry point import/seed chính là:

#### `python -m backend.scripts.migrate up`

Mục đích:

- apply schema migrations

#### `python -m backend.scripts.seed_taxonomies`

Mục đích:

- seed taxonomy từ docs/sample data

#### `python -m backend.scripts.import_organizations --dataset-path <path>`

Mục đích:

- import organizations từ dataset JSON

### Docker bootstrap cũng đang gọi import path này

Khi chạy backend bằng Docker Compose, entrypoint hiện làm:

1. migrate
2. seed taxonomies
3. import organizations
4. start app

Tức là:

- import organizations thủ công từ admin UI/HTTP đã có thể đi qua `POST /api/enterprises` hoặc `POST /api/enterprises/import`
- nhưng bootstrap dữ liệu nền của môi trường vẫn đi qua **script/bootstrap**

### Nếu cần “import data qua API” sau này

Hiện repo chưa có endpoint đó. Nếu muốn làm sau, nên tách riêng:

- admin-only import endpoint
- async job/queue cho import lớn
- audit log cho từng run
- dry-run mode

## 7. Nhóm API public cho FE

Các API FE public có thể dùng ngay:

- `GET /api/health`
- `GET /api/taxonomies`
- `GET /api/taxonomies/{taxonomy_name}`
- `GET /api/enterprises`
- `POST /api/enterprises`
- `GET /api/enterprises/search`
- `POST /api/enterprises/import`
- `GET /api/enterprises/featured`
- `GET /api/enterprises/{id}`
- `GET /api/enterprises/{id}/quick`
- `GET /api/enterprises/{id}/radar`
- `GET /api/map/enterprises`
- `GET /api/stats/overview`
- `GET /api/dashboard/by-province`
- `GET /api/dashboard/by-sector`
- `GET /api/dashboard/by-organization-type`
- `GET /api/dashboard/growth`
- `GET /api/dashboard/impact-flows`
- `GET /api/news`
- `GET /api/iid/about`
- `GET /api/iid/team`
- `GET /api/iid/partners`
- `GET /api/reports`
- `GET /api/reports/{id}`
- `GET /api/reports/province`
- `GET /api/reports/sector`
- `GET /api/reports/due-dil`
- `GET /api/reports/sroi`
- `GET /api/certification/directory`
- `GET /api/certification/{enterpriseId}`
- `GET /api/assessment/questions`

## 8. Nhóm API cần auth

### Enterprise

- `POST /api/assessment/submit`
- `GET /api/assessment/{enterpriseId}/results`
- `GET /api/assessment/{enterpriseId}/history`
- `POST /api/certification/apply`

### Admin

- `PUT /api/certification/{applicationId}/review`
- `PUT /api/certification/{certificationId}/upgrade`
- `POST /api/news`
- `PUT /api/news/{article_id}`
- `DELETE /api/news/{article_id}`
- `PUT /api/iid/about`
- `POST /api/reports`
- `GET /api/reports/custom-request`
- `PUT /api/reports/custom-request/{id}`

## 9. Ghi chú vận hành

- source of truth cho API routes hiện tại nằm trong `backend/service/routes/`
- filter semantics của enterprise/map/stats/dashboard dùng taxonomy `code`
- import dữ liệu ban đầu hiện không phải HTTP workflow
- nếu onboarding team mới, nên đọc thêm:
  - `README.md`
  - `task/progress_master.md`
  - `task/backend_docker_handoff.md`
