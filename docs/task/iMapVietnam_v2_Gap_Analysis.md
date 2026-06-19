**iMapVietnam v2 — Gap Analysis Report**

So sánh API v1 hiện tại với Platform Spec 2026 · Phạm vi cần chỉnh sửa trước MVP

**Chú thích trạng thái:**

| Có sẵn | Đổi tên | Chưa có | Cần clarify |
| :---: | :---: | :---: | :---: |

# **1\. API Routes — Hiện có vs Spec**

*Các endpoint hiện có trong v1 và trạng thái so với spec Section 4.2*

| Method | V1 hiện tại | Spec muốn | Trạng thái | Ghi chú |
| :---- | :---- | :---- | ----- | :---- |
| **GET** | /enterprises | /api/v1/orgs | **Đổi tên** | Đổi prefix \+ tên resource |
| **POST** | /enterprises | — (tách thành /claim) | **Đổi tên** | POST create → dùng claim flow riêng |
| **GET** | /enterprises/{id} | /api/v1/orgs/{id} | **Đổi tên** | Đổi prefix |
| **GET** | /enterprises/search | — (gộp vào GET /orgs) | **Đổi tên** | Spec dùng query params, không route riêng |
| **GET** | /enterprises/featured | — (không đề cập) | **Cần clarify** | Cần confirm còn cần không |
| **GET** | /enterprises/{id}/quick | — (không đề cập) | **Cần clarify** | Cần confirm merge vào /orgs/{id} |
| **GET** | /enterprises/{id}/radar | — (không đề cập rõ) | **Cần clarify** | Có thể là phần health report summary |
| **POST** | /enterprises/import | — (ingestion script) | **Cần clarify** | Spec coi là internal script, không API public |
| **POST** | /enterprises/self-registration | /api/v1/orgs/{id}/claim | **Đổi tên** | Spec gọi là claim, không self-registration |
| **GET** | /map/enterprises | /api/v1/map/pins | **Đổi tên** | Đổi tên \+ trả GeoJSON tối ưu |
| **GET** | /stats/overview | /api/v1/insights/summary | **Đổi tên** | Đổi tên, mở rộng breakdown |
| **GET** | /auth/me | /auth/me | **Có sẵn** |  |
| **POST** | /auth/login | /auth/login | **Có sẵn** |  |
| **POST** | /auth/register | /auth/register | **Có sẵn** |  |
| **POST** | /auth/refresh | /auth/refresh | **Có sẵn** |  |
| **GET** | /assessment/questions | (implied) | **Có sẵn** |  |
| **POST** | /assessment/submit | /api/v1/assessments | **Đổi tên** | Đổi prefix \+ verb |
| **GET** | /assessment/{id}/results | /api/v1/assessments/{id} | **Đổi tên** | Merge results vào chi tiết assessment |
| **GET** | /dashboard/\* | — (không liệt kê rõ) | **Cần clarify** | Có thể gộp vào /insights |
| **GET** | /reports/\* | — (không liệt kê rõ) | **Cần clarify** | DD report đề cập ở Investor Portal |
| **GET** | /certification/directory | — (không liệt kê rõ) | **Cần clarify** | Taxonomy của cert types |
| **GET** | /news, /iid/\* | — (static/CMS) | **Cần clarify** | Spec coi là static pages, không API |
| **GET** | /taxonomies/\* | — (implied) | **Có sẵn** | Internal, không thay đổi |
| **GET** | /health | — (infra) | **Có sẵn** | Không liên quan spec |

## **2\. Endpoints chưa có — cần build thêm**

*Theo spec Section 4.2 — chưa có trong v1*

| Method | Endpoint | Auth | Mô tả |
| :---- | :---- | :---- | :---- |
| **GET** | **/api/v1/orgs/{id}/full** | Investor/Donor JWT | Full Impactonomy scores, domain breakdown, trend data |
| **POST** | **/api/v1/orgs/{id}/claim** | DN JWT | Bắt đầu claim process, verify email ownership |
| **PATCH** | **/api/v1/assessments/{id}** | DN JWT | Auto-save draft responses mỗi 30s |
| **GET** | **/api/v1/assessments/{id}** | DN JWT | Chi tiết assessment của DN (score, responses, domain) |
| **POST** | **/api/v1/evidence** | DN JWT | Upload evidence file (multipart), link với criterion |
| **GET** | **/api/v1/dataset** | Donor JWT | Export cohort data theo filter, max 10,000 rows |
| **GET** | **/api/admin/queue** | Admin JWT | Review queue: pending claims, evidence, cert approvals |
| **POST** | **/api/admin/orgs/{id}/score** | Admin JWT | Override score với reason — ghi audit\_log bắt buộc |
| **POST** | **/api/admin/certifications** | Admin JWT | Issue cert: set star\_rating, certified\_at, expires\_at |

# **3\. Schema — Columns cần thêm vào bảng hiện có (DONE)**

*Các column spec yêu cầu nhưng chưa chắc đã có — verify lại với DBeaver trước khi migrate*

| Bảng | Column | Type | Mô tả |
| :---- | :---- | :---- | :---- |
| **organizations** | **slug** | VARCHAR(200) UNIQUE | URL-friendly slug cho /dn/\[slug\] |
| **organizations** | **status** | ENUM (3 values) | unregistered | registered | certified |
| **organizations** | **star\_rating** | SMALLINT NULL | NULL cho unregistered/registered, 3/4/5 cho certified |
| **organizations** | **ai\_tags** | TEXT\[\] | Tags loại hình: \[DNXH, IB, KNST, ESG, KTTH\] |
| **organizations** | **sdg\_tags** | SMALLINT\[\] | SDG numbers 1–17 |
| **organizations** | **ai\_composite\_score** | DECIMAL(5,2) | 0–39 (capped cho unregistered) |
| **organizations** | **certified\_at** | TIMESTAMPTZ |  |
| **organizations** | **expires\_at** | TIMESTAMPTZ | Trigger renewal workflow |
| **assessments** | **module** | ENUM | DNXH | IB | KNST | ESG | KTTH |
| **assessments** | **version** | VARCHAR(10) | Track khi methodology update |
| **assessments** | **responses** | JSONB | {question\_id: {answer, evidence\_grade, notes}} |
| **assessments** | **domain\_scores** | JSONB | {A: 75.5, B: 60.2, ...} |
| **assessments** | **final\_score** | DECIMAL(5,2) | Sau khi IID review |
| **assessments** | **maturity\_level** | SMALLINT | 1–5 (Aware/Commit/Act/Verify/Lead) |

## **4\. Bảng mới cần tạo (DONE)**

| Tên bảng | Mục đích | Phase |
| :---- | :---- | :---- |
| **evidence\_items** | Quản lý documents upload từ DN | Phase 2 — Certified pathway |
| **ai\_scoring\_jobs** | Track batch AI scoring với Claude API | MVP 1 — AI Scoring Service |
| **audit\_log** | Append-only, RLS-protected, immutable | MVP 0 — Critical cho trust moat |
| **annual\_updates** | 1 row mỗi DN mỗi năm — Annual Renewal | Phase 2 — Renewal system |

## **5\. Columns renewal cần thêm vào bảng organizations (DONE)**

*Phase 2 — cần trước khi build annual renewal workflow (Phần 6 của spec)*

| Column | Type | Mô tả |
| :---- | :---- | :---- |
| **renewal\_deadline** | DATE | Luôn là 31/3 của năm renewal |
| **grace\_deadline** | DATE | Luôn là 30/6 \= renewal\_deadline \+ 90 ngày |
| **renewal\_status** | ENUM | not\_started | in\_progress | submitted | under\_review | approved | expired |
| **renewal\_year** | SMALLINT | Năm renewal hiện tại |
| **last\_renewed\_at** | TIMESTAMPTZ | Lần cuối renew thành công |
| **renewal\_streak** | SMALLINT | Số năm renew liên tiếp — signal chất lượng cho investor |
| **renewal\_reminder\_sent** | TEXT\[\] | Track emails đã gửi, tránh gửi trùng |

# **6\. Feature gaps — Logic & behavior còn thiếu**

*Không chỉ là endpoint hay column — là behavior cần implement*

| Tính năng | Trạng thái | Mô tả chi tiết |
| :---- | :---- | :---- |
| **Response envelope** | DONE | Tất cả endpoint phải trả { data, meta, error }. Bỏ success/message fields. |
| **Rate limiting** | Chưa có | 100 req/min (public), 1000 req/min (authenticated) theo spec |
| **Investor JWT role** | Chưa có role này | Cần thêm investor vào JWT payload bên cạnh admin/enterprise |
| **Claim workflow** | Chưa có | Verify email → tạo claim record → notify IID queue → IID approve trong 24–48h |
| **Auto-save draft** | Chưa có | PATCH /assessments/{id} mỗi 30s — critical cho UX mobile |
| **Audit log writes** | Chưa rõ | Mọi thay đổi score/status/evidence phải INSERT audit\_log. Không UPDATE/DELETE. |
| **Score override** | Chưa có | Admin override phải kèm reason bắt buộc \+ ghi audit\_log |
| **Two-person rule** | Chưa có | Cert ★★★★★ cần 2 IID staff approve độc lập qua Temporal.io workflow |
| **Annual renewal crons** | Chưa có | 8 cron jobs theo lịch Q4→Q1→Q2. expire\_certs phải atomic transaction. |
| **GeoJSON /map/pins** | Chưa tối ưu | Chỉ trả id, lat, lng, status, primary\_tag. Không full org object. |

# **7\. Tóm tắt ưu tiên**

| Nhóm | Việc cần làm | Effort | Lý do ưu tiên |
| :---- | :---- | :---- | :---- |
| **Ngay** | Rename /enterprises → /orgs, thêm /api/v1/ prefix, chuẩn hóa response envelope, gộp search vào query params | Thấp — chỉ đổi tên | Làm sớm để tất cả endpoint sau build ra đúng chuẩn ngay, không phải quay lại sửa |
| **MVP** | /map/pins GeoJSON, /insights/summary, /orgs/{id}/full (investor), /orgs/{id}/claim | Trung bình — data có sẵn | Data đã có trong DB, chỉ cần thêm endpoint và query. Giá trị demo cao nhất. |
| **Assessment** | PATCH auto-save draft, GET chi tiết assessment, audit\_log writes cho mọi thay đổi | Trung bình — cần logic mới | Critical cho UX mobile. Audit log là nền tảng trust — cần sớm dù chưa có UI. |
| **Admin** | /admin/queue, /admin/score (với reason), /admin/certifications, two-person rule ★★★★★ | Cao — cần Temporal.io | IID cần để vận hành. Two-person rule cần thiết kế workflow trước khi code. |
| **Phase 2** | evidence upload, dataset export, annual renewal schema \+ crons (8 jobs) | Cao — hệ thống phức tạp | Để sau khi MVP stable. Renewal crons phải atomic transaction — thiết kế kỹ trước khi build. |

