SET SERVEROUTPUT ON;
--Kiểm tra hàng tồn kho.
CREATE OR REPLACE PROCEDURE CHECK_INVENTORY (
    p_MaVT IN NUMBER,
    p_SoLuong OUT NUMBER
)
AS
BEGIN
    SELECT SoLuong
    INTO p_SoLuong
    FROM VatTu
    WHERE MaVT = p_MaVT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('Không tìm thấy mặt hàng với ID: ' || p_MaVT);
        p_SoLuong := 0;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Lỗi xảy ra: ' || SQLERRM);
        p_SoLuong := -1;

END CHECK_INVENTORY;
/

DECLARE
    v_soluong NUMBER;
BEGIN
    CHECK_INVENTORY(1, v_soluong);
    DBMS_OUTPUT.PUT_LINE('Số lượng tồn kho: ' || v_soluong);
END;
/

select * from VatTu;

--Cập nhật thông tin hàng hóa (giá, mô tả, số lượng).
CREATE OR REPLACE PROCEDURE CAPNHAT_HANGHOA (
    p_MaVT IN VARCHAR2,
    p_TenVT IN VARCHAR2,
    p_DonGiaNhap IN NUMBER,
    p_SoLuong IN NUMBER
)
AS
BEGIN
    -- Cập nhật thông tin hàng hóa (UPDATE tự động khoá hàng cập nhật.)
    UPDATE VATTU
    SET DonGiaNhap = p_DonGiaNhap,
        TenVT = p_TenVT,
        DonGiaXuat = p_DonGiaNhap * 1.2,
        SoLuong = p_SoLuong
    WHERE MaVT = p_MaVT;
    
    -- Hiển thị thông báo cập nhật thành công
    DBMS_OUTPUT.PUT_LINE('Cập nhật thành công vật tư ID: ' || p_MaVT);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Không tìm thấy vật tư với ID: ' || p_MaVT);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Lỗi xảy ra: ' || SQLERRM);
END CAPNHAT_HANGHOA;
/

--Xuất báo cáo tồn kho theo từng loại vật tư.
CREATE OR REPLACE PROCEDURE BAOCAO_TONKHO_LoaiVT
AS
BEGIN
    FOR LVT IN (
        SELECT LoaiVT.MaLVT, LoaiVT.TenLVT, NVL(SUM(VatTu.SoLuong), 0) AS TongSoLuong
        FROM LoaiVT 
        LEFT JOIN VatTu ON LoaiVT.MaLVT = VatTu.MaLVT
        GROUP BY LoaiVT.MaLVT, LoaiVT.TenLVT
    ) 
    LOOP 
        DBMS_OUTPUT.PUT_LINE('Loại vật tư: ' || LVT.MaLVT || ' - ' || LVT.TenLVT ||
                             ' - Tổng tồn kho: ' || LVT.TongSoLuong);
    END LOOP;
END BAOCAO_TONKHO_LoaiVT;
/


-- BEGIN
--    BAOCAO_TONKHO_LoaiVT;
-- END;
-- /

-- Lấy ra giá trị số lượng tồn kho theo MaVT
CREATE OR REPLACE PROCEDURE Get_SLTonKho(
    P_MaVT IN NUMBER,
    P_SoLuong OUT NUMBER    
)
AS
BEGIN
    SELECT SoLuong INTO P_SoLuong FROM VatTu WHERE MaVT = P_MaVT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Không tìm thấy số lượng vật tư với ID: ' || p_MaVT);
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Lỗi xảy ra: ' || SQLERRM);
END Get_SLTonKho;
/

-- Thêm CT_Nhap 
CREATE OR REPLACE PROCEDURE ThemCT_Nhap(
    P_MaGD IN NUMBER,
    P_MaVT IN NUMBER,
    P_SL IN NUMBER,
    P_MaNV IN NUMBER,
    P_MaNCC IN NUMBER
)
AS
BEGIN
    INSERT INTO CT_Nhap(MaGD, MaVT, SL, MaNV, ThanhTien, MaNCC) 
    VALUES(P_MaGD, P_MaVT, P_SL, P_MaNV, 0, P_MaNCC);
    DBMS_OUTPUT.PUT_LINE('Thêm vào CT_Nhap có Mã Giao Dịch: ' || P_MaGD || ' - Mã Vật Tư: ' || P_MaVT || ' - Số Lượng: ' || P_SL);
    
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Lỗi xảy ra: ' || SQLERRM);
END ThemCT_Nhap;
/

-- Thêm CT_Xuat
CREATE OR REPLACE PROCEDURE ThemCT_Xuat(
    P_MaGD IN NUMBER,
    P_MaVT IN NUMBER,
    P_SL IN NUMBER,
    P_MaNV IN NUMBER,
    p_MaKH IN NUMBER
)
AS
BEGIN
    INSERT INTO CT_Xuat(MaGD, MaVT, SL, MaNV, ThanhTien, MaKH) 
    VALUES(P_MaGD, P_MaVT, P_SL, P_MaNV, 0, p_MaKH);
    DBMS_OUTPUT.PUT_LINE('Thêm vào CT_Xuat có Mã Giao Dịch: ' || P_MaGD || ' - Mã Vật Tư: ' || P_MaVT || ' - Số Lượng: ' || P_SL);
    
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Lỗi xảy ra: ' || SQLERRM);
END ThemCT_Xuat;
/


--Truy vấn lịch sử nhập/xuất vật tư.
CREATE OR REPLACE PROCEDURE LICH_SU_NHAP(
    p_MaGD IN VARCHAR2
)
AS
     v_LoaiGD VARCHAR2(10);
BEGIN
    SELECT LoaiGD INTO v_LoaiGD FROM GiaoDich WHERE MaGD = p_MaGD;
    IF v_LoaiGD = 'Nhap' THEN
        FOR GD_Nhap IN (
            SELECT GiaoDich.MaGD, LoaiGD, ThoiGian, MaVT, SL, CT_Nhap.ThanhTien, MaNV, MaNCC
            FROM GiaoDich JOIN CT_Nhap 
            ON GiaoDich.MaGD = CT_Nhap.MaGD
            WHERE GiaoDich.MaGD = p_MaGD
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('Giao dịch: ' || GD_Nhap.MaGD || ' - Loại giao dịch: ' || GD_Nhap.LoaiGD  || ' - Ngày giao dịch: ' || GD_Nhap.ThoiGian ||
            ' - Thành tiền: ' || GD_Nhap.ThanhTien || ' | Vật tư: ' || GD_Nhap.MaVT || ' | Số lượng: ' || GD_Nhap.SL || ' | Nhân viên: ' || GD_Nhap.MaNV ||
            ' | Nhà Cung Cấp: ' || GD_Nhap.MaNCC);
        END LOOP;
    END IF;
    
END LICH_SU_NHAP;
/


CREATE OR REPLACE PROCEDURE LICH_SU_XUAT(
    p_MaGD IN VARCHAR2
)
AS
     v_LoaiGD VARCHAR2(10);
BEGIN
    SELECT LoaiGD INTO v_LoaiGD FROM GiaoDich WHERE MaGD = p_MaGD;
    IF v_LoaiGD = 'Xuat' THEN
        FOR GD_Xuat IN (
        SELECT GiaoDich.MaGD, LoaiGD, ThoiGian, MaVT, CT_Xuat.ThanhTien, SL, MaNV, MaKH
        FROM GiaoDich JOIN CT_Xuat 
        ON GiaoDich.MaGD = CT_Xuat.MaGD
        WHERE GiaoDich.MaGD = p_MaGD
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('Giao dịch: ' || GD_Xuat.MaGD || ' - Loại giao dịch: ' || GD_Xuat.LoaiGD  || ' - Ngày giao dịch: ' || GD_Xuat.ThoiGian ||
                                 ' | Vật tư: ' || GD_Xuat.MaVT || ' | Số lượng: ' || GD_Xuat.SL || ' | Nhân viên: ' || GD_Xuat.MaNV || ' | khách Hàng: ' || GD_Xuat.MaKH);
        END LOOP;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Không tìm thấy giao dịch có mã: ' || p_MaGD);
    END IF;
    
END LICH_SU_XUAT;
/


--Tạo tài khoản người dùng mới trong hệ thống.
CREATE OR REPLACE PROCEDURE CREATE_USER(
    p_TenNguoiDung IN VARCHAR2,
    p_MatKhau IN VARCHAR2,
    p_VaiTro IN VARCHAR2
)
AS
    v_UserCount NUMBER;
BEGIN
    -- Kiểm tra xem user đã tồn tại chưa
    SELECT COUNT(*)
    INTO v_UserCount
    FROM ALL_USERS
    WHERE USERNAME = UPPER(p_TenNguoiDung);
    
    IF v_UserCount > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Người dùng đã tồn tại: ' || p_TenNguoiDung);
    ELSE
        EXECUTE IMMEDIATE 'CREATE USER ' || p_TenNguoiDung || ' IDENTIFIED BY ' || p_MatKhau;    
    
    IF p_VaiTro = 'Admin' THEN
        EXECUTE IMMEDIATE 'GRANT DBA TO ' || p_TenNguoiDung;
    ELSIF p_VaiTro = 'KhachHang' THEN
        EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE TO ' || p_TenNguoiDung;
        EXECUTE IMMEDIATE 'GRANT SELECT ON VatTu ' || p_TenNguoiDung;
        EXECUTE IMMEDIATE 'GRANT SELECT ON LoaiVT ' || p_TenNguoiDung;
        EXECUTE IMMEDIATE 'GRANT SELECT ON GiaoDich ' || p_TenNguoiDung;
        EXECUTE IMMEDIATE 'GRANT SELECT ON CT_Nhap ' || p_TenNguoiDung;
        EXECUTE IMMEDIATE 'GRANT SELECT ON CT_Xuat ' || p_TenNguoiDung;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Vai trò không hợp lệ: ' || p_VaiTro);
        RETURN;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Đã tạo tài khoản thành công: ' || p_TenNguoiDung);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Lỗi khi tạo tài khoản: ' || SQLERRM);
END CREATE_USER;
/

--BEGIN
--    CREATE_USER('SinhVien01', 'abc123', 'NhanVien');
--END;
--/

-- Thêm quyền cho các nhân viên:
CREATE OR REPLACE PROCEDURE ThemQuyenNV(
    p_MaNV IN VARCHAR2,
    p_TenNguoiDung IN VARCHAR2,
    p_MatKhau IN VARCHAR2
)
AS
    p_ChucVu VARCHAR2(50);
    v_UserCount NUMBER;
BEGIN
    SELECT ChucVu INTO p_ChucVu FROM NhanVien Where MaNV = p_MaNV;
    
    -- Kiểm tra xem user đã tồn tại chưa
    SELECT COUNT(*)
    INTO v_UserCount
    FROM ALL_USERS
    WHERE USERNAME = UPPER(p_TenNguoiDung);
    
    IF v_UserCount > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Người dùng đã tồn tại: ' || p_TenNguoiDung);
    ELSE
        EXECUTE IMMEDIATE 'CREATE USER ' || p_TenNguoiDung || ' IDENTIFIED BY ' || p_MatKhau; 
        EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE TO ' || p_TenNguoiDung;
        
        IF p_ChucVu = 'KeToan'  THEN
            EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE ON GiaoDich TO ' || p_TenNguoiDung;
            EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE ON CT_Nhap TO ' || p_TenNguoiDung;
            EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE ON CT_Xuat TO ' || p_TenNguoiDung;    
        ELSIF p_ChucVu = 'NhapXuat' THEN
            EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE ON LoaiVT TO ' || p_TenNguoiDung;
            EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE ON VatTu TO ' || p_TenNguoiDung;
            EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE ON NhaCungCap TO ' || p_TenNguoiDung;
            EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE ON KhachHang TO ' || p_TenNguoiDung;
            EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE ON NhaVanChuyen TO ' || p_TenNguoiDung;
        ELSIF p_ChucVu = 'NghiemThu' THEN
            EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE ON LichSuKiemKe TO ' || p_TenNguoiDung;
            EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE ON LoaiVT TO ' || p_TenNguoiDung;
            EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE ON VatTu TO ' || p_TenNguoiDung;
        END IF;
    END IF;
END;
/
