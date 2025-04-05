--
--***1. Trigger trên bảng VatTu
--Tự động cập nhật số lượng vật tư khi có giao dịch nhập hoặc xuất.
--TREN BANG CT_Nhap
CREATE OR REPLACE TRIGGER TRG_UPDATE_INVENTORY_CT_Nhap
AFTER INSERT OR UPDATE OR DELETE
ON CT_Nhap
FOR EACH ROW
BEGIN
    -- Khi INSERT: Cộng số lượng vào kho
    IF INSERTING THEN
    UPDATE VatTu 
    SET SoLuong = SoLuong + :NEW.SL
    WHERE MaVT = :NEW.MaVT;
    
    -- Khi UPDATE: Trừ số lượng cũ, sau đó cộng số lượng mới
    ELSIF UPDATING THEN
    UPDATE VatTu 
    SET SoLuong = SoLuong - :OLD.SL + :NEW.SL
    WHERE MaVT = :NEW.MaVT;
    
    -- Khi DELETE: Trừ số lượng khỏi kho
    ELSIF DELETING THEN
    UPDATE VatTu 
    SET SoLuong = SoLuong - :OLD.SL
    WHERE MaVT = :OLD.MaVT;  
    
    END IF;
END;
/


--TREN BANG CT_Xuat
CREATE OR REPLACE TRIGGER TRG_UPDATE_INVENTORY 
AFTER INSERT OR UPDATE OR DELETE
ON CT_Xuat
FOR EACH ROW
BEGIN
    -- Khi INSERT: Trừ số lượng khỏi kho
    IF INSERTING THEN
    UPDATE VatTu 
    SET SoLuong = SoLuong - :NEW.SL
    WHERE MaVT = :NEW.MaVT;
    
    -- Khi UPDATE: Trừ số lượng mới, sau đó cộng số lượng cũ
    ELSIF UPDATING THEN
    UPDATE VatTu 
    SET SoLuong = SoLuong - :NEW.SL + :OLD.SL
    WHERE MaVT = :NEW.MaVT;
    
    -- Khi DELETE: Cộng số lượng vào kho 
    ELSIF DELETING THEN
    UPDATE VatTu 
    SET SoLuong = SoLuong + :OLD.SL
    WHERE MaVT = :OLD.MaVT;  
    
    END IF;
END;
/


--Cập nhật đơn giá xuất = đơn giá nhập * 1.2 nếu đơn giá xuất chưa được nhập.
CREATE OR REPLACE TRIGGER trg_update_export_price
BEFORE INSERT OR UPDATE
ON VatTu    
FOR EACH ROW
BEGIN
    -- Kiểm tra nếu đơn giá xuất chưa được nhập (NULL) thì tính theo công thức
    IF :NEW.DonGiaXuat IS NULL OR :NEW.DonGiaXuat <> :NEW.DonGiaNhap * 1.2 THEN
        :NEW.DonGiaXuat := :NEW.DonGiaNhap * 1.2;
    END IF;
    IF UPDATING THEN 
    BEGIN
        INSERT INTO LichSuCapNhat(MaVT, GiaCu, GiaMoi)
        VALUES(:NEW.MaVT, :OLD.DonGiaNhap, :NEW.DonGiaNhap);
    END;
    END IF;
END;
/



--***2. Trigger trên bảng GiaoDich
--Không cho phép giao dịch xuất khi số lượng vật tư trong kho không đủ.
CREATE OR REPLACE TRIGGER trg_prevent_insufficient_stock
BEFORE INSERT OR UPDATE
ON CT_Xuat
FOR EACH ROW
DECLARE
    v_available_quantity NUMBER;
BEGIN
    -- Lấy số lượng hiện có trong kho của mặt hàng cần xuất
    SELECT SoLuong 
    INTO v_available_quantity
    FROM VatTu
    WHERE MaVT = :NEW.MaVT;
    
    -- Kiểm tra nếu giao dịch là xuất kho (giả sử Type = 'OUT')
    IF :NEW.SL > v_available_quantity THEN
        RAISE_APPLICATION_ERROR(-20001, 'Số lượng vật tư trong kho không đủ để xuất!');
    END IF;
END;
/

--Không cho phép thay đổi LoaiGD.
CREATE TRIGGER Khong_Update_LoaiGD
BEFORE UPDATE
ON GiaoDich
FOR EACH ROW
BEGIN
    IF :NEW.LoaiGD <> :OLD.LoaiGD THEN
        RAISE_APPLICATION_ERROR(-20002, 'Không cho phép thay đổi LoaiGD!');
    END IF;
END;
/

--Tự động tính tổng tiền giao dịch dựa trên chi tiết nhập/xuất.
CREATE OR REPLACE TRIGGER trg_UpdateThanhTien_Nhap
AFTER INSERT OR DELETE OR UPDATE 
ON CT_Nhap
BEGIN
    -- Cập nhật lại tổng tiền cho từng giao dịch
    MERGE INTO GiaoDich GD
    USING (
        SELECT MaGD, SUM(NVL(ThanhTien, 0)) AS TongTien
        FROM CT_Nhap
        GROUP BY MaGD
    ) CT ON (GD.MaGD = CT.MaGD)
    WHEN MATCHED THEN
        UPDATE SET GD.ThanhTien = CT.TongTien;
END;
/

CREATE OR REPLACE TRIGGER trg_UpdateThanhTien_Xuat
AFTER INSERT OR DELETE OR UPDATE 
ON CT_Xuat
BEGIN
    -- Cập nhật lại tổng tiền cho từng giao dịch
    MERGE INTO GiaoDich GD
    USING (
        SELECT MaGD, SUM(NVL(ThanhTien, 0)) AS TongTien
        FROM CT_Xuat
        GROUP BY MaGD
    ) CT ON (GD.MaGD = CT.MaGD)
    WHEN MATCHED THEN
        UPDATE SET GD.ThanhTien = CT.TongTien;
END;
/

--***3. Trigger trên bảng CT_Nhap
--Tự động tính tổng tiền cho CT_Nhap
CREATE OR REPLACE TRIGGER TONGTIEN_CT_NHAP
BEFORE INSERT OR UPDATE
ON CT_Nhap
FOR EACH ROW
DECLARE 
    v_DonGiaNhap NUMBER;
BEGIN
    SELECT DonGiaNhap INTO v_DonGiaNhap FROM VatTu WHERE MaVT = :NEW.MaVT;

    -- Tính ThanhTien trước khi dữ liệu được insert/update vào bảng CT_Nhap
    :NEW.ThanhTien := :NEW.SL * v_DonGiaNhap;
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20003, 'Không tìm thấy đơn giá nhập cho vật tư ' || :NEW.MaVT);
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20004, 'Lỗi khi tính tổng tiền CT_Nhap: ' || SQLERRM);
END;
/

--Kiểm tra xem mã NCC có tồn tại không trước khi thêm chi tiết nhập.
CREATE OR REPLACE TRIGGER trg_check_NCC_exist_CT_Nhap
BEFORE INSERT OR UPDATE
ON CT_Nhap
FOR EACH ROW
DECLARE v_count NUMBER;
BEGIN
    -- Kiểm tra mã khách hàng có tồn tại không
    SELECT COUNT(*) INTO v_count FROM NhaCungCap WHERE MaNCC = :NEW.MaNCC;
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20005, 'Không thể nhập hàng vì mã nhà cung cấp không tồn tại!');
    END IF;
END;
/

--***4. Trigger trên bảng CT_Xuat
--Tự động tính tổng tiền cho CT_Xuat
CREATE OR REPLACE TRIGGER TONGTIEN_CT_XUAT
BEFORE INSERT OR UPDATE
ON CT_Xuat
FOR EACH ROW
DECLARE
    v_DonGiaXuat NUMBER;
BEGIN
    -- Lấy đơn giá xuất từ bảng VatTu
    SELECT DonGiaXuat
    INTO v_DonGiaXuat
    FROM VatTu
    WHERE MaVT = :NEW.MaVT;

    -- Gán giá trị ThanhTien trực tiếp
    :NEW.ThanhTien := :NEW.SL * v_DonGiaXuat;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20003, 'Không tìm thấy đơn giá xuất cho vật tư ' || :NEW.MaVT);
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20004, 'Lỗi trong trigger TONGTIEN_CT_XUAT: ' || SQLERRM);
END TONGTIEN_CT_XUAT;
/


--Không cho phép xuất hàng nếu mã khách hàng không tồn tại.
CREATE OR REPLACE TRIGGER trg_check_customer_exist_CT_Xuat
BEFORE INSERT OR UPDATE
ON CT_Xuat
FOR EACH ROW
DECLARE v_count NUMBER;
BEGIN
    -- Kiểm tra mã khách hàng có tồn tại không
    SELECT COUNT(*) INTO v_count FROM KhachHang WHERE MaKH = :NEW.MaKH;
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20005, 'Không thể xuất hàng vì mã khách hàng không tồn tại!');
    END IF;
END;
/

--***5. Trigger trên bảng LichSuKiemKe
--Ghi nhận lịch sử kiểm kê nếu có thay đổi số lượng vật tư.

--Không cho phép kiểm kê vật tư không tồn tại trong bảng VatTu.
CREATE OR REPLACE TRIGGER trg_Check_KiemKeVatTu_KhongTonTai
BEFORE INSERT OR UPDATE
ON LichSuKiemKe
FOR EACH ROW
DECLARE v_MaVT NUMBER;
BEGIN
    SELECT MaVT INTO v_MaVT FROM VatTu WHERE MaVT = :NEW.MaVT;
    IF v_MaVT IS NULL THEN
        RAISE_APPLICATION_ERROR(-20006, 'Không cho phép kiểm kê vật tư không tồn tại trong bảng VatTu!');
    END IF;
END;
/


--Không cho phép tạo giao dịch với ngày trong tương lai (Thời gian phải nhỏ hơn hoặc bằng SYSDATE).
CREATE OR REPLACE TRIGGER trg_check_ngaygiaodich_GiaoDich
BEFORE INSERT OR UPDATE
ON GiaoDich
FOR EACH ROW
BEGIN
    -- Kiểm tra ngày giao dịch không được lớn hơn SYSDATE
    IF :NEW.ThoiGian > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20007, 'Không thể tạo giao dịch với ngày trong tương lai!');
    END IF;
END;
/

--Không cho phép chỉnh sửa ngày giao dịch sau khi đã tạo.
CREATE OR REPLACE TRIGGER trg_prevent_update_ngaygiaodich_GiaoDich
BEFORE UPDATE ON GiaoDich
FOR EACH ROW
BEGIN
    -- Kiểm tra nếu giá trị cũ và mới của NgayGiaoDich khác nhau
    IF :OLD.ThoiGian <> :NEW.ThoiGian THEN
        RAISE_APPLICATION_ERROR(-20008, 'Không thể chỉnh sửa ngày giao dịch sau khi đã tạo!');
    END IF;
END;
/

