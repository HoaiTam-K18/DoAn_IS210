
package com.senko.warehousemanagement.model.dao;

import com.senko.warehousemanagement.model.DatabaseConnection;
import com.senko.warehousemanagement.model.entities.ChiTietNhap;
import com.senko.warehousemanagement.model.entities.ChiTietXuat;
import com.senko.warehousemanagement.model.entities.NhanVien;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class ChiTietGiaoDichDAO {
    public ArrayList<ChiTietNhap> getAllChiTietNhap(int maGiaoDich){
        ArrayList<ChiTietNhap> dsChiTietNhap = new ArrayList<>();
        String query = "SELECT * FROM CT_NHAP JOIN VATTU ON CT_NHAP.MaVT = VATTU.MaVT "
                + "JOIN NHACUNGCAP ON CT_NHAP.MaNCC = NHACUNGCAP.MaNCC "
                + "WHERE CT_NHAP.MaGD = ?";
        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1,maGiaoDich);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                
                ChiTietNhap current = new ChiTietNhap(
                    rs.getInt("MaGD"),
                    rs.getString("TenVT"),
                    rs.getInt("SL"),
                    rs.getLong("ThanhTien"),
                    rs.getString("TenNCC")
                );
            
                dsChiTietNhap.add(current);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dsChiTietNhap;
    }
    
    public void insertChiTietNhap(int maVatTu, int soLuong, long thanhTien, int maNhaCungCap, int maGiaoDich){
        String query = "INSERT INTO CT_NHAP(MaGD, MaVT, SL, ThanhTien, MaNCC) VALUES (?,?,?,?,?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, maGiaoDich);
            stmt.setInt(2, maVatTu);
            stmt.setInt(3, soLuong);
            stmt.setLong(4, thanhTien);
            stmt.setInt(5, maNhaCungCap);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteChiTietNhap(int maGiaoDich, int maVatTu){
        String query = "DELETE FROM CT_NHAP WHERE MaGD = ? AND MaVT = ?";
        try(Connection con = DatabaseConnection.getConnection();
            PreparedStatement stmt = con.prepareStatement(query)){
            stmt.setInt(1,maGiaoDich);
            stmt.setInt(2, maVatTu);
            stmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateChiTietNhap(int maVatTu, int soLuong, long thanhTien, int maNhaCungCap, int maGiaoDich){
        String query = "UPDATE CT_NHAP SET SL = ?, ThanhTien = ?, MaNCC = ?"
                         + "WHERE MaGD = ? AND MAVT = ?";
        try(Connection con = DatabaseConnection.getConnection();
            PreparedStatement stmt = con.prepareStatement(query)){
            stmt.setInt(1, soLuong);
            stmt.setLong(2, thanhTien);
            stmt.setInt(3, maNhaCungCap);
            stmt.setInt(4, maGiaoDich);
            stmt.setInt(5, maVatTu);
            stmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<ChiTietXuat> getAllChiTietXuat(int maGiaoDich){
        ArrayList<ChiTietXuat> dsChiTietXuat = new ArrayList<>();
        String query = "SELECT * FROM CT_XUAT JOIN VATTU ON CT_XUAT.MaVT = VATTU.MaVT "
                + "JOIN KHACHHANG ON CT_XUAT.MaKH = KHACHHANG.MaKH "
                + "WHERE CT_XUAT.MaGD = ?";
        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1,maGiaoDich);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                ChiTietXuat current = new ChiTietXuat(
                    rs.getInt("MaGD"),
                    rs.getString("TenVT"),
                    rs.getInt("SL"),
                    rs.getLong("ThanhTien"),
                    rs.getString("TenKH")
                );
            
                dsChiTietXuat.add(current);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dsChiTietXuat;
    }
    
    public void insertChiTietXuat(int maVatTu, int soLuong, long thanhTien, int maKhachHang, int maGiaoDich){
        String query = "INSERT INTO CT_XUAT(MaGD, MaVT, SL, ThanhTien, MaKH) VALUES (?,?,?,?,?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, maGiaoDich);
            stmt.setInt(2, maVatTu);
            stmt.setInt(3, soLuong);
            stmt.setLong(4, thanhTien);
            stmt.setInt(5, maKhachHang);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteChiTietXuat(int maGiaoDich, int maVatTu){
        String query = "DELETE FROM CT_XUAT WHERE MaGD = ? AND MaVT = ?";
        try(Connection con = DatabaseConnection.getConnection();
            PreparedStatement stmt = con.prepareStatement(query)){
            stmt.setInt(1,maGiaoDich);
            stmt.setInt(2, maVatTu);
            stmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateChiTietXuat(int maVatTu, int soLuong, long thanhTien, int maKhachHang, int maGiaoDich){
        String query = "UPDATE CT_XUAT SET SL = ?, ThanhTien = ?, MaKH = ? "
                         + "WHERE MaGD = ? AND MAVT = ?";
        try(Connection con = DatabaseConnection.getConnection();
            PreparedStatement stmt = con.prepareStatement(query)){
            stmt.setInt(1, soLuong);
            stmt.setLong(2, thanhTien);
            stmt.setInt(3, maKhachHang);
            stmt.setInt(4, maGiaoDich);
            stmt.setInt(5, maVatTu);
            stmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
