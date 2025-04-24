
package com.senko.warehousemanagement.model.dao;

import com.senko.warehousemanagement.model.DatabaseConnection;
import com.senko.warehousemanagement.model.entities.LichSuCapNhatGia;
import com.senko.warehousemanagement.model.entities.NhanVien;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class LichSuCapNhatGiaDAO {
    public ArrayList<LichSuCapNhatGia> getAllLichSuCapNhatGia(){
        ArrayList<LichSuCapNhatGia> dsLichSuCapNhatGia = new ArrayList<>();
        String query = "SELECT * FROM LICHSUCAPNHAT JOIN VATTU ON LICHSUCAPNHAT.MaVT = VATTU.MaVT";
        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query)) {
            
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                
                LichSuCapNhatGia current = new LichSuCapNhatGia(
                    rs.getInt("MaLSCN"),
                    rs.getString("TenVT"),
                    rs.getLong("GiaCu"),
                    rs.getLong("GiaMoi"),
                    rs.getDate("NgayCapNhat").toLocalDate()
                );
            
                dsLichSuCapNhatGia.add(current);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dsLichSuCapNhatGia;
    }
    
    public void insertNhanVien(String tenNhanVien, Date ngayVaoLam, long luong, String chucVu){
        String query = "INSERT INTO NHANVIEN(TenNV, NgayVaoLam, Luong, ChucVu) VALUES (?,?,?,?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, tenNhanVien);
            stmt.setDate(2, ngayVaoLam);
            stmt.setLong(3, luong);
            stmt.setString(4, chucVu);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteNhanVien(int maNhanVien){
        String query = "DELETE FROM VATTU WHERE MaVT = ?";
        try(Connection con = DatabaseConnection.getConnection();
            PreparedStatement stmt = con.prepareStatement(query)){
            stmt.setInt(1,maNhanVien);
            stmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateNhanVien(String tenNhanVien, Date ngayVaoLam, long luong, String chucVu, int maNhanVien){
        String query = "UPDATE NHANVIEN SET TenNV = ?, NgayVaoLam = ?, Luong = ?, ChucVu = ?"
                         + "WHERE MaNV = ?";
        try(Connection con = DatabaseConnection.getConnection();
            PreparedStatement stmt = con.prepareStatement(query)){
            stmt.setString(1,tenNhanVien);
            stmt.setDate(2, ngayVaoLam);
            stmt.setLong(3, luong);
            stmt.setString(4, chucVu);
            stmt.setInt(5, maNhanVien);
            stmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
     public int getMaNhanVien(String nhanVien) {
        int maNhanVien = 0;
        String query = "SELECT MANV FROM NHANVIEN WHERE TENNV = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, nhanVien);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                maNhanVien = rs.getInt("MALVT");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return maNhanVien;
    }
}
