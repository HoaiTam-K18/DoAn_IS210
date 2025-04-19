
package com.senko.warehousemanagement.model.dao;

import com.senko.warehousemanagement.model.DatabaseConnection;
import com.senko.warehousemanagement.model.entities.KhachHang;
import com.senko.warehousemanagement.model.entities.VatTu;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class KhachHangDAO {
    public ArrayList<KhachHang> getAllKhachHang(){
        ArrayList<KhachHang> dsKhachHang = new ArrayList<>();
        String query = "SELECT * FROM KHACHHANG";
        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query)) {
            
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                
                KhachHang current = new KhachHang(
                    rs.getInt("MaKH"),
                    rs.getString("TenKH"),
                    rs.getString("SDT")
                );
            
                dsKhachHang.add(current);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dsKhachHang;
    }
    
    public void insertKhachHang(String tenKhachHang, String soDienThoai){
        String query = "INSERT INTO KHACHHANG(TenKH, SDT) VALUES (?,?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, tenKhachHang);
            stmt.setString(2, soDienThoai);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteKhachHang(int maKhachHang){
        String query = "DELETE FROM KHACHHANG WHERE MaKH = ?";
        try(Connection con = DatabaseConnection.getConnection();
            PreparedStatement stmt = con.prepareStatement(query)){
            stmt.setInt(1,maKhachHang);
            stmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
    
    public void updateKhachHang(String tenKhachHang, String soDienThoai, int maKhachHang){
        String query = "UPDATE KHACHHANG SET TenKH = ?, SDT = ?"
                         + "WHERE MaKH = ?";
        try(Connection con = DatabaseConnection.getConnection();
            PreparedStatement stmt = con.prepareStatement(query)){
            stmt.setString(1, tenKhachHang);
            stmt.setString(2, soDienThoai);
            stmt.setInt(3, maKhachHang);
            stmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
