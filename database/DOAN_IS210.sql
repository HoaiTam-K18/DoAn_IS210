-- Tạo bảng LoaiVT
CREATE TABLE LoaiVT (
    MaLVT NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    TenLVT VARCHAR2(100) NOT NULL
);

-- Tạo bảng NhaCungCap
CREATE TABLE NhaCungCap (
    MaNCC NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    TenNCC VARCHAR2(100) NOT NULL
);

-- Tạo bảng KhachHang
CREATE TABLE KhachHang (
    MaKH NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    TenKH VARCHAR2(100) NOT NULL,
    SDT NUMBER(15)
);

-- Tạo bảng NhanVien
CREATE TABLE NhanVien (
    MaNV NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    TenNV VARCHAR2(100) NOT NULL,
    NgayVaoLam DATE,
    Luong NUMBER,
    ChucVu VARCHAR2(50) NOT NULL,
    CONSTRAINT CK_ChucVu CHECK (ChucVu IN ('KeToan', 'NhapXuat', 'NghiemThu'))
);

-- Tạo bảng NhaVanChuyen
CREATE TABLE NhaVanChuyen (
    MaNVC NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    TenNVC VARCHAR2(100) NOT NULL,
    SDT_DaiDien VARCHAR2(15)
);

-- Tạo bảng VatTu
CREATE TABLE VatTu (
    MaVT NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    TenVT VARCHAR2(100) NOT NULL,
    MaLVT NUMBER NOT NULL,
    DonGiaNhap NUMBER NOT NULL,
    DonGiaXuat NUMBER,
    SoLuong NUMBER DEFAULT 0,
    TrangThai NUMBER CONSTRAINT CK_TrangThai CHECK(TrangThai Between 0 and 2),
    CONSTRAINT FK_VatTu_LoaiVT FOREIGN KEY (MaLVT) REFERENCES LoaiVT(MaLVT)
);

-- Tạo bảng GiaoDich
CREATE TABLE GiaoDich (
    MaGD NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    LoaiGD VARCHAR2(10) NOT NULL,
    ThoiGian DATE DEFAULT SYSDATE,
    ThanhTien NUMBER DEFAULT 0,
    MaNVC NUMBER NOT NULL,
    CONSTRAINT CK_GiaoDich_LoaiGD CHECK (LoaiGD IN ('Nhap', 'Xuat')),
    CONSTRAINT FK_GiaoDich_NhaVanChuyen FOREIGN KEY (MaNVC) REFERENCES NhaVanChuyen(MaNVC)
);

-- Tạo bảng LichSuCapNhat
CREATE TABLE LichSuCapNhat (
    MaLSCN NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    MaVT NUMBER NOT NULL,
    GiaCu NUMBER,
    GiaMoi NUMBER NOT NULL,
    NgayCapNhat DATE DEFAULT SYSDATE,
    CONSTRAINT FK_LichSuCapNhat_VatTu FOREIGN KEY (MaVT) REFERENCES VatTu(MaVT)
);

-- Tạo bảng CT_Nhap
CREATE TABLE CT_Nhap (
    MaGD NUMBER NOT NULL,
    MaVT NUMBER NOT NULL,
    SL NUMBER NOT NULL,
    MaNV NUMBER NOT NULL,
    ThanhTien NUMBER,
    MaNCC NUMBER NOT NULL,
    CONSTRAINT PK_CT_Nhap PRIMARY KEY (MaGD, MaVT),
    CONSTRAINT FK_CT_Nhap_GiaoDich FOREIGN KEY (MaGD) REFERENCES GiaoDich(MaGD),
    CONSTRAINT FK_CT_Nhap_VatTu FOREIGN KEY (MaVT) REFERENCES VatTu(MaVT),
    CONSTRAINT FK_CT_Nhap_NhanVien FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
    CONSTRAINT FK_CT_Nhap_NhaCungCap FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC)
);

-- Tạo bảng CT_Xuat
CREATE TABLE CT_Xuat (
    MaGD NUMBER NOT NULL,
    MaVT NUMBER NOT NULL,
    SL NUMBER NOT NULL,
    MaNV NUMBER NOT NULL,
    ThanhTien NUMBER,
    MaKH NUMBER NOT NULL,
    CONSTRAINT PK_CT_Xuat PRIMARY KEY (MaGD, MaVT),
    CONSTRAINT FK_CT_Xuat_GiaoDich FOREIGN KEY (MaGD) REFERENCES GiaoDich(MaGD),
    CONSTRAINT FK_CT_Xuat_VatTu FOREIGN KEY (MaVT) REFERENCES VatTu(MaVT),
    CONSTRAINT FK_CT_Xuat_NhanVien FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
    CONSTRAINT FK_CT_Xuat_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);

-- Tạo bảng LichSuKiemKe
CREATE TABLE LichSuKiemKe (
    MaLSKK NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    MaNV NUMBER NOT NULL,
    ThoiGian DATE DEFAULT SYSDATE,
    MaVT NUMBER NOT NULL,
    TinhTrang VARCHAR2(100),
    CONSTRAINT FK_LichSuKiemKe_NhanVien FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
    CONSTRAINT FK_LichSuKiemKe_VatTu FOREIGN KEY (MaVT) REFERENCES VatTu(MaVT)
);

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
select * from loaivt;

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
select * from vattu;



