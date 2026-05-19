# Copy vào container
docker compose cp dummy_data_SIBs_1000.json backend:/app/dummy_data_SIBs_1000.json

# Import
docker compose exec backend python -m backend.scripts.import_organizations \
  --dataset-path /app/dummy_data_SIBs_1000.json


# Import SQL

cd backend/db

psql -h localhost -U postgres -d imap -f imap_schema_full.sql
psql -h localhost -p 5432 -U postgres -d postgres

psql -h localhost -U postgres -d imap -f insert_1000_orgs.sql


# Check xem đã vô chưa
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public'
ORDER BY table_name;

# Check dữ liệu khi đã insert
-- tổng số org
SELECT COUNT(*) FROM organizations;

-- check phân bố status
SELECT os.code, COUNT(*) 
FROM organizations o
JOIN operational_statuses os ON os.id = o.operational_status_id
GROUP BY os.code;

-- check phân bố tỉnh thành
SELECT p.display_name_vi, COUNT(*)
FROM organization_locations ol
JOIN provinces p ON p.id = ol.province_id
GROUP BY p.display_name_vi
ORDER BY COUNT(*) DESC;

-- check contacts có đủ không
SELECT 
    COUNT(*) FILTER (WHERE website IS NOT NULL) AS has_website,
    COUNT(*) FILTER (WHERE email IS NOT NULL)   AS has_email,
    COUNT(*) FILTER (WHERE phone IS NOT NULL)   AS has_phone,
    COUNT(*)                                    AS total
FROM organization_contacts;

-- xem 5 org cụ thể với đầy đủ thông tin
SELECT 
    o.external_code,
    o.trade_name,
    ot.code AS org_type,
    os.code AS status,
    p.display_name_en AS province,
    ol.ward_name,
    oc.website,
    oc.phone
FROM organizations o
JOIN organization_types ot ON ot.id = o.organization_type_id
JOIN operational_statuses os ON os.id = o.operational_status_id
LEFT JOIN organization_locations ol ON ol.organization_id = o.id
LEFT JOIN provinces p ON p.id = ol.province_id
LEFT JOIN organization_contacts oc ON oc.organization_id = o.id
LIMIT 5;