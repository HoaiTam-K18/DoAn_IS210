
package com.senko.warehousemanagement.model.dao;

import com.senko.warehousemanagement.model.DatabaseConnection;
import com.senko.warehousemanagement.model.entities.GiaoDich;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class GiaoDichDAO {
    public ArrayList<GiaoDich> getAllGiaoDich(){
        ArrayList<GiaoDich> dsGiaoDich = new ArrayList<>();
        String query = "SELECT * FROM GIAODICH JOIN NHAVANCHUYEN ON GIAODICH.MaNVC = NHAVANCHUYEN.MaNVC";
        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query)) {
            
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                GiaoDich current = new GiaoDich(
                    rs.getInt("MaGD"),
                    rs.getString("LoaiGD"),
                    rs.getDate("ThoiGian").toLocalDate(),
                    rs.getLong("ThanhTien"),
                    rs.getString("TenNVC")
                );
            
                dsGiaoDich.add(current);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dsGiaoDich;
    }
    
    public void insertGiaoDich(String loaiGiaoDich, int maNhaVanChuyen){
        String query = "INSERT INTO GIAODICH(LoaiGD, MaNVC) VALUES (?,?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, loaiGiaoDich);
            stmt.setInt(2, maNhaVanChuyen);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteGiaoDich(int maGiaoDich){
        String query = "DELETE FROM GIAODICH WHERE MaGD = ?";
        try(Connection con = DatabaseConnection.getConnection();
            PreparedStatement stmt = con.prepareStatement(query)){
            stmt.setInt(1,maGiaoDich);
            stmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
    
    public void updateGiaoDich(String loaiGiaoDich, int maNhaVanChuyen, int maGiaoDich){
        String query = "UPDATE KHACHHANG SET LoaiGD = ?, MaNVC = ?"
                         + "WHERE MaGD = ?";
        try(Connection con = DatabaseConnection.getConnection();
            PreparedStatement stmt = con.prepareStatement(query)){
            stmt.setString(1, loaiGiaoDich);
            stmt.setInt(2, maNhaVanChuyen);
            stmt.setInt(3, maGiaoDich);
            stmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
