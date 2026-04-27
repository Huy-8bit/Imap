**iMapVietnam v2.0**

Backend Requirements Document

Tài liệu Yêu cầu Chức năng Backend

Phiên bản 1.0 | IID \- Institute for Innovation and Development

# **1\. Tổng quan hệ thống**

iMapVietnam v2.0 là nền tảng số trung tâm cho hệ sinh thái doanh nghiệp tác động xã hội tại Việt Nam. Backend cần hỗ trợ đầy đủ các module: Trang chủ, Bản đồ tác động, Impact Dashboard, Impactonomy, Dịch vụ & Báo cáo, và Về IID.

**Các thành phần kỹ thuật cốt lõi:**

* RESTful API (hoặc GraphQL) phục vụ frontend React  
* PostgreSQL / PostGIS cho dữ liệu địa lý  
* Authentication & Authorization theo vai trò (Public / Premium / Admin / Enterprise)  
* Hệ thống chứng nhận Impactonomy Mark (3 tầng: Basic / Verified / Gold)

# **2\. Phân tích yêu cầu theo từng Module**

## **2.1. Trang Chủ (HOME)**

### **2.1.1 Hero Section & Impact at a Glance**

| API Endpoint | Mô tả chức năng | Phương thức | Output | Ghi chú |
| ----- | ----- | ----- | ----- | ----- |
| **GET /api/stats/overview** | Trả về 3-4 chỉ số tổng quan: tổng số SE/SIB/IB, tổng tác động, tổng vốn huy động | GET theo operationalStatus, province,organizationType, hasPositiveSocialImpact,environmentalImpactAreas | Trả về big number ví dụ:  { "totalActive": 142, "provincesCount": 28, "socialImpactCount": 89, "envImpactCount": 67 }  | Cache 1h |
| GET /api/enterprises/featured | Danh sách 3-5 doanh nghiệp 5 sao nổi bật cho homepage | GET |  | Kèm tên DN, lĩnh vực |

**Câu hỏi đánh giá cần hỏi lại IID:**

1) **Danh sách 3-5 DN dựa trên số sao: Bảng hỏi danh mục chưa có rating/start fields.**

### **2.1.2 News & Trends**

| API Endpoint | Mô tả chức năng | Phương thức | Output | Ghi chú |
| ----- | ----- | ----- | ----- | ----- |
| GET /api/news | Lấy danh sách tin tức/cập nhật mới nhất (phân trang) | GET | Cần định nghĩa lại | Filter theo tag: policy, funding |
| POST /api/news | Admin tạo bài tin tức mới | POST | Triển khai sau | Yêu cầu role Admin |
| PUT /api/news/:id | Admin cập nhật tin tức | PUT | Triển khai sau | Yêu cầu role Admin |
| DELETE /api/news/:id | Xóa bài tin | DELETE | Triển khai sau | Yêu cầu role Admin |

## **2.2. Bản Đồ Tạo Tác Động**

Module bản đồ chiếm 70% màn hình, yêu cầu hiệu năng cao và hỗ trợ địa lý (PostGIS).

### **2.2.1 Dữ liệu bản đồ & Bộ lọc**

| API Endpoint | Mô tả chức năng | Phương thức | Output | Ghi chú |
| ----- | ----- | ----- | ----- | ----- |
| **GET /api/map/enterprises** | Trả về tọa độ \+ metadata tất cả DN cho bản đồ (GeoJSON) | GET theo trường province, tradeName, operationalStatus, organizationType, primaryIndustrySector  | Thanh bộ lọc trên sidebar bản đồ  | Hỗ trợ bbox/viewport filtering |
| GET /api/map/enterprises?type=SE,SIB,IB | Lọc theo loại hình doanh nghiệp | GET | Chưa có định nghĩa | Query param |
| GET /api/map/enterprises?rating=3,4,5 | Lọc theo xếp hạng sao (1-5) | GET | Chưa có định nghĩa | Query param |
| GET /api/map/enterprises?sdg=1,2,3 | Lọc theo SDG Goals (1-17) | GET | Chưa có định nghĩa, bảng mẫu chưa phân loại như thế nào là SDG | Multi-value |

**Câu hỏi đánh giá cần hỏi lại IID:**

1) **Doanh nghiệp nổi bật:** Chưa có căn cứ để xác định được DN nổi bật? Dựa vào trường/phân loại nào? Rating?  
2) Chưa có phân loại để xác thực SE/SIB/IB ?

### 

### **2.2.2 Pop-up & Hồ sơ nhanh**

| API Endpoint | Mô tả chức năng | Phương thức | Output | Ghi chú |
| ----- | ----- | ----- | ----- | ----- |
| GET /api/enterprises/:id/quick | Dữ liệu popup: tên, loại, địa chỉ, Radar Chart 5 trụ cột Impactonomy | GET | Triển khai sau | Tối ưu payload nhỏ |
| GET /api/enterprises/:id | Hồ sơ chi tiết đầy đủ của doanh nghiệp | GET | Triển khai sau | Kèm tất cả metrics |
| GET /api/enterprises/:id/radar | Dữ liệu Radar Chart 5 trụ cột (scores) | GET | Triển khai sau | Dùng cho Chart.js |

### **2.2.3 Danh sách dưới bản đồ**

| API Endpoint | Mô tả chức năng | Phương thức | Output | Ghi chú |
| ----- | ----- | ----- | ----- | ----- |
| GET /api/enterprises | Danh sách doanh nghiệp dạng lưới (phân trang, có filter) | GET | Triển khai sau | page, limit, sort |
| GET /api/enterprises/search?q=keyword | Tìm kiếm full-text theo tên/lĩnh vực | GET | Triển khai sau | Full-text search |

## **2.3. Impact Dashboard**

### **2.3.1 National Trends**

| API Endpoint | Mô tả chức năng | Output | Phương thức | Ghi chú |
| ----- | ----- | ----- | ----- | ----- |
| **GET /api/dashboard/growth** | Dữ liệu tăng trưởng số lượng/chất lượng DN theo năm | Số DN thành lập theo từng năm, chia theo status (active/inactive) | GET theo fields: foundedYear \+ operationalStatus | Dùng cho biểu đồ line/bar |
| **GET /api/dashboard/by-sector** | Dữ liệu theo sector để làm ma trận tác động | Đếm DN theo từng ngành (22 ngành) | GET theo field: primaryIndustrySector | Dùng cho ma trận tác động |
| **GET /api/dashboard/by-province** | Dữ liệu theo province để làm ma trận tác động | Đếm DN theo 34 tỉnh thành  | GET theo field: province | Dùng cho ma trận tác động |
| **GET /api/dashboard/impact-flows** | Ma trận/bản đồ luồng tác động giữa các lĩnh vực | ma trận \[ngành × loại tác động môi trường x sector x province x organiztionType\], giá trị \= số DN | GET theo fields: environmentalImpactAreas\[\] \+ primaryIndustrySector \+ province \+ organizationType \+ hasPositiveSocialImpact | Dạng matrix JSON |

**Câu hỏi đánh giá cần hỏi lại IID:**

1) **National Trends**: Biểu đồ tăng trưởng số lượng và chất lượng: Chia theo 2 trường Founded Year \+ Operational Status

\-\> Câu hỏi: Làm sao để biết là tăng trưởng về chất lượng? Chất lượng ở đây là gì? Dựa vào trường gì ở Bảng hỏi nhập liệu (Danh mục)

2) **Impact Flows (Ma trận tác động)**: Hiện tại đang filter theo Ngành kinh tế chủ đạo, Lĩnh vực tác động môi trường, Tỉnh, Loại hình kinh tế và trường Có tác động tới xã hội. (lấy từ Bảng hỏi nhập liệu (Danh mục))  
3) **Pillar Analytics — "5 trụ cột Impactonomy"**: Hiện tại mình chỉ có thể filter theo fields Lĩnh vực tác động môi trường và fields Có tác động tới xã hội dưạ trên Danh mục ở Bảng hỏi, nhưng không đủ căn cứ để xét thêm về “5 trụ cột Impactonomy” Ví dụ: mình research đó là về SIM assessment và fields này là một module riêng biệt. Vậy Schema SIM Assessment trông như thế nào? 5 trụ cột được tính từ fields nào?

### **2.3.2 Pillar Analytics (5 trụ cột Impactonomy) (Cần phân tích thêm)**

| API Endpoint | Mô tả chức năng | Phương thức | Output | Ghi chú |
| ----- | ----- | ----- | ----- | ----- |
| GET /api/dashboard/pillars | Phân tích tổng hợp 5 trụ cột trên toàn hệ sinh thái | GET | Chưa có định nghĩa | Aggregate scores |
| GET /api/dashboard/pillars?sector=education | Phân tích theo lĩnh vực cụ thể | GET | Chưa có định nghĩa | Filter by sector |
| GET /api/dashboard/pillars?province=HCM | Phân tích theo địa phương | GET | Chưa có định nghĩa | Filter by province |

## **2.4. Impactonomy**

### **2.4.1 Authentication & Enterprise Registration**

| API Endpoint | Mô tả chức năng | Phương thức | Output | Ghi chú |
| ----- | ----- | ----- | ----- | ----- |
| POST /api/auth/register | Đăng ký tài khoản doanh nghiệp mới | POST |  | Email verification |
| POST /api/auth/login | Đăng nhập, trả về JWT token | POST |  | Access \+ Refresh token |
| POST /api/auth/logout | Hủy session | POST |  | Blacklist token |
| POST /api/auth/refresh | Làm mới access token | POST |  | Dùng refresh token |
| GET /api/auth/me | Lấy thông tin tài khoản hiện tại | GET |  | Yêu cầu auth |

### **2.4.2 Self-Assessment (SIM Tool)**

| API Endpoint | Mô tả chức năng | Phương thức | Output | Ghi chú |
| ----- | ----- | ----- | ----- | ----- |
| GET /api/assessment/questions | Lấy danh sách câu hỏi tự đánh giá SIM | GET | Chưa được định nghĩa | Theo từng trụ cột |
| POST /api/assessment/submit | Gửi kết quả tự đánh giá | POST | Chưa được định nghĩa | Yêu cầu auth Enterprise |
| GET /api/assessment/:enterpriseId/results | Lấy kết quả đánh giá của DN | GET | Chưa được định nghĩa | Auth required |
| GET /api/assessment/:enterpriseId/history | Lịch sử các lần đánh giá | GET | Chưa được định nghĩa | Track progress |

### **2.4.3 Impactonomy Mark Certification**

| API Endpoint | Mô tả chức năng | Phương thức | Output | Ghi chú |
| ----- | ----- | ----- | ----- | ----- |
| GET /api/certification/directory | Danh sách tất cả DN đã được chứng nhận (có filter) | GET | Chưa được định nghĩa | Public access |
| GET /api/certification/:enterpriseId | Thông tin chứng nhận của một DN cụ thể | GET | Chưa được định nghĩa | Mark level, ngày cấp |
| POST /api/certification/apply | DN nộp hồ sơ xin chứng nhận | POST | Chưa được định nghĩa | Yêu cầu auth Enterprise |
| PUT /api/certification/:id/review | Admin/IID thẩm định và cập nhật trạng thái | PUT | Chưa được định nghĩa | Yêu cầu role Admin |
| PUT /api/certification/:id/upgrade | Nâng cấp Mark level (Basic → Verified → Gold) | PUT | Chưa được định nghĩa | Logic nghiệp vụ |

**Câu hỏi đánh giá cần hỏi lại IID:**  
Phần Self-Assessment: Cổng cho doanh nghiệp tự đánh giá (Login/Register).  
Phần Directory: Danh sách các tổ chức đã đạt chứng nhận.

\-\> Chưa rõ định nghĩa như thế nào?

Self-Assessment — Cổng tự đánh giá  
**Về Login/Register:**  
Schema có id: "ORG001", taxCode: "0109732650", contacts.email — nhưng không có password, role, hay account status. Cần hỏi:  
\- DN đăng ký tài khoản bằng gì làm định danh, email hay taxCode?  
\- DN phải tự đăng ký từ đầu hoàn toàn?  
\- Nếu DN đã có trong dataset (taxCode khớp) thì khi đăng ký có tự động link vào profile sẵn không?

**Về Self-Assessment**:  
Bảng hỏi danh mục đang có: Lĩnh Vực tác động môi trường, Có tác động xã hội không? Ngành kinh tế chủ đạo những field này có phải là input của bài đánh giá không, hay DN phải trả lời lại từ đầu dù data đã có?

**Directory — Danh sách đã đạt chứng nhận**

Chỉ có Tình trạng hoạt động, nhưng không có certification status  
\- "Đã đạt chứng nhận" nghĩa là đã có Impactonomy Mark ở bất kỳ level nào (Basic/Verified/Gold), hay phải từ level cụ thể trở lên mới hiển thị?  
\- Directory chỉ hiện DN đã được IID duyệt, hay cả DN đã tự submit đang chờ duyệt?  
**\- Các DN trong dataset hiện tại (dataEng.json) — có DN nào đã được chứng nhận chưa, hay tất cả đều chưa có Mark?**

## **2.5. Dịch vụ & Báo cáo**

### **2.5.1 Report Store**

| API Endpoint | Mô tả chức năng | Phương thức | Output | Ghi chú |
| ----- | ----- | ----- | ----- | ----- |
| GET /api/reports | Danh mục báo cáo (Local Impact, Sector Analysis, Due Diligence, SROI) | GET | Cần định nghĩa lại | Có preview/thumbnail |
| GET /api/reports/:id | Chi tiết báo cáo, executive summary | GET |  | Public: preview only |
| GET /api/reports/:id/download | Tải báo cáo đầy đủ | GET |  | Yêu cầu Premium |
| POST /api/reports | Admin upload báo cáo mới | POST |  | Yêu cầu role Admin |
| **GET /api/reports/province** | Báo cáo theo địa phương | GET theo province | Trả về tổng hay thông tin các DN theo địa phương | Tổng hay trả về chi tiết từng DN |
| **GET /api/reports/sector** | Báo cáo theo sector | GET theo primaryIndustrySector | Trả về tổng hay thông tin các DN theo ngành kinh tế chủ đạo | Tổng hay trả về chi tiết từng DN |
| **GET /api/reports/due-dil** | Báo cáo theo Due Diligence | GET theo industrySector+province+org\_type | Trả về tổng hay thông tin các DN để thẩm định dự án | Tổng hay trả về chi tiết từng DN |
| **GET /api/reports/sroi** | Báo cáo đo lường SROI (Social Return on Investment) | GET theo primaryIndustrySector \+ environmentalImpactAreas |  |  |

**Câu hỏi đánh giá cần hỏi lại IID:**

1) **Sector**: Có 2 loại sector : primaryIndustrySector  \+ other Sector thì mình filter theo mục nào?  
2) **Request a Custom Analysis**: Form dành riêng cho các Private/Public sectors đặt hàng nghiên cứu riêng \=\> Phần này chưa có bảng nhập liệu. Gợi ý  những field cần hỏi IID:

* Tổ chức đặt hàng cần khai báo những gì? (tên, mã số thuế, loại hình public/private?)  
* Có bao nhiêu loại báo cáo có thể đặt? Có fixed list hay free text?  
* Sau khi submit form, quy trình nội bộ IID xử lý thế nào? Cần track status không?  
* Có cần upload file đính kèm (brief, RFP) không?  
* Thanh toán có tích hợp vào platform không?  
3) Report tổng hợp được quản lý ở đâu?  
* IID tự upload lên platform (cần Admin CMS) → BE tự generate ID \-\> Nên làm theo cách này vì đỡ phải tốn nơi khác quản lý  
* Hay báo cáo lưu ở chỗ khác (Google Drive) và chỉ link vào? → ID có thể là external reference 

### **2.5.2 Custom Analysis Request**

| API Endpoint | Mô tả chức năng | Phương thức | Ghi chú |
| ----- | ----- | ----- | ----- |
| POST /api/reports/custom-request | Gửi yêu cầu đặt hàng nghiên cứu riêng (Private/Public sector) | POST | Form data \+ file upload |
| GET /api/reports/custom-request | Admin xem danh sách yêu cầu | GET | Yêu cầu role Admin |
| PUT /api/reports/custom-request/:id | Cập nhật trạng thái yêu cầu | PUT | Yêu cầu role Admin |

## **2.6. Về IID**

| API Endpoint | Mô tả chức năng | Phương thức | Ghi chú |
| ----- | ----- | ----- | ----- |
| GET /api/iid/about | Tầm nhìn, sứ mệnh, đội ngũ chuyên gia | GET | CMS content |
| GET /api/iid/team | Danh sách thành viên đội ngũ | GET | Kèm ảnh, chức vụ |
| GET /api/iid/partners | Mạng lưới đối tác | GET | Logo, tên, website |
| PUT /api/iid/about | Admin cập nhật nội dung About | PUT | Yêu cầu role Admin |

**Câu hỏi đánh giá cần hỏi lại IID:**

1) Chưa có bảng hỏi nhập liệu cho IID team \-\> Cần IID cung cấp  
2) **Cần phân quyền user để có thể truy cập các chức năng trên, ví dụ Premium được xem mục Dịch Vụ Báo Cáo, User thông thường chỉ xem được mục 2 Impact Dashboard**

iMapVietnam v2.0 — IID Backend Requirements | Phiên bản nội bộ — Không phát hành ra ngoài