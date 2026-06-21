# iMapVietnam — API Flow Diagrams

Tài liệu này mô tả luồng xử lý của từng nhóm API đang có trong hệ thống.

---

## 1. Auth Flows

### 1a. Đăng ký / Đăng nhập

```mermaid
sequenceDiagram
    actor User
    participant FE
    participant BE
    participant DB

    User->>FE: Điền email + password
    FE->>BE: POST /api/auth/register
    BE->>DB: INSERT users (role=enterprise)
    DB-->>BE: user_id
    BE->>DB: INSERT user_sessions
    BE-->>FE: {access_token, refresh_token}
    FE->>FE: Lưu token vào localStorage
    FE-->>User: Redirect → /assessment

    Note over User,DB: Login tương tự nhưng dùng POST /api/auth/login
```

### 1b. Google OAuth

```mermaid
sequenceDiagram
    actor User
    participant FE
    participant Google
    participant BE
    participant DB

    User->>FE: Click "Sign in with Google"
    FE->>Google: Mở Google Identity popup
    Google-->>FE: Google credential (JWT)
    FE->>BE: POST /api/auth/google {credential}
    BE->>Google: Verify token (aud, iss, exp, email_verified)
    Google-->>BE: Claims hợp lệ
    BE->>DB: Upsert user (tạo mới nếu chưa có, link nếu email trùng)
    BE->>DB: INSERT user_sessions
    BE-->>FE: {access_token, refresh_token}
    FE-->>User: Redirect theo role
```

### 1c. Token Refresh (tự động)

```mermaid
sequenceDiagram
    participant FE
    participant BE
    participant DB

    Note over FE: Access token sắp hết hạn (60s trước)
    FE->>BE: POST /api/auth/refresh {refresh_token}
    BE->>DB: GET user_sessions WHERE session_id
    BE->>BE: Verify hash + check expires_at
    BE->>DB: DELETE session cũ (revoke)
    BE->>DB: INSERT session mới
    BE-->>FE: {access_token mới, refresh_token mới}
    FE->>FE: Cập nhật localStorage
```

### 1d. Setup Admin (một lần duy nhất)

```mermaid
flowchart TD
    A[POST /api/auth/setup-admin] --> B{SETUP_ADMIN_SECRET\nkhớp env?}
    B -- Không --> C[401 Unauthorized]
    B -- Có --> D{Đã có admin\nactive?}
    D -- Có --> E[409 Conflict]
    D -- Chưa --> F[Hash password\nbcrypt]
    F --> G[INSERT users\nrole=admin]
    G --> H[200 OK\n{user_id, email, role}]
    H --> I[Gọi POST /api/auth/login\nđể lấy token]
```

---

## 2. Enterprise Catalog Flows

### 2a. Public List + Search

```mermaid
sequenceDiagram
    actor User
    participant FE
    participant BE
    participant DB as PostgreSQL

    User->>FE: Truy cập catalog / gõ tìm kiếm
    alt Không có query
        FE->>BE: GET /api/v1/orgs?page=1&page_size=20&sort=name
        BE->>DB: SELECT + ORDER + LIMIT/OFFSET
    else Có query (q=...)
        FE->>BE: GET /api/v1/orgs?q=keyword
        BE->>DB: trigram similarity search (pg_trgm)
    end
    DB-->>BE: [{id, display_name, province, sector, ...}]
    BE-->>FE: {data: [...], meta: {total, page, total_pages}}
    FE-->>User: Hiển thị danh sách
```

### 2b. Enterprise Detail Tiers

```mermaid
flowchart LR
    A[Client] -->|Public| B["GET /api/v1/orgs/{id}\nFull detail + classification\n+ contacts + location"]
    A -->|Public| C["GET /api/v1/orgs/{id}/quick\nTóm tắt + radar snapshot\ndùng cho popup/card"]
    A -->|Public| D["GET /api/v1/orgs/{id}/radar\nPillar scores từ\nassessment_result_snapshots"]
    A -->|investor/admin JWT| E["GET /api/v1/orgs/{id}/full\nAI tags, SDG numbers,\nai_composite_score,\ncertified_at, expires_at\n+ assessment snapshot"]
```

### 2c. Self-Registration (Enterprise)

```mermaid
sequenceDiagram
    actor DN as Doanh nghiệp
    participant FE
    participant BE
    participant DB

    DN->>FE: Điền form tự đăng ký
    FE->>BE: POST /api/v1/orgs/self-registration\n(enterprise JWT)
    BE->>BE: normalize + validate fields
    BE->>DB: Tìm org existing (tax_code / registered_name)
    alt Org chưa có
        BE->>DB: INSERT organizations
    else Org đã có
        BE->>DB: UPDATE organizations
    end
    BE->>DB: Upsert location, contacts, sectors
    BE->>DB: INSERT organization_user_links\n(status=active)
    BE-->>FE: {operation, enterprise detail}
    FE->>BE: GET /api/auth/me (reload profile)
    BE-->>FE: Profile với organization đã link
```

---

## 3. Map Flows

### 3a. Dual-mode Map (FE logic)

```mermaid
flowchart TD
    A[User mở MapPage] --> B{Có filter\nđang active?}
    B -- Không --> C[GET /api/v1/map/pins\nLean pins: id+lat+lng+status\nKhông auth, staleTime 5 phút]
    B -- Có --> D[GET /api/map/enterprises\nFull GeoJSON + filter + bbox]
    C --> E[Render tất cả markers\nClick → load quick profile]
    D --> F[Render filtered markers\nPopup có display_name]
    E --> G{User click marker}
    F --> G
    G --> H[GET /api/v1/orgs/{id}/quick\nHiển thị panel bên phải]
```

### 3b. Map Pins vs Map Enterprises

```mermaid
sequenceDiagram
    participant FE
    participant BE
    participant DB

    Note over FE,DB: /api/v1/map/pins — Fast initial load
    FE->>BE: GET /api/v1/map/pins
    BE->>DB: SELECT id, status, ai_tags[1], geom\nFROM organizations o\nINNER JOIN organization_locations ol\nWHERE geom IS NOT NULL
    DB-->>BE: [{geometry, id, status, primary_ai_tag}]
    BE-->>FE: GeoJSON FeatureCollection\n{total: N}

    Note over FE,DB: /api/map/enterprises — Filtered map
    FE->>BE: GET /api/map/enterprises?province=X&bbox=...
    BE->>DB: Complex JOIN với taxonomy\n+ WHERE filter + ST_Intersects bbox
    DB-->>BE: Full feature với display_name, province,\noperational_status, env_impact_areas, ...
    BE-->>FE: GeoJSON FeatureCollection\n{matched_total, mappable_total, ...}
```

---

## 4. Claim Workflow

```mermaid
stateDiagram-v2
    [*] --> pending_verification: DN gọi\nPOST /api/v1/orgs/{id}/claim
    pending_verification --> pending_review: Email verified\n(stub hiện tại: auto)
    pending_review --> approved: Admin approve\nqua Admin Queue
    pending_review --> rejected: Admin reject
    pending_verification --> rejected: Admin reject sớm
    approved --> [*]: org_claims.status = approved\nDN có quyền sở hữu hồ sơ
    rejected --> pending_verification: DN submit lại
    pending_verification --> expired: Quá hạn token
```

```mermaid
sequenceDiagram
    actor DN as Doanh nghiệp
    actor Admin
    participant FE
    participant BE
    participant DB

    DN->>FE: Click "Claim doanh nghiệp này"
    FE->>BE: POST /api/v1/orgs/{id}/claim\n{note} (enterprise JWT)
    BE->>DB: Kiểm tra existing active claim
    alt Đã có claim active
        BE-->>FE: 409 Conflict
    else Chưa có
        BE->>DB: INSERT org_claims\n(status=pending_verification)
        BE-->>FE: {id, org_id, user_id, status}
        Note over BE: TODO: gửi email verification token
    end

    Admin->>FE: Mở /admin/queue
    FE->>BE: GET /api/v1/admin/queue
    BE-->>FE: {pending_claims: [...], total_pending}
    Admin->>FE: Review → Approve / Reject
```

---

## 5. Assessment Flows

### 5a. Legacy Assessment (assessment_submissions)

```mermaid
sequenceDiagram
    actor DN as Doanh nghiệp
    participant FE
    participant BE
    participant DB

    FE->>BE: GET /api/assessment/questions (public)
    BE->>DB: SELECT pillars + questions + options
    BE-->>FE: [{pillar, questions: [{id, type, options}]}]

    DN->>FE: Trả lời từng câu hỏi
    FE->>BE: POST /api/assessment/submit\n{enterpriseId, answers, notes}
    BE->>BE: Score từng câu theo type\n(choice→weight, boolean→0/1, scale→normalize)
    BE->>BE: Tính pillar scores + overall_score
    BE->>DB: INSERT assessment_submissions\n+ assessment_answers\n+ assessment_scores\n+ assessment_result_snapshots
    BE-->>FE: {overall_score, pillars, scoring_version}
```

### 5b. Assessment v2 — Auto-save Draft (assessments table)

```mermaid
sequenceDiagram
    actor DN as Doanh nghiệp
    participant FE
    participant BE
    participant DB

    Note over DN,DB: Assessments table (migration 0007)\nKhác với assessment_submissions (legacy)

    FE->>BE: GET /api/v1/assessments/{id}\n(enterprise/investor/admin JWT)
    BE->>DB: SELECT * FROM assessments WHERE id = ?
    BE-->>FE: {id, org_id, module, status, responses,\ndraft_responses, domain_scores, maturity_level}

    loop Mỗi 30 giây hoặc khi user pause
        FE->>BE: PATCH /api/v1/assessments/{id}\n{draft_responses: {...}}
        BE->>BE: Kiểm tra status == 'draft'
        BE->>DB: UPDATE assessments\nSET draft_responses = ?
        BE-->>FE: Updated AssessmentV2Detail
    end

    Note over DN,FE: Submit chính thức:\nstatus 'draft' → 'submitted'\n(endpoint riêng, chưa implement)
```

---

## 6. Certification Flows

### 6a. DN Apply → Admin Review (legacy flow)

```mermaid
sequenceDiagram
    actor DN as Doanh nghiệp
    actor Admin
    participant BE
    participant DB

    DN->>BE: POST /api/certification/apply\n{requestedLevelCode, note}\n(enterprise JWT)
    BE->>DB: INSERT certification_applications\n(status=submitted)
    BE-->>DN: {application_id, status}

    Admin->>BE: GET /api/v1/admin/queue
    BE->>DB: SELECT pending applications
    BE-->>Admin: {pending_certifications: [...]}

    Admin->>BE: PUT /api/certification/{applicationId}/review\n{action: approve/reject, comment}
    BE->>DB: UPDATE certification_applications.status
    BE->>DB: INSERT certification_reviews
    BE-->>Admin: Updated certification detail
```

### 6b. Admin Issue Certification v2 + Two-Person Rule

```mermaid
flowchart TD
    A[POST /api/v1/admin/certifications/{id}\n{star_rating, notes}] --> B{star_rating == 5?}

    B -- Không 1-4 sao --> C[UPDATE organizations\nstatus=certified, star_rating]
    C --> D[INSERT/UPDATE certifications\nstatus=active, directory_visible=TRUE]
    D --> E[INSERT audit_log\nevent=CERT_ISSUED]
    E --> F[200 OK\n{status: certified, audit_id}]

    B -- Có 5 sao --> G[UPDATE organizations\nstatus=registered temporarily]
    G --> H[INSERT/UPDATE certifications\nstatus=pending_second_approval\nfirst_approver_id=actor]
    H --> I[202 Accepted\n{status: pending_second_approval\nrequires_second_approval: true}]

    I --> J[Admin 2 khác gọi\nPOST /certifications/{id}/approve-second]
    J --> K{actor == first_approver?}
    K -- Có --> L[409 Conflict]
    K -- Không --> M[UPDATE certifications\nstatus=active\nsecond_approver_id=actor2]
    M --> N[UPDATE organizations\nstatus=certified]
    N --> O[INSERT audit_log\nevent=CERT_ISSUED\ntwo_person_rule=true]
    O --> P[200 OK\n{status: certified}]
```

---

## 7. Admin Flows

### 7a. Score Override

```mermaid
sequenceDiagram
    actor Admin
    participant BE
    participant DB

    Admin->>BE: POST /api/v1/admin/orgs/{id}/score\n{score: 28.5, reason: "...10 chars min"}
    BE->>BE: Validate reason length ≥ 10
    BE->>DB: BEGIN TRANSACTION
    BE->>DB: SELECT ai_composite_score FROM organizations (old value)
    BE->>DB: UPDATE organizations SET ai_composite_score = 28.5
    BE->>DB: write_audit_log(\n  event=SCORE_ADJUSTED,\n  old={old_score},\n  new={28.5},\n  reason=...\n)
    DB-->>BE: audit_id
    BE->>DB: COMMIT
    BE-->>Admin: {org_id, old_score, new_score, audit_id}
```

### 7b. Admin Queue

```mermaid
sequenceDiagram
    participant Admin
    participant BE
    participant DB

    Note over Admin,DB: Auto-refresh mỗi 30s trên FE
    Admin->>BE: GET /api/v1/admin/queue
    BE->>DB: SELECT pending org_claims\n(status IN pending_verification, pending_review)
    BE->>DB: SELECT pending certification_applications\n(status IN submitted, in_review)
    BE-->>Admin: {\n  pending_claims: [...],\n  pending_certifications: [...],\n  total_pending: N\n}
```

---

## 8. Insights & Dashboard Flows

```mermaid
flowchart LR
    Client --> A["GET /api/v1/insights/summary\n(có unregistered/registered/certified\ncountdown + Redis cache)"]
    Client --> B["GET /api/stats/overview\n(legacy, tổng hợp chung\n+ Redis cache)"]
    Client --> C["GET /api/dashboard/by-province\nGET /api/dashboard/by-sector\nGET /api/dashboard/by-organization-type\nGET /api/dashboard/growth\nGET /api/dashboard/impact-flows"]

    A --> Cache[(Redis\ncache)]
    B --> Cache
    C --> Cache
    Cache -->|miss| PG[(PostgreSQL\nAggregate queries)]
    Cache -->|hit| Client
    PG --> Cache
```

---

## 9. Rate Limiting (middleware)

```mermaid
flowchart TD
    A[Request đến] --> B{Redis available?}
    B -- Không --> C[Fallback: Allow\nkhông block traffic]
    B -- Có --> D{Có Bearer token?}

    D -- Không --> E[Key: rl:ip:{client_ip}\nLimit: 100 req/min]
    D -- Có --> F[Key: rl:auth:{client_ip}\nLimit: 1000 req/min]

    E --> G[Redis sliding window\nZADD + ZCOUNT\n60 second window]
    F --> G

    G --> H{count > limit?}
    H -- Có --> I[429 Too Many Requests\nRetry-After header]
    H -- Không --> J[Request tiếp tục\nX-RateLimit-Remaining header]
```

---

## 10. Request Lifecycle tổng quát

```mermaid
sequenceDiagram
    participant FE
    participant Nginx
    participant BE as FastAPI
    participant MW as Middleware
    participant Route
    participant DB

    FE->>Nginx: HTTP Request
    Nginx->>BE: Proxy /api/* → backend:8010
    BE->>MW: RateLimitMiddleware\n(Redis sliding window)
    MW->>MW: AccessLogMiddleware\nRequestIdMiddleware
    MW->>Route: Route handler
    Route->>Route: Pydantic validation\n(request params/body)
    Route->>DB: Repository query\n(PostgreSQL)
    DB-->>Route: Result rows
    Route->>Route: Service logic\n+ Schema serialization
    Route-->>BE: ApiEnvelope {data, meta, error}
    BE-->>Nginx: JSON Response
    Nginx-->>FE: HTTP Response
```

---

## Phân quyền theo nhóm

```mermaid
flowchart TD
    Req[API Request] --> Auth{Bearer token?}

    Auth -- Không --> Public[Public endpoints:\nGET /api/v1/orgs\nGET /api/v1/map/pins\nGET /api/v1/insights/summary\nGET /api/dashboard/*\nGET /api/taxonomies\nGET /api/certification/directory\nGET /api/news\nGET /api/iid/*]

    Auth -- Có --> Decode[Decode JWT\n→ role_code]

    Decode --> Enterprise{role == enterprise?}
    Decode --> Investor{role == investor?}
    Decode --> Admin{role == admin?}

    Enterprise --> EntRoutes[POST /api/v1/orgs/{id}/claim\nPATCH /api/v1/assessments/{id}\nPOST /api/assessment/submit\nPOST /api/certification/apply]

    Investor --> InvRoutes[GET /api/v1/orgs/{id}/full\nGET /api/v1/assessments/{id}]

    Admin --> AdminRoutes[Tất cả enterprise + investor routes\n+\nGET /api/v1/admin/queue\nPOST /api/v1/admin/orgs/{id}/score\nPOST /api/v1/admin/certifications/{id}\nPOST /api/news\nPUT /api/iid/about\n+ tất cả write endpoints]
```
