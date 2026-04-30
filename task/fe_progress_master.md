# iMapVietnam Frontend Progress

Ngày cập nhật: 2026-04-30

## Đã implement

### 1. App foundation

- Scaffold mới hoàn chỉnh trong `fe/`
- React + TypeScript + Vite
- React Router route tree cho public, enterprise, reports, about, admin
- TanStack Query cho toàn bộ read flow
- Shared API client với:
  - `VITE_API_BASE_URL`
  - bearer token handling
  - auto refresh qua `/api/auth/refresh`
  - clear session khi auth fail
- Auth context:
  - login/register/logout
  - bootstrap `/api/auth/me`
  - role-aware guards `enterprise` / `admin`
- Shared UI primitives:
  - button
  - card
  - badge
  - field/input/select/textarea
  - loading / empty / error states
  - stat cards
- Global theme/CSS theo hướng clean editorial, xanh / gold / neutral, responsive desktop + mobile

### 2. Public routes

- `/`
  - hero
  - impact at a glance từ `GET /api/stats/overview`
  - featured enterprises từ `GET /api/enterprises/featured`
  - news từ `GET /api/news`
  - module intro cards
  - IID intro từ `GET /api/iid/about`
- `/map`
  - map surface bằng Leaflet
  - sidebar filter theo taxonomy code thật
  - enterprise list đồng bộ filter
  - quick profile panel từ `GET /api/enterprises/{id}/quick`
  - radar preview nếu snapshot renderable
  - province breakdown
  - empty state rõ ràng khi `mappable_total=0`
- `/dashboard`
  - stats overview
  - by province
  - by sector
  - by organization type
  - growth chart
  - impact flows cards
  - pillar analytics placeholder “Đang cập nhật”
- `/enterprises/:id`
  - detail từ `GET /api/enterprises/{id}`
  - radar từ `GET /api/enterprises/{id}/radar`
  - certification status từ `GET /api/certification/{enterpriseId}`
- `/impactonomy`
  - methodology / pipeline summary dựa docs
  - certification tier summary từ directory data thật
  - assessment reality check
  - certification apply form nếu user enterprise
- `/impactonomy/directory`
  - public certification directory + filters
- `/reports`
  - report catalog
  - province/sector aggregate previews
  - due diligence preview
  - SROI raw-signal placeholder
  - custom analysis request form
- `/reports/:id`
  - report detail
  - download action theo access policy thật
- `/about`
  - about IID content
  - team
  - partners

### 3. Auth + enterprise flow

- `/login`
- `/register`
- `/assessment`
  - protected enterprise route
  - load question bank
  - generic question rendering nếu backend có questions sau này
  - current results
  - submission history
  - placeholder khi question bank rỗng

### 4. Minimal admin workspace

- `/admin/news`
  - list
  - create
  - edit
  - delete
- `/admin/reports`
  - list
  - create
- `/admin/custom-requests`
  - list
  - status updates
- `/admin/about`
  - edit about content
- `/admin/certifications`
  - fetch certification detail theo enterprise id
  - review latest application
  - upgrade current certification

## Routes đã xong

- `/`
- `/map`
- `/dashboard`
- `/enterprises/:enterpriseId`
- `/impactonomy`
- `/impactonomy/directory`
- `/login`
- `/register`
- `/assessment`
- `/reports`
- `/reports/:reportId`
- `/about`
- `/admin/news`
- `/admin/reports`
- `/admin/certifications`
- `/admin/custom-requests`
- `/admin/about`

## API đã nối thật

- `GET /api/taxonomies`
- `GET /api/enterprises`
- `GET /api/enterprises/search`
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
- `POST /api/news`
- `PUT /api/news/{id}`
- `DELETE /api/news/{id}`
- `GET /api/iid/about`
- `GET /api/iid/team`
- `GET /api/iid/partners`
- `PUT /api/iid/about`
- `POST /api/auth/register`
- `POST /api/auth/login`
- `POST /api/auth/logout`
- `POST /api/auth/refresh`
- `GET /api/auth/me`
- `GET /api/assessment/questions`
- `POST /api/assessment/submit`
- `GET /api/assessment/{enterpriseId}/results`
- `GET /api/assessment/{enterpriseId}/history`
- `GET /api/certification/directory`
- `GET /api/certification/{enterpriseId}`
- `POST /api/certification/apply`
- `PUT /api/certification/{id}/review`
- `PUT /api/certification/{id}/upgrade`
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

## Degrade gracefully theo trạng thái backend/business

- `featured enterprises`:
  - nếu endpoint rỗng thì render empty state, không fallback âm thầm
- `map`
  - chỉ render marker thật từ geometry
  - hiện local dataset có `mappable_total=0`, nên map page hiển thị overlay empty state
- `impact entity type / SE-SIB-IB`
  - không auto suy luận
  - map filter chỉ ghi chú “coming soon”
- `star rating`
  - chỉ hiển thị nếu field có giá trị
  - không có rating filter public
- `SDG layer`
  - không render vì chưa có API map overlay thật
- `investor layer`
  - không render vì chưa có backend support
- `assessment`
  - local question bank hiện chỉ có 5 pillar placeholder và `questions=[]`
  - FE không bịa SIM questionnaire
- `radar`
  - nếu snapshot có nhưng mọi score `null`, FE báo rõ score chưa business-final
- `pillar analytics`
  - chưa có endpoint aggregate phù hợp, render “Đang cập nhật”
- `SROI`
  - chỉ hiển thị raw signals và message từ backend
- `IID team / partners`
  - nếu endpoint rỗng thì render empty state

## Chưa verify sâu

- Chưa chạy browser automation / E2E
- Chưa verify admin flows bằng admin account thật trong UI vì local seed không cung cấp admin login public sẵn
- Chưa kiểm tra layout từng breakpoint bằng screenshot matrix
- Chưa đo performance bundle hoặc map/dashboard re-render cost
- Chưa xử lý code splitting để giảm warning chunk size của build

## Blocker còn lại

- Dataset local chưa có geometry map thật
- Dataset local chưa có featured enterprises
- Assessment question bank chưa có câu hỏi business-final
- Chưa có pillar analytics endpoint
- Chưa có SROI formula business-final
- IID team/partners local data đang rỗng
- Chưa có admin seed account documented trong repo để UI-verify full admin path

## Next stabilization pass cho FE

- Tách code-splitting cho pages lớn và heavy deps như leaflet/recharts
- Thêm smoke E2E cho login -> assessment -> reports -> logout
- Thêm route-level suspense/skeleton polish
- Tinh chỉnh accessibility cho form controls, keyboard nav, focus states
- Rà soát mobile layout với real devices và fix overflow/spacing
- Chuẩn hóa error copy theo backend error envelope
- Nếu backend bắt đầu có geocode/questions/pillar analytics thật, thay placeholder bằng visualization tương ứng
