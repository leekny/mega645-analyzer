MEGA 6/45 ANALYZER 3.1 — WINDOWS + TỰ CẬP NHẬT

Đây là MÃ NGUỒN dự án Electron, chưa phải file cài đặt .exe đã biên dịch.

TÍNH NĂNG CẬP NHẬT — PHƯƠNG ÁN C
1. Khi mở ứng dụng, phần mềm tự thử tải dữ liệu mới từ nguồn công khai.
2. Có nút cập nhật thủ công trong giao diện.
3. Có tác vụ Windows Task Scheduler để cập nhật mỗi ngày lúc 20:30, chạy nền không mở cửa sổ.
4. Dữ liệu tải về được lưu trong thư mục dữ liệu của ứng dụng. Giao diện hiển thị kỳ cuối trong dữ liệu để người dùng kiểm tra.

LƯU Ý VỀ LỊCH
- Tác vụ nền chỉ chạy khi máy tính bật và tài khoản Windows đã đăng nhập; nếu máy tắt, Windows có thể chạy bù khi máy hoạt động lại.
- Tự cập nhật khi mở ứng dụng vẫn hoạt động độc lập.
- Giờ 20:30 là giờ địa phương của máy tính, đặt sau giờ quay thông thường; có thể sửa trong install_daily_update.ps1 nếu muốn.

CÀI ĐẶT VÀ TẠO FILE EXE
1. Cài Node.js LTS từ https://nodejs.org
2. Giải nén thư mục này.
3. Mở CMD/PowerShell trong thư mục chứa package.json:
   npm install
   npm start
4. Đóng gói bộ cài:
   npm run dist
5. Bộ cài .exe sẽ nằm trong thư mục dist.

BẬT CẬP NHẬT NỀN HẰNG NGÀY
1. Sau khi cài ứng dụng, tìm đường dẫn đến "Mega 6/45 Analyzer.exe".
2. Chạy install_daily_update.bat trong gói mã nguồn.
3. Dán đường dẫn đầy đủ khi được hỏi.
4. Tác vụ sẽ chạy mỗi ngày lúc 20:30. Dùng remove_daily_update.bat để xóa tác vụ.

NGUỒN DỮ LIỆU
Ứng dụng sử dụng tệp JSONL công khai:
https://raw.githubusercontent.com/vietvudanh/vietlott-data/master/data/power645.jsonl
Nguồn là dự án cộng đồng, không phải nguồn chính thức của Vietlott. Có thể chậm cập nhật, thiếu kỳ hoặc thay đổi. Luôn xem ngày/kỳ cuối hiển thị trong ứng dụng. Nếu tải lỗi, có thể nạp tệp thủ công.

THỐNG KÊ
Bộ số được tạo bằng heuristic thử nghiệm, không đảm bảo dự đoán kết quả. Mỗi tổ hợp Mega 6/45 có xác suất Jackpot 1/8.145.060 nếu quay công bằng.


BẢN SỬA LỖI NÚT MỞ DỮ LIỆU ĐÃ LƯU:
- Nút sẽ hiện trạng thái khi đang mở dữ liệu.
- Nếu có lỗi IPC hoặc lỗi đọc tệp, ứng dụng sẽ hiện thông báo thay vì im lặng.


PHIEN BAN 3.2 - THEM TAB LOTTO 5/35
- Có hai tab tách biệt: Mega 6/45 và Lotto 5/35.
- Lotto 5/35 tải dữ liệu riêng từ power535.jsonl; lưu cục bộ ở lotto535_history.jsonl.
- Lotto phân tích tần suất 35 số chính, số đặc biệt 01-12, cặp số chính, kết quả mới nhất và bộ số tham khảo.
- Dữ liệu Lotto không ghi đè dữ liệu Mega.
- Bộ số tham khảo chỉ là phân tích thống kê, không bảo đảm dự đoán kết quả.

Cách chạy thử: npm install, npm start. Đóng gói Windows: npm run dist.


PHIEN BAN 3.2.1: Sua loi hien thi so dac biet Lotto 5/35 tren ket qua ky moi nhat.


GITHUB AUTO-UPDATE (VERSION 3.2.1)
Repository configured: https://github.com/leekny/mega645-analyzer
- The app checks for updates on startup only in the installed/packaged app, not when running with npm start.
- When a newer GitHub Release is published, electron-updater downloads it and offers restart/install.
- GitHub Actions workflow: .github/workflows/release.yml
FIRST RELEASE SETUP:
1. Upload the contents of this source folder to the repository (including .github/workflows/release.yml).
2. Make sure the repository is public, or configure a private-release update strategy before shipping.
3. Commit and push the source to the default branch.
4. Create and push the tag v3.2.1 (this tag must match package.json version 3.2.1). GitHub Actions builds the Windows installer and publishes a Release.
5. Download the generated Mega645-Analyzer-Setup-3.2.1.exe from the Release and install it. This is the first installer with auto-update support.
NEXT RELEASE:
- Increment package.json version (for example 3.2.2), commit/push, create tag v3.2.2. GitHub Actions builds and publishes the update.
- Installed 3.2.1+ apps check GitHub Releases when opened.
Important: the existing 3.1.0 installer does not gain auto-update just by creating a Release; users must install this first auto-update-enabled version once.
