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

-- Tính toán và trả về giá trị tổng kho của mỗi loại vật tư.
CREATE OR REPLACE PROCEDURE ThongKeGiaTriKho
AS
    v_GiaTri NUMBER;
BEGIN
    FOR r IN (SELECT MaLVT, SUM(SoLuong * DonGiaNhap) AS GiaTri
              FROM VatTu
              GROUP BY MaLVT)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Loại vật tư: ' || r.MaLVT || ' - Giá trị kho: ' || r.GiaTri);
    END LOOP;
END ThongKeGiaTriKho;
/


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

-- Báo cáo Nhập/Xuất Kho theo ngày.
CREATE OR REPLACE PROCEDURE BaoCaoNhapXuatTheoNgay(
    P_Ngay IN DATE
)
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Báo cáo nhập xuất ngày: ' || TO_CHAR(P_Ngay, 'DD/MM/YYYY'));

    -- Báo cáo nhập kho
    FOR r IN (SELECT MaGD, SUM(SL) AS SL_Nhap, SUM(ThanhTien) AS ThanhTien_Nhap
              FROM CT_Nhap
              WHERE ThoiGian = P_Ngay
              GROUP BY MaGD)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Giao dịch nhập: ' || r.MaGD || ' - Số lượng: ' || r.SL_Nhap || ' - Thành tiền: ' || r.ThanhTien_Nhap);
    END LOOP;

    -- Báo cáo xuất kho
    FOR r IN (SELECT MaGD, SUM(SL) AS SL_Xuat, SUM(ThanhTien) AS ThanhTien_Xuat
              FROM CT_Xuat
              WHERE ThoiGian = P_Ngay
              GROUP BY MaGD)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Giao dịch xuất: ' || r.MaGD || ' - Số lượng: ' || r.SL_Xuat || ' - Thành tiền: ' || r.ThanhTien_Xuat);
    END LOOP;
END BaoCaoNhapXuatTheoNgay;
/


-- Tạo Giao Dịch Nhập, Trả lại MaGD để thêm CT_Nhap
CREATE OR REPLACE PROCEDURE Proc_TaoGiaoDichNhap (
    p_MaNVC    IN NUMBER,
    p_MaGD     OUT NUMBER
) AS
BEGIN
    INSERT INTO GiaoDich (LoaiGD, MaNVC)
    VALUES ('Nhap', p_MaNVC)
    RETURNING MaGD INTO p_MaGD;
END;
/


-- Thêm CT_Nhap 
CREATE OR REPLACE PROCEDURE Them_CT_Nhap(
    P_MaGD IN NUMBER,
    P_MaVT IN NUMBER,
    P_SL IN NUMBER,
    P_MaNV IN NUMBER,
    P_MaNCC IN NUMBER
)
AS
    dummy NUMBER;
BEGIN
    SELECT 1 INTO dummy
    FROM VATTU
    WHERE MAVT = P_MaVT
    FOR UPDATE;

    INSERT INTO CT_Nhap(MaGD, MaVT, SL, MaNV, ThanhTien, MaNCC) 
    VALUES(P_MaGD, P_MaVT, P_SL, P_MaNV, 0, P_MaNCC);
    COMMIT;

    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Lỗi xảy ra: ' || SQLERRM);
            ROLLBACK;
END Them_CT_Nhap;
/

-- DECLARE
--     v_MaGD NUMBER;
-- BEGIN
--     Proc_TaoGiaoDichNhap(p_MaNVC => 1, p_MaGD => v_MaGD);

--     -- 2. Thêm nhiều chi tiết nhập cho giao dịch đó
--     Proc_ThemChiTietNhap(v_MaGD, 1, 10, 2, 3);
--     Proc_ThemChiTietNhap(v_MaGD, 2, 5, 2, 3);
--     Proc_ThemChiTietNhap(v_MaGD, 3, 20, 2, 3);
-- END;
-- /


-- Tạo Giao Dịch Xuất, Trả lại MaGD để thêm CT_Xuat
CREATE OR REPLACE PROCEDURE Proc_TaoGiaoDichXuat (
    p_MaNVC    IN NUMBER,
    p_MaGD     OUT NUMBER
) AS
BEGIN
    INSERT INTO GiaoDich (LoaiGD, MaNVC)
    VALUES ('Xuat', p_MaNVC)
    RETURNING MaGD INTO p_MaGD;
END;
/


-- Thêm CT_Xuat
CREATE OR REPLACE PROCEDURE Them_CT_Xuat(
    P_MaGD IN NUMBER,
    P_MaVT IN NUMBER,
    P_SL IN NUMBER,
    P_MaNV IN NUMBER,
    p_MaKH IN NUMBER
)
AS
    dummy NUMBER;
BEGIN
    SELECT 1 INTO dummy
    FROM VATTU
    WHERE MAVT = P_MaVT
    FOR UPDATE;

    INSERT INTO CT_Xuat(MaGD, MaVT, SL, MaNV, ThanhTien, MaKH) 
    VALUES(P_MaGD, P_MaVT, P_SL, P_MaNV, 0, p_MaKH);
   
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Lỗi xảy ra: ' || SQLERRM);
            ROLLBACK;
END Them_CT_Xuat;
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

-- Xoá Giao Dịch và các Chi tiết liên quan.
CREATE OR REPLACE PROCEDURE XoaGiaoDich(
    P_MaGD IN NUMBER
)
AS
    v_LoaiGD GIAODICH.LOAIGD%TYPE;
BEGIN
    -- Kiểm tra xem giao dịch có tồn tại không và lấy loại giao dịch
    SELECT LoaiGD INTO v_LoaiGD
    FROM GIAODICH
    WHERE MaGD = P_MaGD
    FOR UPDATE;

    -- Xoá các chi tiết giao dịch tương ứng
    IF v_LoaiGD = 'Nhap' THEN
        DELETE FROM CT_Nhap WHERE MaGD = P_MaGD;
    ELSIF v_LoaiGD = 'Xuat' THEN
        DELETE FROM CT_Xuat WHERE MaGD = P_MaGD;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Loại giao dịch không hợp lệ: ' || v_LoaiGD);
    END IF;

    -- Xoá bản ghi trong GiaoDich
    DELETE FROM GIAODICH WHERE MaGD = P_MaGD;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Đã xoá giao dịch và chi tiết liên quan với MaGD = ' || P_MaGD);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Không tìm thấy giao dịch có MaGD = ' || P_MaGD);
        ROLLBACK;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Lỗi: ' || SQLERRM);
        ROLLBACK;
END XoaGiaoDich;
/

-- BEGIN
--     XoaGiaoDich(1);
-- END;
-- /



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
