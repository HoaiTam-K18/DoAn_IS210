
package com.senko.warehousemanagement.model.dao;

import com.senko.warehousemanagement.model.DatabaseConnection;
import com.senko.warehousemanagement.model.entities.LichSuCapNhatGia;
import com.senko.warehousemanagement.model.entities.LichSuKiemKe;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class LichSuKiemKeDAO {
    public ArrayList<LichSuKiemKe> getAllLichSuKiemKe(){
        ArrayList<LichSuKiemKe> dsLichSuKiemKe = new ArrayList<>();
        String query = "SELECT * FROM LICHSUKIEMKE JOIN VATTU ON LICHSUKIEMKE.MaVT = VATTU.MaVT "
                + "JOIN NHANVIEN ON LICHSUKIEMKE.MaNV = NHANVIEN.MaNV";
        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query)) {
            
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                
                LichSuKiemKe current = new LichSuKiemKe(
                    rs.getInt("MaLSKK"),
                    rs.getString("TenNV"),
                    rs.getDate("ThoiGian").toLocalDate(),
                    rs.getString("TenVT"),
                    rs.getInt("SoLuongConLai"),
                    rs.getString("TinhTrang")
                );
            
                dsLichSuKiemKe.add(current);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dsLichSuKiemKe;
    }
    
    public void insertLichSuKiemKe (int maNhanVien, int maVatTu, int soLuongConLai, String tinhTrang){
        String query = "INSERT INTO LICHSUKIEMKE(MaNV, MaVT, SoLuongConLai, TinhTrang) VALUES (?,?,?,?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, maNhanVien);
            stmt.setInt(2, maVatTu);
            stmt.setInt(3, soLuongConLai);
            stmt.setString(4, tinhTrang);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
