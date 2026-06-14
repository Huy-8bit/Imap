2026-08-06
0005 — Thêm vào organizations: status, slug, name_vi/en, AI fields (ai_tags, sdg_numbers, ai_composite_score), cert fields (certified_at, expires_at), URLs. Có luôn function generate_slug() và backfill data cũ.
0006 — Tạo bảng users (email, password hash, role, org link, Google OAuth) + user_sessions để quản lý refresh token. Fix luôn vấn đề 0004 đang reference bảng chưa tồn tại.
0007 — Tạo assessments (JSONB responses, domain scores, maturity level) + evidence_items (S3 url, file type, review workflow). Có constraint bắt buộc reviewer_note khi reject.
0008 — Tạo ai_scoring_jobs (scraping URLs, raw text snapshot, Claude API output, cost tracking). Có unique index đảm bảo mỗi org chỉ có 1 job đang chạy.
0009 — Tạo audit_log với RLS FORCE — không ai UPDATE/DELETE được, kể cả superuser. Có helper function write_audit_log() để gọi từ app code. Đây là file quan trọng nhất.
0010 — Thêm renewal columns vào organizations + tạo annual_updates với đủ 4 sections (A/B/C/D). Có trigger tự động set flagged_for_special_review khi section_d có bất kỳ true nào.