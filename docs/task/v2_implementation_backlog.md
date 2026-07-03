# iMapVietnam v2 — Implementation Backlog

Cross-reference: [iMapVietnam_v2_Gap_Analysis.md](iMapVietnam_v2_Gap_Analysis.md)
Cập nhật: 2026-06-19

---

## Trạng thái tổng quan

| Nhóm | Đã xong | Còn lại |
| :--- | :--- | :--- |
| Schema / DB (migrations 0001–0010) | ✅ | — |
| Response envelope `{data, meta, error}` | ✅ | — |
| `/enterprises` → `/api/v1/orgs` rename | ✅ | — |
| `GET /api/v1/map/pins` GeoJSON tối giản | ✅ | — |
| Endpoints MVP mới | — | 5 endpoints |
| Feature gaps (rate limit, claim, audit, score override, two-person rule) | — | 6 items |
| Phase 2 (evidence upload, dataset export, renewal crons) | — | 3 items |

---

## Phần 1 — Đã hoàn thành ✅

### Schema

| Item | Migration | Ghi chú |
| :--- | :--- | :--- |
| `organizations`: slug, status, ai_tags, sdg_numbers, ai_composite_score, certified_at, expires_at | 0005 | |
| `organizations`: renewal columns (renewal_deadline, grace_deadline, renewal_status, v.v.) | 0010 | |
| `assessments` + `evidence_items` | 0007 | Schema có, chưa có endpoint đầy đủ |
| `ai_scoring_jobs` | 0008 | |
| `audit_log` (RLS FORCE, append-only) | 0009 | Bảng có, app code chưa INSERT |
| `annual_updates` | 0010 | |

### API

| Item | Ghi chú |
| :--- | :--- |
| Response envelope `{data, meta, error}` | `success`/`message` đã xóa khỏi tất cả Envelope classes |
| `/api/v1/orgs` mount | Enterprises router mount ở `/api/v1/orgs` (primary) và `/api/enterprises` (deprecated) |
| Search gộp vào `q` param `GET /api/v1/orgs` | Không còn route `/search` riêng |
| `GET /api/v1/map/pins` | GeoJSON chỉ trả id, lat/lng, status, primary_ai_tag — dùng GIST index sẵn có |

---

## Phần 2 — Còn lại, theo thứ tự ưu tiên

---

### Tier 1 — MVP: data đã có trong DB, endpoint chưa có

#### 1. `GET /api/v1/insights/summary`

Re-mount `/stats/overview` sang prefix `/api/v1/insights` — cùng logic, có thể mở rộng thêm breakdown theo status tier.

**Files cần touch:**

- `service/routes/__init__.py` — thêm `api_router.include_router(stats_router, prefix="/v1/insights")`
- `service/routes/stats.py` — thêm handler `/summary` nếu muốn mở rộng payload (unregistered/registered/certified count riêng)
- `domain/organizations/schemas.py` — thêm `InsightsSummaryEnvelope` nếu payload khác với `StatsOverviewEnvelope`
- Endpoint `/api/stats/overview` giữ nguyên, deprecated

---

#### 2. `GET /api/v1/orgs/{id}/full`

Full Impactonomy profile: assessment scores, domain breakdown, trend data — dành cho Investor/Donor JWT.

**Prerequisite:** Investor JWT role (item 6) phải có trước.

**Files cần touch:**

- `domain/organizations/catalog_repository.py` — thêm `get_org_full()`: JOIN `assessment_result_snapshots`, `evidence_items`, tất cả taxonomy, trend so kỳ trước
- `domain/organizations/schemas.py` — thêm `OrgFullProfile`, `OrgFullEnvelope`
- `domain/organizations/service.py` — thêm `get_org_full()` vào `EnterpriseCatalogService`
- `service/routes/enterprises.py` — thêm handler `GET /{organization_id}/full` với `require_roles("investor", "admin")`

---

#### 3a. `GET /api/v1/assessments/{id}` — re-path + mở rộng response

Merge `/assessment/{id}/results` vào chi tiết assessment đầy đủ (responses JSONB, domain_scores, maturity_level, evidence links).

**Files cần touch:**

- `service/routes/__init__.py` — mount `assessment_router` thêm tại prefix `/v1`
- `service/routes/assessment.py` — thêm handler `GET /v1/assessments/{id}` trả response đầy đủ
- `domain/assessment/` — mở rộng repository query nếu cần join evidence_items
- `domain/assessment/schemas.py` — thêm `AssessmentDetailEnvelope`
- Endpoint `/api/assessment/{id}/results` giữ nguyên, deprecated

#### 3b. `PATCH /api/v1/assessments/{id}` — auto-save draft

FE gọi mỗi 30s, chỉ UPDATE `draft_responses`, không trigger scoring.

**Migration mới cần tạo:**

```sql
-- 0011_assessment_draft.sql
ALTER TABLE assessments
    ADD COLUMN IF NOT EXISTS draft_responses JSONB;
```

**Files cần touch:**

- `migrations/sql/0011_assessment_draft.sql` — migration mới
- `migrations/sql/README.md` — thêm dòng mô tả 0011
- `domain/assessment/repository.py` — thêm `save_draft(assessment_id, draft_responses)`
- `domain/assessment/schemas.py` — thêm `AssessmentDraftInput`
- `service/routes/assessment.py` — thêm handler `PATCH /v1/assessments/{id}`

---

### Tier 2 — Audit integrity + Claim workflow

#### 4. Audit log writes từ app code

Bảng `audit_log` (migration 0009, RLS FORCE, append-only) đã có nhưng app code chưa INSERT vào đó.

**Các event bắt buộc phải ghi:**

| Event | Trigger |
| :--- | :--- |
| `score_override` | Admin ghi đè ai_composite_score |
| `status_change` | Claim approve, cert issue, renewal approve |
| `assessment_submit` | DN submit assessment |
| `evidence_upload` / `evidence_review` | Phase 2 |

**Approach:** Helper function `write_audit_log(cursor, event_type, actor_id, org_id, payload)` gọi trong cùng transaction với main operation — không async, không fire-and-forget.

**Files cần touch:**

- `libs/database/` hoặc `domain/shared/` — mới: `audit.py` chứa helper
- `domain/assessment/service.py` — gắn audit write vào `submit_assessment()`
- `domain/certification/service.py` — gắn vào `review_application()`, `upgrade_certification()`
- Các service mới ở Tier 1-3 khi implement

---

#### 5. `POST /api/v1/orgs/{id}/claim`

Claim workflow: DN verify email → tạo claim record → đẩy vào IID review queue → IID approve trong 24-48h.

**Migration mới cần tạo:**

```sql
-- 0012_org_claims.sql
CREATE TABLE org_claims (
    id BIGSERIAL PRIMARY KEY,
    org_id BIGINT NOT NULL REFERENCES organizations(id),
    user_id BIGINT NOT NULL REFERENCES users(id),
    status TEXT NOT NULL DEFAULT 'pending_verification',
    email_token TEXT UNIQUE,
    submitted_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    verified_at TIMESTAMPTZ,
    reviewed_at TIMESTAMPTZ,
    reviewer_id BIGINT REFERENCES users(id),
    reviewer_note TEXT,
    CHECK (status IN ('pending_verification', 'pending_review', 'approved', 'rejected'))
);
```

**Files cần touch:**

- `migrations/sql/0012_org_claims.sql`
- `migrations/sql/README.md`
- `domain/organizations/` — mới: `claim_repository.py`, `claim_service.py`
- `domain/organizations/schemas.py` — `ClaimEnvelope`, `ClaimInput`
- `service/routes/enterprises.py` — thêm `POST /{organization_id}/claim`
- Email sending: cần quyết định lib/service — hiện chưa có trong stack

**Note:** Self-registration flow hiện có (`POST /api/v1/orgs/self-registration`) giữ nguyên cho đến khi claim workflow được verify trên production.

---

### Tier 3 — Admin tools

#### 6. Investor JWT role

Thêm `investor` vào role enum — prerequisite của `GET /api/v1/orgs/{id}/full` và `GET /api/v1/dataset`.

**Files cần touch:**

- `docs/iMapVN/Data/` — taxonomy seed data: thêm investor vào `user_roles`
- `backend/scripts/seed_taxonomies.py` hoặc seed data JSON
- `domain/auth/schemas.py` — thêm `investor` vào role enum/literal
- `service/dependencies.py` — `require_roles()` đã generic, chỉ cần pass `"investor"` khi dùng

---

#### 7. `GET /api/admin/queue`

Admin review queue: pending claims + pending evidence + pending cert approvals — aggregate từ nhiều bảng.

**Prerequisite:** Claim workflow (item 5).

**Files cần touch:**

- `service/routes/` — mới: `admin.py` với `router = APIRouter(prefix="/admin", tags=["admin"])`
- `service/routes/__init__.py` — register `admin_router`
- `domain/organizations/catalog_repository.py` hoặc mới `admin_repository.py` — query aggregate pending items
- `domain/organizations/schemas.py` — `AdminQueueEnvelope`

---

#### 8. `POST /api/admin/orgs/{id}/score`

Admin override score — `reason` bắt buộc, ghi `audit_log` trong cùng transaction.

**Prerequisite:** Audit log writes (item 4).

**Files cần touch:**

- `service/routes/admin.py` (từ item 7)
- `domain/organizations/repository.py` — thêm `override_score(org_id, score, reason, actor_id)`
- `domain/organizations/schemas.py` — `ScoreOverrideInput`, `ScoreOverrideEnvelope`

---

#### 9. `POST /api/admin/certifications`

Issue certification: set star_rating, certified_at, expires_at — ghi audit_log, xử lý two-person rule cho ★★★★★.

**Prerequisite:** Audit log writes (item 4).

**Files cần touch:**

- `service/routes/admin.py`
- `domain/certification/service.py` — mở rộng hoặc thay `upgrade_certification()`
- `domain/certification/schemas.py` — `CertIssueInput`, `CertIssueEnvelope`

#### 10. Two-person rule ★★★★★

Certification 5 sao cần 2 IID staff approve độc lập.

**Approach tối giản (không cần Temporal.io):**

- `POST /api/admin/certifications` với `star_rating=5` → status = `pending_second_approval`, lưu `first_approver_id`
- `POST /api/admin/certifications/{id}/approve-second` → validate `approver_id != first_approver_id` → issue cert
- Cả 2 approval events ghi vào `audit_log`

**Note:** Thiết kế schema + state machine chi tiết trước khi code. Temporal.io là long-term option nếu workflow phức tạp hơn.

---

### Tier 4 — Rate limiting

#### 11. Rate limiting middleware

100 req/min (public IP), 1000 req/min (authenticated user_id) — Redis đã có trong stack.

**Approach:** Redis sliding window counter — `ZADD` + `ZCOUNT` + `ZREMRANGEBYSCORE`.

**Files cần touch:**

- `libs/http/` — mới: `rate_limit.py`
- `service/app.py` — thêm middleware vào `create_app()`
- `service/config.py` — thêm `RATE_LIMIT_PUBLIC` / `RATE_LIMIT_AUTHENTICATED` env vars

---

### Tier 5 — Phase 2 (sau MVP stable)

#### 12. `POST /api/v1/evidence` — file upload

Upload evidence file (multipart), link với `criterion_id` trong assessment. Schema `evidence_items` đã có (migration 0007).

**Blocking decision cần resolve trước:** Storage provider — local filesystem / S3 / GCS. Hiện chỉ có `FILE_STORAGE_ROOT` env var, chưa có storage client nào trong stack.

#### 13. `GET /api/v1/dataset` — cohort export

Export max 10,000 rows theo filter cho Donor/Investor.

**Prerequisite:** Investor JWT role (item 6).

**Note:** Dùng streaming response (FastAPI `StreamingResponse`) để tránh timeout. Hard limit 10,000 rows bắt buộc.

#### 14. Annual renewal crons (8 jobs)

8 cron jobs theo lịch Q4→Q1→Q2. Schema đã có (migration 0010).

**Blocking decision:** Cron scheduler — hiện chưa có trong stack (options: APScheduler, Celery beat, external cron + HTTP trigger). `expire_certs` phải atomic transaction.

---

## Phần 3 — Cần clarify trước khi quyết định giữ hay xóa

Từ gap analysis Section 1 "Cần clarify" — các endpoint hiện có nhưng spec không đề cập rõ:

| Endpoint | Trạng thái | Quyết định cần |
| :--- | :--- | :--- |
| `GET /api/v1/orgs/featured` | Có sẵn, spec không đề cập | Giữ cho home page hay deprecate? |
| `GET /api/v1/orgs/{id}/quick` | Có sẵn, spec không đề cập | Merge vào `/{id}` hay giữ cho popup/card? |
| `GET /api/v1/orgs/{id}/radar` | Có sẵn, spec nói "implied" | Giữ hay gộp vào `/full` (Tier 1)? |
| `GET /api/dashboard/*` | Có sẵn, gap analysis: "gộp vào /insights" | Confirm với IID: migrate hay giữ song song? |
| `GET /api/reports/*` | Có sẵn, gap analysis: "Investor Portal" | Scope có nằm trong v2 MVP không? |
| `GET /api/certification/directory` | Có sẵn, gap analysis: "taxonomy" | Giữ hay merge vào taxonomy API? |
| `GET /api/news`, `GET /api/iid/*` | Có sẵn, spec coi là static/CMS | Backend API hay chuyển sang headless CMS? |

---

## Phần 4 — Việc đi kèm sau mỗi tier

Những việc này cần làm sau mỗi endpoint mới, không phải optional:

- **Tests**: thêm test file vào `backend/tests/` cho mỗi endpoint mới (follow pattern `test_enterprise_map_api.py`)
- **API docs**: cập nhật `docs/API_README.md` — thêm section tương ứng
- **Migration README**: cập nhật `migrations/sql/README.md` khi có migration 0011+
- **Deprecation**: các endpoint deprecated (`/api/enterprises`, `/api/stats/overview`) — thêm `deprecated=True` vào router include và log warning khi được gọi
