
package com.senko.warehousemanagement.model.dao;

import com.senko.warehousemanagement.model.DatabaseConnection;
import com.senko.warehousemanagement.model.entities.NhanVien;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NhanVienDAO {
    public ArrayList<NhanVien> getAllNhanVien(){
        ArrayList<NhanVien> dsNhanVien = new ArrayList<>();
        String query = "SELECT * FROM NHANVIEN";
        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query)) {
            
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                
                NhanVien current = new NhanVien(
                    rs.getInt("MaNV"),
                    rs.getString("TenNV"),
                    rs.getDate("NgayVaoLam").toLocalDate(),
                    rs.getLong("Luong"),
                    rs.getString("ChucVu"),
                    rs.getString("Username"),
                    rs.getString("Password")
                );
            
                dsNhanVien.add(current);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dsNhanVien;
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
                maNhanVien = rs.getInt("MANV");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return maNhanVien;
    }
     
    public NhanVien getNhanVienByUsername(String username){
        NhanVien nhanVien = null;
        String query = "SELECT * FROM NHANVIEN WHERE USERNAME = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                nhanVien = new NhanVien(
                   rs.getInt("MaNV"),
                    rs.getString("TenNV"),
                    rs.getDate("NgayVaoLam").toLocalDate(),
                    rs.getLong("Luong"),
                    rs.getString("ChucVu"),
                    rs.getString("Username"),
                    rs.getString("Password")
                );
            }
            return nhanVien;

        } catch (SQLException e) {
            e.printStackTrace();
            return nhanVien;
        }
    }
}
