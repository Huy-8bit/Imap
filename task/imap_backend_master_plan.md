# iMapVietnam Backend Master Plan

Ngày cập nhật: 2026-04-25

## 1. Mục tiêu

Hoàn thiện backend cho iMapVietnam v2 trên nền `FastAPI + PostgreSQL/PostGIS + Redis` để phục vụ đầy đủ các module:

- Home
- Impact Map
- Impact Dashboard
- Impactonomy
- Reports & Custom Analysis
- IID CMS

Plan này được viết để các AI agent khác có thể dùng ngay làm ngữ cảnh triển khai, không phải đọc lại toàn bộ tài liệu gốc từ đầu.

## 2. Nguồn ngữ cảnh đã dùng

- `README.md`
- `docs/iMapVietnam_BE_Requirements.docx.md`
- `docs/iMapVN/Data/Sample-iMap-Json/*.json`
- `docs/iMapVN/Data/BẢNG HỎI NHẬP LIỆU DỮ LIỆU SIBs (final).xlsx`
- `docs/iMapVN/Data/Guideline - Data Collection for VIEI.docx`

## 3. Snapshot hiện trạng repo

Backend hiện tại mới ở mức skeleton:

- Có `FastAPI app factory`, middleware, error handlers, logging.
- Có PostgreSQL client, Redis client, startup/shutdown lifecycle.
- Có duy nhất route `/api/health`.
- Chưa có migration.
- Chưa có schema domain.
- Chưa có PostGIS.
- Chưa có auth.
- Chưa có import dữ liệu.
- Chưa có business module nào ngoài health check.

Kết luận: repo hiện là nền khung kỹ thuật tốt để bắt đầu, nhưng gần như toàn bộ domain backend vẫn chưa được triển khai.

## 4. Dữ liệu hiện có và ý nghĩa

### 4.1. Dữ liệu JSON mẫu

Trong `docs/iMapVN/Data/Sample-iMap-Json/` hiện có:

- `Sample-iMap-Data.json`
- `dataEng.json`
- các file enum cho `province`, `industrySector`, `organizationType`, `operationalStatus`, `environmentalImpactArea`

Lưu ý: bộ JSON hiện đọc được chỉ có 1 organization mẫu, nên agent không được giả định rằng import pipeline đã được kiểm chứng với dữ liệu production.

Schema tổ chức hiện thấy gồm 2 khối chính:

- `general`
  - `tradeName`
  - `registeredName`
  - `foundedYear`
  - `taxCode`
  - `location.province`
  - `location.ward`
  - `contacts.website`
  - `contacts.email`
  - `contacts.phone`
  - `operationalStatus`
  - `closedYear`
- `classification`
  - `organizationType`
  - `primaryIndustrySector`
  - `otherIndustrySectors` tối đa 3
  - `environmentalImpactAreas` tối đa 4
  - `hasPositiveSocialImpact`
  - `primaryProductType`
  - `otherProductType`

Taxonomy hiện thấy:

- `operationalStatus`: 3 giá trị
- `organizationType`: 4 giá trị
- `industrySector`: 22 giá trị
- `environmentalImpactArea`: 9 giá trị
- `productType`: 2 giá trị
- `province`: 34 giá trị

### 4.2. Bảng hỏi nhập liệu

File `BẢNG HỎI NHẬP LIỆU DỮ LIỆU SIBs (final).xlsx` có 2 sheet:

- `Bảng hỏi`: định nghĩa field đầu vào
- `Danh mục`: danh sách option chuẩn hoá

Những field đầu vào gốc hiện có:

- tên giao dịch
- tên đăng ký kinh doanh
- năm thành lập
- mã số thuế
- tỉnh/thành sau sáp nhập
- xã/phường sau sáp nhập
- website/social
- email
- điện thoại
- tình trạng hoạt động
- năm dừng hoạt động
- loại hình kinh tế
- ngành kinh tế chủ đạo
- tối đa 3 ngành kinh tế khác
- tối đa 4 lĩnh vực tác động môi trường
- có/không có tác động xã hội tích cực
- loại hình sản phẩm chủ đạo
- loại hình sản phẩm khác

### 4.3. Guideline thu thập dữ liệu

Tài liệu guideline cho biết:

- Mã số thuế và số điện thoại cần giữ dạng chuỗi, không thừa khoảng trắng.
- Phường/xã có format chuẩn như `P. Hai Bà Trưng`, `X. Thượng Lâm`.
- Dữ liệu hiện được thu thập từ nguồn public, không phải từ self-service portal.
- Tiêu chí xác định doanh nghiệp tác động xã hội mới ở mức hướng dẫn nghiệp vụ, chưa phải schema hệ thống.

### 4.4. Kết luận dữ liệu

Dữ liệu hiện có đủ để xây backend cho:

- enterprise catalog
- filter/taxonomy
- search
- aggregate dashboard cơ bản

Dữ liệu hiện chưa đủ để suy ra trực tiếp:

- toạ độ bản đồ chính xác
- rating sao 1-5
- phân loại SE/SIB/IB
- SDG mapping
- 5 trụ cột Impactonomy
- user account/password
- certification status/level
- report inventory
- IID team/partner CMS content

## 5. Gap nghiệp vụ bắt buộc phải ghi nhớ

Đây là các khoảng trống có thật trong tài liệu và dataset, agent không được tự “bịa” business logic:

1. Chưa có trường rating hoặc logic 5 sao.
2. Chưa có định nghĩa máy móc để phân loại `SE / SIB / IB`.
3. Chưa có mapping sang SDG.
4. Chưa có công thức cho “quality growth”.
5. Chưa có schema cho 5 trụ cột Impactonomy.
6. Chưa có question bank cho self-assessment.
7. Chưa có account model cho login/register.
8. Chưa có certification status/history trong dataset.
9. Chưa có report storage model hay file source thống nhất.
10. Chưa có dataset cho IID team / partners / about content.
11. Chưa có lat/lng hoặc geometry cho map.

## 6. Giả định mặc định để vẫn triển khai được

Để không chặn tiến độ, plan này dùng các giả định tạm thời sau. Khi IID trả lời khác thì chỉnh lại schema/service tương ứng:

1. Chọn `REST API`, không làm GraphQL ở v1.
2. `PostgreSQL` phải đổi sang `PostGIS` vì module map là core requirement.
3. `Featured enterprises` sẽ là dữ liệu admin-curated, không suy ra tự động.
4. `Star rating` là field nullable do admin/IID quản trị, chưa tự tính.
5. `SE / SIB / IB` sẽ là taxonomy riêng `impact_entity_type`, nullable.
6. `SDG` sẽ là taxonomy nhiều-nhiều, nullable.
7. `Map coordinates` trước mắt hỗ trợ `null geometry`; nếu cần hiển thị sớm thì fallback centroid theo tỉnh và gắn cờ `location_precision`.
8. `Impactonomy pillars` được lưu như score snapshot, chưa tự suy diễn từ dataset gốc.
9. `Certification directory` chỉ public các hồ sơ đã được IID duyệt.
10. `Reports` v1 là metadata + file/link tải xuống, chưa làm report generation engine.
11. `Enterprise account` đăng ký bằng email, có thể link vào organization sẵn có qua `taxCode`.

## 7. Kiến trúc backend mục tiêu

### 7.1. Nguyên tắc

- Giữ `FastAPI`.
- Giữ response envelope hiện có: `success`, `message`, `data`, `meta`.
- Tách `routes -> schemas -> services -> repositories`.
- Tất cả query tổng hợp lớn phải có chiến lược cache.
- Tất cả write flow quan trọng phải có audit trail tối thiểu.
- Tất cả taxonomy phải được chuẩn hoá thành bảng seed riêng.

### 7.2. Cấu trúc code đề xuất

```text
backend/
├── service/
│   ├── app.py
│   ├── config.py
│   ├── routes/
│   │   ├── health.py
│   │   ├── stats.py
│   │   ├── enterprises.py
│   │   ├── map.py
│   │   ├── dashboard.py
│   │   ├── auth.py
│   │   ├── assessment.py
│   │   ├── certification.py
│   │   ├── reports.py
│   │   ├── news.py
│   │   └── iid.py
├── domain/
│   ├── common/
│   ├── taxonomies/
│   ├── organizations/
│   ├── map/
│   ├── dashboard/
│   ├── auth/
│   ├── assessment/
│   ├── certification/
│   ├── reports/
│   ├── news/
│   └── iid/
├── migrations/
├── scripts/
│   ├── seed_taxonomies.py
│   ├── import_organizations.py
│   └── backfill_geocodes.py
└── tests/
    ├── unit/
    ├── integration/
    └── contract/
```

### 7.3. Khuyến nghị thư viện cần bổ sung

- `SQLAlchemy 2.x`
- `Alembic`
- `GeoAlchemy2` hoặc SQL thuần với cột PostGIS
- `pydantic[email]` hoặc `email-validator`
- thư viện JWT
- thư viện hash password
- `python-multipart`
- `pytest`, `httpx`, `pytest-asyncio`

Nếu team muốn giữ `psycopg2` thuần cho repository layer vẫn được, nhưng migration và schema management vẫn phải có.

## 8. Thiết kế dữ liệu mục tiêu

### 8.1. Core taxonomies

Tạo bảng seed:

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

### 8.2. Organization domain

Các bảng chính:

- `organizations`
- `organization_contacts`
- `organization_locations`
- `organization_industry_sectors`
- `organization_environmental_impacts`
- `organization_sdgs`
- `organization_tags`
- `organization_metrics`
- `organization_import_sources`
- `organization_feature_flags`

Field quan trọng trong `organizations`:

- `id`
- `external_code`
- `trade_name`
- `registered_name`
- `tax_code`
- `founded_year`
- `operational_status_id`
- `closed_year`
- `organization_type_id`
- `primary_industry_sector_id`
- `has_positive_social_impact`
- `primary_product_type_id`
- `other_product_type_id`
- `impact_entity_type_id`
- `star_rating`
- `is_featured`
- `source_status`
- `created_at`
- `updated_at`

Field quan trọng trong `organization_locations`:

- `organization_id`
- `province_id`
- `ward_name`
- `full_address`
- `latitude`
- `longitude`
- `geom geometry(Point,4326)`
- `location_precision`
- `geocode_source`

### 8.3. Auth domain

- `users`
- `user_roles`
- `user_sessions` hoặc `refresh_tokens`
- `password_reset_tokens` nếu làm reset password
- `organization_user_links`

### 8.4. Assessment domain

- `assessment_pillars`
- `assessment_questions`
- `assessment_question_options`
- `assessment_submissions`
- `assessment_answers`
- `assessment_scores`
- `assessment_result_snapshots`

### 8.5. Certification domain

- `certification_applications`
- `certification_reviews`
- `certifications`
- `certification_documents`
- `certification_status_history`

### 8.6. Reports domain

- `reports`
- `report_assets`
- `report_access_policies`
- `report_download_logs`
- `custom_analysis_requests`
- `custom_analysis_attachments`
- `custom_analysis_status_history`

### 8.7. CMS domain

- `news_articles`
- `cms_pages`
- `iid_team_members`
- `iid_partners`

## 9. API scope theo mức ưu tiên

### 9.1. P0 phải có sớm

- `GET /api/stats/overview`
- `GET /api/map/enterprises`
- `GET /api/enterprises`
- `GET /api/enterprises/search`
- `GET /api/enterprises/:id`
- `GET /api/enterprises/:id/quick`
- `GET /api/enterprises/:id/radar`
- `GET /api/dashboard/growth`
- `GET /api/dashboard/by-sector`
- `GET /api/dashboard/by-province`
- `GET /api/dashboard/impact-flows`
- taxonomy endpoints nội bộ/public nếu FE cần populate filter

### 9.2. P1 public content

- `GET /api/enterprises/featured`
- `GET /api/news`
- `GET /api/iid/about`
- `GET /api/iid/team`
- `GET /api/iid/partners`

### 9.3. P1 auth và enterprise portal

- `POST /api/auth/register`
- `POST /api/auth/login`
- `POST /api/auth/logout`
- `POST /api/auth/refresh`
- `GET /api/auth/me`

### 9.4. P2 assessment

- `GET /api/assessment/questions`
- `POST /api/assessment/submit`
- `GET /api/assessment/:enterpriseId/results`
- `GET /api/assessment/:enterpriseId/history`
- `GET /api/dashboard/pillars`

### 9.5. P2 certification

- `GET /api/certification/directory`
- `GET /api/certification/:enterpriseId`
- `POST /api/certification/apply`
- `PUT /api/certification/:id/review`
- `PUT /api/certification/:id/upgrade`

### 9.6. P2 reports

- `GET /api/reports`
- `GET /api/reports/:id`
- `GET /api/reports/:id/download`
- `POST /api/reports`
- `GET /api/reports/province`
- `GET /api/reports/sector`
- `GET /api/reports/due-dil`
- `GET /api/reports/sroi`
- `POST /api/reports/custom-request`
- `GET /api/reports/custom-request`
- `PUT /api/reports/custom-request/:id`

### 9.7. P2 admin CMS

- `POST /api/news`
- `PUT /api/news/:id`
- `DELETE /api/news/:id`
- `PUT /api/iid/about`

## 10. Roadmap thực thi

### Phase 0: Foundation

Mục tiêu: dựng xương sống để các phase sau không phải làm lại.

Việc cần làm:

- Chuyển Docker/PostgreSQL sang image hỗ trợ PostGIS.
- Thêm migration system.
- Chuẩn hoá config cho DB, JWT, file storage, cache TTL.
- Tạo base module structure cho domain/routes.
- Tạo dependency helpers: DB session/client, auth dependency, pagination/filter parsing.
- Tạo test harness cho API/integration.
- Thêm seed command framework.

Definition of done:

- App boot được với PostGIS và Redis.
- Có migration đầu tiên.
- Có test chạy được trong CI/local.
- Có route registry cho các module mới dù chưa hoàn thiện business logic.

### Phase 1: Data model + taxonomy + import

Mục tiêu: biến tài liệu dữ liệu thành schema thật trong DB.

Việc cần làm:

- Thiết kế ERD cho organization + taxonomy + import audit.
- Seed tất cả taxonomy từ sheet `Danh mục` và JSON enum.
- Viết script import từ JSON/xlsx.
- Dedupe theo `tax_code`, fallback theo `registered_name`.
- Validate format `tax_code`, `phone`, `email`.
- Ghi nhận import errors và import report.
- Chuẩn bị cột geometry/location precision.

Definition of done:

- Có thể import dataset nhiều bản ghi.
- Filter taxonomy hoạt động.
- Search và aggregate có data thật để test.

Rủi ro:

- Dataset thực tế có thể bẩn hơn nhiều so với sample.

### Phase 2: Public catalog + map + dashboard

Mục tiêu: hoàn thành phần public read APIs là lõi của platform.

Việc cần làm:

- `GET /api/stats/overview`
- `GET /api/enterprises/featured`
- `GET /api/map/enterprises`
- `GET /api/enterprises`
- `GET /api/enterprises/search`
- `GET /api/enterprises/:id`
- `GET /api/enterprises/:id/quick`
- `GET /api/enterprises/:id/radar`
- `GET /api/dashboard/growth`
- `GET /api/dashboard/by-sector`
- `GET /api/dashboard/by-province`
- `GET /api/dashboard/impact-flows`

Thiết kế chi tiết:

- `map/enterprises` trả về `GeoJSON FeatureCollection`.
- Hỗ trợ filter theo `province`, `tradeName`, `operationalStatus`, `organizationType`, `primaryIndustrySector`.
- Search dùng full-text trên `trade_name`, `registered_name`, có thể cộng thêm sector.
- Dashboard query lớn phải cache Redis.
- `overview` cache 1 giờ như tài liệu yêu cầu.
- `quick` và `detail` phải tách payload rõ để tối ưu FE.
- `radar` giai đoạn đầu có thể trả `null` hoặc score snapshot nếu assessment chưa có.

Definition of done:

- FE có thể dựng Home hero, map, enterprise listing, popup/detail, dashboard quốc gia.

Blocker thật:

- Chưa có coordinates thật.
- Chưa có 5 pillar formula thật.

### Phase 3: Public content + CMS read

Mục tiêu: bổ sung phần nội dung tĩnh/biên tập.

Việc cần làm:

- `news_articles`
- `cms_pages`
- `iid_team_members`
- `iid_partners`
- public read endpoints cho `news`, `iid/about`, `iid/team`, `iid/partners`

Definition of done:

- FE có dữ liệu để hoàn thành Home news và About IID.

### Phase 4: Auth + RBAC + enterprise linking

Mục tiêu: mở cổng enterprise portal.

Việc cần làm:

- user model + role model
- password hashing
- access token + refresh token
- register/login/logout/refresh/me
- middleware/dependency cho RBAC
- cơ chế link user với organization sẵn có qua `tax_code`
- audit login/session

Definition of done:

- Có phân quyền tối thiểu `public`, `enterprise`, `premium`, `admin`.
- Enterprise user xem được profile của chính mình.

Business assumption:

- Đăng ký bằng email, xác thực và link bằng `tax_code` nếu tìm thấy tổ chức tương ứng.

### Phase 5: SIM assessment + pillars

Mục tiêu: triển khai phần Impactonomy tự đánh giá.

Việc cần làm:

- Thiết kế question bank cho 5 pillars.
- API lấy câu hỏi theo pillar/group.
- API submit kết quả.
- Lưu lịch sử nhiều lần submit.
- Sinh score snapshot cho enterprise.
- Public/private radar data endpoint.
- Dashboard pillars aggregate endpoint.

Definition of done:

- Một enterprise có thể đăng nhập, làm assessment, xem history, xem score mới nhất.

Blocker thật:

- IID chưa cung cấp schema câu hỏi và scoring logic chuẩn.

Hướng xử lý:

- Xây engine generic cho question bank, option weights, scoring formula cấu hình được.

### Phase 6: Certification workflow

Mục tiêu: triển khai Impactonomy Mark.

Việc cần làm:

- directory public
- apply certification
- admin review
- approve/reject/request-changes
- upgrade level
- history + supporting documents
- linking certification với organization profile

Definition of done:

- Admin có thể xử lý hồ sơ chứng nhận end-to-end.
- Public directory chỉ hiện hồ sơ approved.

### Phase 7: Reports + custom analysis

Mục tiêu: hoàn thành business module thương mại hoá nội dung.

Việc cần làm:

- report catalog
- report detail + preview
- gated download theo role
- admin upload/update metadata
- province/sector/due diligence/sroi query endpoints
- custom analysis request form
- admin queue/status update
- file upload handling

Definition of done:

- Premium có thể tải report.
- Admin có thể quản trị report và request.

Business assumption:

- V1 dùng file storage + metadata, không generate report động.

### Phase 8: Hardening

Mục tiêu: đưa hệ thống về trạng thái có thể bàn giao.

Việc cần làm:

- unit test, integration test, API contract test
- seed demo data
- rate limit cho auth/search
- input sanitization
- audit logging
- observability
- performance tuning cho aggregate và map
- backup/migration runbook
- OpenAPI cleanup
- developer docs

Definition of done:

- Có test đủ cho luồng chính.
- Có tài liệu vận hành local/staging.
- Có logging và metric đủ để debug.

## 11. Work breakdown chi tiết cho agent

### Stream A: Foundation + DevOps + migrations

Ownership:

- Docker/PostGIS
- migrations
- settings
- test harness
- base route scaffolding

Phụ thuộc:

- không phụ thuộc stream khác

### Stream B: Taxonomy + organization schema + import

Ownership:

- taxonomy tables
- organization tables
- import scripts
- seed data
- validation rules

Phụ thuộc:

- cần Stream A xong migration foundation

### Stream C: Public enterprise/map/dashboard APIs

Ownership:

- enterprise list/detail/search
- stats overview
- map geojson
- dashboard aggregates
- redis cache policy

Phụ thuộc:

- cần schema/data từ Stream B

### Stream D: Auth + RBAC + enterprise portal

Ownership:

- user/session model
- JWT
- role guards
- auth endpoints
- enterprise account linking

Phụ thuộc:

- chỉ cần Stream A trước, có thể song song tương đối với Stream C

### Stream E: Assessment + certification

Ownership:

- assessment engine
- radar snapshot
- certification workflows

Phụ thuộc:

- cần Stream D và một phần organization schema từ Stream B

### Stream F: Reports + IID CMS + news

Ownership:

- reports
- custom analysis requests
- news CMS
- about/team/partners CMS

Phụ thuộc:

- cần Stream A là đủ để bắt đầu, có thể song song với D và E

### Stream G: QA + contract + documentation

Ownership:

- test matrix
- seed/demo fixtures
- API examples
- handoff docs

Phụ thuộc:

- chạy song song, nhưng hoàn thiện mạnh hơn từ giữa Phase 2 trở đi

## 12. Thứ tự chạy tối ưu cho nhiều AI agent

1. Stream A làm ngay.
2. Khi Stream A chốt migration foundation, tách song song Stream B, D, F.
3. Khi Stream B có schema + import seed, bắt đầu Stream C.
4. Khi Stream D có auth base và Stream B có organization link, bắt đầu Stream E.
5. Stream G bám theo từ Phase 2 để viết contract test, không đợi cuối.

## 13. Danh sách task thực thi đầu tiên

Đây là backlog nên làm ngay, theo đúng critical path:

1. Đổi `postgres` hiện tại sang `postgis/postgis`.
2. Thêm migration framework và migration `0001_initial_extensions` bật `postgis`.
3. Tạo taxonomy tables + seed script từ JSON/xlsx.
4. Tạo organization tables + indexes + full text search vectors.
5. Viết import command cho dataset JSON/xlsx.
6. Tạo public filter/search endpoints cho enterprise list.
7. Tạo map GeoJSON endpoint.
8. Tạo dashboard aggregate endpoints + Redis caching.
9. Tạo auth/register/login/refresh/me/logout.
10. Tạo generic assessment schema để chờ business rules chi tiết.

## 14. API design notes bắt buộc

- Tất cả list endpoints phải có `page`, `pageSize`, `sort`, `order`.
- Multi-filter nên dùng query param lặp hoặc comma-separated, nhưng phải thống nhất một kiểu.
- `map/enterprises` cần hỗ trợ `bbox` hoặc viewport filter.
- Search endpoint phải chống query quá ngắn và có limit.
- Tất cả endpoint aggregate cần cache TTL rõ ràng.
- Admin write endpoints phải kiểm tra role.
- Download report phải log user và report id.

## 15. Indexing và hiệu năng

Tối thiểu cần:

- index `tax_code` unique
- index `trade_name`
- full-text index cho `trade_name`, `registered_name`
- index `province_id`
- index `organization_type_id`
- index `primary_industry_sector_id`
- index `operational_status_id`
- GIN index cho environmental impacts nếu lưu mảng
- GIST index cho `geom`

Redis cache targets:

- `stats_overview`
- dashboard aggregates
- featured enterprises
- filter option payloads

## 16. Bảo mật và phân quyền

Role tối thiểu:

- `public`
- `enterprise`
- `premium`
- `admin`

Luật cơ bản:

- public: xem public catalog/map/dashboard/news/about
- premium: tải report đầy đủ
- enterprise: tự đánh giá, nộp chứng nhận, xem dữ liệu của chính mình
- admin: CRUD nội dung, review chứng nhận, quản trị reports/news/IID pages

## 17. Câu hỏi cần gửi IID

Các câu hỏi này chưa nên biến thành hardcoded logic:

1. Featured enterprise xác định theo field nào?
2. Rating sao lấy từ đâu và có rubric không?
3. Phân loại `SE / SIB / IB` dựa trên field nào?
4. SDG mapping có sẵn hay phải IID nhập tay?
5. “Growth chất lượng” được tính bằng metric nào?
6. 5 pillars Impactonomy gồm câu hỏi nào và công thức score ra sao?
7. Enterprise đăng ký bằng email hay tax code là định danh chính?
8. Nếu tax code đã tồn tại trong dataset thì auto-link profile theo rule nào?
9. Directory chứng nhận hiển thị những trạng thái nào?
10. Có DN nào trong dataset hiện đã có Mark chưa?
11. Reports lưu trên platform hay chỉ link ngoài?
12. Team/partners/about content sẽ do IID nhập tay hay import?
13. Có cần email verification, password reset, hay MFA ngay từ v1 không?
14. Map cần điểm chính xác hay centroid theo tỉnh là chấp nhận được trong giai đoạn đầu?

## 18. Kết luận triển khai

Critical path thật của dự án là:

1. PostGIS + migrations
2. taxonomy + organization schema
3. data import
4. public map/catalog/dashboard
5. auth
6. assessment/certification
7. reports/CMS

Nếu phải cắt phạm vi để ra phiên bản usable sớm, nên chốt `MVP backend` là:

- import dữ liệu tổ chức
- public filters/search/map
- enterprise detail
- stats/dashboard cơ bản
- news/about public read

Sau MVP mới mở auth, assessment, certification, reports.
