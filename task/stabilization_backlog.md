# Stabilization Backlog

Ngày tạo: 2026-04-27

## Mục tiêu

Pass này dành riêng cho verification và hardening sau implementation sprint breadth-first. Không thêm feature mới nếu không bị blocker bởi bug/runtime issue.

## 1. Contract + regression suite

- Viết và chạy integration tests cho:
  - auth register/login/refresh/logout/me
  - news CRUD
  - IID about/team/partners
  - dashboard by-organization-type / growth / impact-flows
  - enterprise featured / quick / radar
  - certification apply/review/upgrade/directory/detail
  - reports catalog/detail/download/custom-request
- Rerun toàn bộ regression đã có cho catalog/map/stats/dashboard

## 2. Auth + RBAC hardening

- Verify matrix:
  - public
  - premium
  - enterprise
  - admin
- Verify revoked session không thể dùng lại access token cũ sau refresh/logout
- Verify enterprise user không truy cập enterprise khác
- Verify admin-only endpoints trả `403` đúng contract

## 3. Assessment verification

- Seed fixture question bank có đủ loại:
  - single_choice
  - multi_choice
  - boolean
  - numeric
  - scale
  - text
- Verify scoring normalization và snapshot persistence
- Verify radar endpoint khi:
  - chưa có snapshot
  - có snapshot một phần
  - có nhiều submission history

## 4. Certification verification

- Verify approve/reject/request_changes/comment paths
- Verify application với/không có requested level
- Verify directory visibility, expires_at, status history
- Verify current certification overwrite/upgrade behavior khi review nhiều lần

## 5. Reports verification

- Verify premium access policy và download logging
- Verify aggregate report payloads ổn định với filter combinations
- Verify custom analysis attachment persistence và status history
- Decide contract cho binary download/storage integration tiếp theo

## 6. Data + migration checks

- Re-run migrations từ DB trống
- Verify idempotency của seed/import scripts
- Smoke trên dataset lớn hơn nếu IID cung cấp
- Kiểm tra index/query plans cho dashboard/report aggregates

## 7. Cleanup

- Chuẩn hoá response aliases nếu FE cần camelCase thống nhất
- Review README/API notes để khớp contract thực tế
- Loại bỏ artifact/dev seed dữ liệu không cần thiết trước merge
