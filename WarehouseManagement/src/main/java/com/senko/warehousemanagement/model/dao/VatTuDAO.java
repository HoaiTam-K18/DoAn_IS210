
package com.senko.warehousemanagement.model.dao;

import com.senko.warehousemanagement.model.DatabaseConnection;
import com.senko.warehousemanagement.model.entities.VatTu;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class VatTuDAO {
    
    public ArrayList<VatTu> getAllVatTu(){
        ArrayList<VatTu> dsVatTu = new ArrayList<>();
        String query = "SELECT * FROM VATTU JOIN LOAIVT ON VATTU.MaLVT = LOAIVT.MaLVT";
        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query)) {
            
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                
                VatTu current = new VatTu(
                    rs.getInt("MaVT"),
                    rs.getString("TenVT"),
                    rs.getString("TenLVT"),
                    rs.getLong("DonGiaNhap"),
                    rs.getLong("DonGiaXuat"),
                    rs.getInt("SoLuong"),
                    rs.getInt("TrangThai")
                );
            
                dsVatTu.add(current);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dsVatTu;
    }
    
    public void insertVatTu(String tenVatTu, int maLoaiVatTu, long donGiaNhap, long donGiaXuat){
        String query = "INSERT INTO VATTU(TenVT, MaLVT, DonGiaNhap, DonGiaXuat) VALUES (?,?,?,?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, tenVatTu);
            stmt.setInt(2, maLoaiVatTu);
            stmt.setLong(3, donGiaNhap);
            stmt.setLong(4, donGiaXuat);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteVatTu(int maVatTu){
        String query = "DELETE FROM VATTU WHERE MaVT = ?";
        try(Connection con = DatabaseConnection.getConnection();
            PreparedStatement stmt = con.prepareStatement(query)){
            stmt.setInt(1,maVatTu);
            stmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
    
    public void updateVatTu(String tenVatTu, int maLoaiVatTu, long donGiaNhap, long donGiaXuat, int maVatTu){
        String query = "UPDATE VATTU SET TenVT = ?, MaLVT = ?, DonGiaNhap = ?, DonGiaXuat = ?"
                         + "WHERE MaVT = ?";
        try(Connection con = DatabaseConnection.getConnection();
            PreparedStatement stmt = con.prepareStatement(query)){
            stmt.setString(1,tenVatTu);
            stmt.setInt(2,maLoaiVatTu);
            stmt.setLong(3, donGiaNhap);
            stmt.setLong(4, donGiaXuat);
            stmt.setInt(5, maVatTu);
            stmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public int getMaVatTu(String vatTu) {
        int maVatTu = 0;
        String query = "SELECT MAVT FROM VATTU WHERE TENVT = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, vatTu);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                maVatTu = rs.getInt("MAVT");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return maVatTu;
    }
}

