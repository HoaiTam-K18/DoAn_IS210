-- Bảng LoaiVT
INSERT INTO LoaiVT (TenLVT) VALUES ('Vật liệu xây dựng');
INSERT INTO LoaiVT (TenLVT) VALUES ('Gỗ, ván ép');
INSERT INTO LoaiVT (TenLVT) VALUES ('Nhựa, cao su');
INSERT INTO LoaiVT (TenLVT) VALUES ('Nội thất');
INSERT INTO LoaiVT (TenLVT) VALUES ('Linh kiện cơ khí');
INSERT INTO LoaiVT (TenLVT) VALUES ('Linh kiện điện tử');
INSERT INTO LoaiVT (TenLVT) VALUES ('Thiết bị điện tử');
INSERT INTO LoaiVT (TenLVT) VALUES ('Thiết bị gia dụng');
INSERT INTO LoaiVT (TenLVT) VALUES ('Máy móc công nghiệp');
INSERT INTO LoaiVT (TenLVT) VALUES ('Nhiên liệu');
INSERT INTO LoaiVT (TenLVT) VALUES ('Hóa chất');
INSERT INTO LoaiVT (TenLVT) VALUES ('Nông nghiệp, sinh học');
INSERT INTO LoaiVT (TenLVT) VALUES ('Vật tư đóng gói');
INSERT INTO LoaiVT (TenLVT) VALUES ('Đồ bảo hộ');
INSERT INTO LoaiVT (TenLVT) VALUES ('Đồ may mặc');
INSERT INTO LoaiVT (TenLVT) VALUES ('Thuốc men');
INSERT INTO LoaiVT (TenLVT) VALUES ('Dụng cụ y tế');
INSERT INTO LoaiVT (TenLVT) VALUES ('Thực phẩm đông lạnh, đóng hộp');
INSERT INTO LoaiVT (TenLVT) VALUES ('Hàng tiêu dùng');
INSERT INTO LoaiVT (TenLVT) VALUES ('Văn phòng phẩm');
COMMIT;

-- Bảng VatTu
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Xi măng PCB40 ALLYBUILD bao 50kg', 1, 90000, 99000, 1000, 2);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Gạch 4 lỗ Tuynel BCMC 1 viên', 1, 3500, 4000, 7500, 2);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Ván ép sợi MDF TDK FURNI 12mm', 2, 200000, 220000, 200, 1);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Nhựa PVC Đồng Lợi 1220x2440mm 3mm', 3, 900000, 950000, 2000, 2);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Bồn cầu Clara CT-118SS 1 chiếc', 4, 8000000, 8200000, 100, 1);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Sofa Hưng Phát H-8276B 1 chiếc', 4, 12500000, 12900000, 150, 1);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Bulong inox Tiến Thành M20x45 1 chiếc', 5, 22767, 22898, 5000, 2);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Lò xo Torsion MISUMI 1 chiếc', 5, 2677, 2800, 10000, 2);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Dây điện đơn cứng bọc PVC - CV 1x10 1 mét', 6, 47143, 49500, 600, 2);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Công tắc nguồn KCD4-201N-B 1 chiếc', 6, 23000, 25000, 860, 2);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Điện thoại iPhone 16e 128GB 1 chiếc', 7, 16590000, 16990000, 500, 2);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Máy in Epson L3250 1 chiếc', 7, 4090000, 4890000, 300, 1);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Quạt Điều Hòa Paveden PAC-158U 1 chiếc', 8, 3000000, 3250000, 1000, 2);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Máy khoan động lực Bosch GSB 16RE 1 chiếc', 9, 1579000, 1714000, 230, 1);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Gas Sài Gòn Petro 12kg', 10, 455000, 515000, 100, 1);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Sơn Nippon Spot Less 5 lít', 11, 670000, 693000, 420, 1);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Hạt giống ớt đỏ Hàn Quốc 10 hạt', 12, 30000, 30600, 190, 1);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Thùng carton FSC 40x30x30cm M90', 13, 9800, 10000, 30000, 2);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Quần áo bảo hộ lao động AV02 1 bộ', 14, 190000, 230000, 660, 2);
INSERT INTO VatTu (TenVT, MaLVT, DonGiaNhap, DonGiaXuat, SoLuong, TrangThai) VALUES ('Áo Parka Chống Tia UV Bỏ Túi NANO Design 1 chiếc', 15, 784000, 800000, 310, 1);
COMMIT;

-- Bảng NhaCungCap
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty TNHH ALLYBUILD Minh Mẫn');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty Cổ Phần VLXD Và Khoáng Sản Bình Thuận');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Kho Gỗ TDK FURNI');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty Cổ phần Thiết Bị Và Dịch Vụ Đồng Lợi');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty Cổ phần Kiến trúc Kisato');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty TNHH Nội Thất Hưng Phát Sài Gòn');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty TNHH Công Nghiệp Phụ Trợ Tiến Thành');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty TNHH MISUMI Việt Nam');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty CP Công Nghiệp G7 Vina');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty CP Linh Kiện Việt Nam');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty TNHH Một Thành Viên CNTT Thế Giới Di Động');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty CP Thương Mại - Dịch Vụ Phong Vũ');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty TNHH Cao Phong ');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty TNHH Một Thành Viên Thương Mại Kết Nối Tiêu Dùng');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty TNHH Thương Mại Và Dịch Vụ Bếp Gas Bình Minh');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty TNHH Sơn Tavaco');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Hạt giống HFSeeds');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty TNHH Công Nghệ Bao Bì Giấy Tiến Phát');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty TNHH Sản Xuất Thương Mại Và Xuất Nhập Khẩu An Việt');
INSERT INTO NhaCungCap(TenNCC) VALUES ('Công ty TNHH UNIQLO Việt Nam');
COMMIT;

-- Bảng KhachHang
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Nguyễn Văn An', 0905123456);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Trần Thị Bích', 0916789123);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Lê Văn Cường', 0923456789);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Phạm Thị Dung', 0934567890);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Hoàng Văn Em', 0945678901);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Đặng Thị Phượng', 0956789012);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Ngô Văn Dũng', 0967890123);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Bùi Thị Hạnh', 0978901234);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Trịnh Văn Lộc', 0989012345);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Vũ Thị Minh', 0990123456);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Đoàn Văn Khải', 0906234567);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Lương Thị Lan', 0917345678);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Tạ Văn Minh', 0928456789);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Trương Thị Ngọc', 0939567890);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Phan Văn Đức', 0940678901);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Huỳnh Thị Phúc', 0951789012);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Cao Văn Hiếu', 0962890123);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Đỗ Thị Hồng', 0973901234);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Trần Văn Sang', 0984012345);
INSERT INTO KhachHang(TenKH, SDT) VALUES ('Lý Thị Trang', 0995123456);
COMMIT;

-- Bảng NhanVien
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Huỳnh Nguyên Ðan', TO_DATE('2021-05-18', 'YYYY-MM-DD'), 9000000, 'KeToan', 'huynhnguyendan', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Lê Văn Hùng', TO_DATE('2020-09-20', 'YYYY-MM-DD'), 13200000, 'KeToan', 'levanhung', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Phạm Minh Tú', TO_DATE('2023-02-05', 'YYYY-MM-DD'), 11700000, 'NhapXuat', 'phamminhtu', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Trần Minh Hoài Tâm', TO_DATE('2020-06-10', 'YYYY-MM-DD'), 25000000, 'NhapXuat', 'tranminhhoaitam', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Đặng Thị Lan', TO_DATE('2019-11-30', 'YYYY-MM-DD'), 19200000, 'NhapXuat', 'dangthilan', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Lê Phước Cấp', TO_DATE('2018-06-02', 'YYYY-MM-DD'), 7100000, 'NghiemThu', 'lephuoccap', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Đỗ Quang Liêm', TO_DATE('2017-04-17', 'YYYY-MM-DD'), 10600000, 'NhapXuat', 'doquangliem', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Nguyễn Quốc Trung', TO_DATE('2020-10-29', 'YYYY-MM-DD'), 25000000, 'NhapXuat', 'nguyenquoctrung', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Hoàng Thị Ánh Vân', TO_DATE('2023-09-10', 'YYYY-MM-DD'), 15200000, 'NhapXuat', 'hoangthianhvan', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Lương Sĩ Diệt', TO_DATE('2022-12-23', 'YYYY-MM-DD'), 84000000, 'NhapXuat', 'luongsidiet', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Hoàng Xuân Độ', TO_DATE('2019-07-03', 'YYYY-MM-DD'), 69000000, 'NghiemThu', 'hoangxuando', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Nguyễn Minh Tuấn', TO_DATE('2021-01-15', 'YYYY-MM-DD'), 25000000, 'NghiemThu', 'nguyenminhtuan', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Đỗ Tâm Nhuận', TO_DATE('2023-08-12', 'YYYY-MM-DD'), 6500000, 'NhapXuat', 'dotamnhuan', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Trương Quang Hậu', TO_DATE('2027-05-09', 'YYYY-MM-DD'), 15300000, 'KeToan', 'truongquanghau', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Đinh Thị Thanh Uyên', TO_DATE('2020-01-05', 'YYYY-MM-DD'), 11700000, 'NghiemThu', 'dinhthithanhuyen', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Đào Thúy Quyên', TO_DATE('2018-08-18', 'YYYY-MM-DD'), 8100000, 'KeToan', 'daothuyquyen', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Đặng Đình Nhâm', TO_DATE('2016-03-02', 'YYYY-MM-DD'), 9500000, 'NhapXuat', 'dangdinhnham', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Luong Đức Huân', TO_DATE('2022-11-22', 'YYYY-MM-DD'), 17600000, 'NghiemThu', 'luongduchuan', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Lê Kiều Ý', TO_DATE('2019-10-23', 'YYYY-MM-DD'), 7500000, 'NhapXuat', 'lekieuy', '123');
INSERT INTO NhanVien(TenNV, NgayVaoLam, Luong, ChucVu, TenDangNhap, MatKhau) VALUES ('Phan Vĩnh Hùng', TO_DATE('2017-05-07', 'YYYY-MM-DD'), 7300000, 'NghiemThu', 'phanvinhhung', '123');

COMMIT;

-- Bảng NhaVanChuyen
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Công ty Vận tải Hoàng Long', '0905123456');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Vận chuyển Siêu Tốc', '0916789123');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Giao hàng 24h', '0923456789');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Chuyển phát nhanh Việt Nam', '0934567890');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Dịch vụ vận chuyển Á Châu', '0945678901');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('VietExpress Logistics', '0956789012');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Tân Cảng Shipping', '0967890123');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('EMS Quốc Tế', '0978901234');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Giao hàng tiết kiệm', '0989012345');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Vận chuyển Bắc Nam', '0990123456');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Công ty Vận tải An Phát', '0906234567');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Dịch vụ ship hàng ABC', '0917345678');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Vận tải nhanh Đông Nam', '0928456789');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Chuyển hàng Toàn Quốc', '0939567890');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Nhà xe Minh Phát', '0940678901');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Vận tải Thành Đạt', '0951789012');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Công ty vận tải Việt Phát', '0962890123');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Dịch vụ vận tải Hưng Thịnh', '0973901234');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Nhà xe Hoàng Hà', '0984012345');
INSERT INTO NhaVanChuyen(TenNVC, SDT_DaiDien) VALUES ('Giao hàng Công Nghệ', '0995123456');
COMMIT;

-- Bảng GiaoDich
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Nhap', TO_DATE('2017-02-27', 'YYYY-MM-DD'), 1, 2);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Xuat', TO_DATE('2017-06-03', 'YYYY-MM-DD'), 2, 3);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Nhap', TO_DATE('2017-12-17', 'YYYY-MM-DD'), 3, 4);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Nhap', TO_DATE('2018-01-29', 'YYYY-MM-DD'), 4, 5);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Xuat', TO_DATE('2018-03-22', 'YYYY-MM-DD'), 5, 6);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Xuat', TO_DATE('2018-09-11', 'YYYY-MM-DD'), 6, 7);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Nhap', TO_DATE('2019-07-08', 'YYYY-MM-DD'), 7, 8);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Xuat', TO_DATE('2019-11-28', 'YYYY-MM-DD'), 8, 9);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Xuat', TO_DATE('2020-05-09', 'YYYY-MM-DD'), 9, 10);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Nhap', TO_DATE('2020-10-18', 'YYYY-MM-DD'), 10, 11);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Xuat', TO_DATE('2021-04-04', 'YYYY-MM-DD'), 11, 12);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Nhap', TO_DATE('2021-08-11', 'YYYY-MM-DD'), 12, 13);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Nhap', TO_DATE('2022-06-19', 'YYYY-MM-DD'), 13, 14);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Xuat', TO_DATE('2022-07-23', 'YYYY-MM-DD'), 14, 15);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Nhap', TO_DATE('2022-11-13', 'YYYY-MM-DD'), 15, 16);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Xuat', TO_DATE('2023-04-15', 'YYYY-MM-DD'), 16, 17);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Xuat', TO_DATE('2023-12-02', 'YYYY-MM-DD'), 17, 18);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Nhap', TO_DATE('2024-02-15', 'YYYY-MM-DD'), 18, 19);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Nhap', TO_DATE('2024-07-17', 'YYYY-MM-DD'), 19, 20);
INSERT INTO GiaoDich (LoaiGD, ThoiGian, MaNVC, MaNV) VALUES ('Xuat', TO_DATE('2024-12-30', 'YYYY-MM-DD'), 20, 1);

COMMIT;

-- Bảng CT_Nhap
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (1, 18, 893, 18);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (1, 17, 435, 17);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (3, 4, 953, 4);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (3, 15, 741, 15);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (3, 10, 945, 10);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (4, 2, 880, 2);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (4, 16, 48, 16);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (7, 13, 762, 13);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (7, 14, 1492, 14);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (10, 8, 130, 8);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (10, 15, 356, 15);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (12, 9, 545, 9);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (12, 7, 792, 7);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (12, 4, 667, 4);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (13, 2, 890, 2);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (13, 5, 944, 5);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (15, 17, 1109, 17);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (15, 4, 399, 4);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (18, 10, 992, 10);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (18, 8, 590, 8);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (18, 12, 97, 12);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (19, 9, 1390, 9);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (19, 8, 311, 8);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (19, 1, 335, 1);
INSERT INTO CT_Nhap (MaGD, MaVT, SL, MaNCC) VALUES (19, 2, 127, 2);
COMMIT;

-- Bảng CT_Xuat
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (2, 4, 351, NULL, 14);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (2, 11, 433, NULL, 14);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (2, 12, 602, NULL, 14);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (5, 11, 820, NULL, 6);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (6, 17, 748, NULL, 3);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (6, 9, 41, NULL, 3);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (8, 6, 772, NULL, 9);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (8, 16, 598, NULL, 9);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (9, 20, 177, NULL, 13);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (9, 7, 719, NULL, 13);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (9, 10, 166, NULL, 13);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (11, 14, 23, NULL, 2);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (11, 5, 473, NULL, 2);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (11, 11, 84, NULL, 2);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (11, 16, 194, NULL, 2);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (14, 12, 764, NULL, 20);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (14, 2, 53, NULL, 20);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (16, 19, 862, NULL, 10);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (16, 1, 604, NULL, 10);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (16, 4, 729, NULL, 10);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (17, 13, 67, NULL, 17);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (17, 20, 720, NULL, 17);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (17, 15, 532, NULL, 17);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (20, 7, 486, NULL, 8);
INSERT INTO CT_Xuat (MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (20, 18, 158, NULL, 8);
COMMIT;

-- Bảng LichSuKiemKe
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (10, TO_DATE('2017-02-27', 'YYYY-MM-DD'), 1, 120, 'Tốt');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (8, TO_DATE('2017-06-03', 'YYYY-MM-DD'), 7, 85, 'Hư hỏng nhẹ');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (20, TO_DATE('2017-12-17', 'YYYY-MM-DD'), 3, 95, 'Bình thường');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (7, TO_DATE('2018-01-29', 'YYYY-MM-DD'), 8, 20, 'Cần thay thế');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (5, TO_DATE('2018-03-22', 'YYYY-MM-DD'), 4, 5, 'Hư hỏng nặng');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (20, TO_DATE('2018-09-11', 'YYYY-MM-DD'), 20, 100, 'Bình thường');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (16, TO_DATE('2019-07-08', 'YYYY-MM-DD'), 16, 150, 'Tốt');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (8, TO_DATE('2019-11-28', 'YYYY-MM-DD'), 11, 77, 'Bình thường');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (20, TO_DATE('2020-05-09', 'YYYY-MM-DD'), 16, 0, 'Mất mát');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (12, TO_DATE('2020-10-18', 'YYYY-MM-DD'), 5, 145, 'Tốt');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (9, TO_DATE('2021-04-04', 'YYYY-MM-DD'), 6, 35, 'Hư hỏng nhẹ');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (2, TO_DATE('2021-08-11', 'YYYY-MM-DD'), 10, 90, 'Tốt');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (4, TO_DATE('2022-06-19', 'YYYY-MM-DD'), 15, 0, 'Mất mát');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (6, TO_DATE('2022-07-23', 'YYYY-MM-DD'), 13, 110, 'Bình thường');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (8, TO_DATE('2022-11-13', 'YYYY-MM-DD'), 6, 40, 'Hư hỏng nhẹ');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (19, TO_DATE('2023-04-15', 'YYYY-MM-DD'), 2, 122, 'Tốt');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (19, TO_DATE('2023-12-02', 'YYYY-MM-DD'), 9, 10, 'Hư hỏng nặng');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (13, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 19, 99, 'Bình thường');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (2, TO_DATE('2024-07-17', 'YYYY-MM-DD'), 14, 25, 'Cần thay thế');
INSERT INTO LichSuKiemKe(MaNV, ThoiGian, MaVT, SoLuongConLai, TinhTrang) VALUES (14, TO_DATE('2024-12-30', 'YYYY-MM-DD'), 17, 130, 'Tốt');
COMMIT;

-- Check data cua table
--select * from LoaiVT;
--select * from NhaVanChuyen;
--select * from NhaCungCap;
--select * from KhachHang;
--select * from NhanVien;
-- select * from VatTu;
--select * from GiaoDich;
--select * from LichSuKiemKe;
--select * from LichSuCapNhat;
--select * from CT_Nhap;
--select * from CT_Xuat;