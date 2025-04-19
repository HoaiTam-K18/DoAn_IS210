
package com.senko.warehousemanagement.model.dao;

import com.senko.warehousemanagement.model.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class NhaVanChuyenDAO {
    public int getNhaVanChuyen(String nhaVanChuyen) {
        int maNhaVanChuyen = 0;
        String query = "SELECT MaNVC FROM NHAVANCHUYEN WHERE TenNVC = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, nhaVanChuyen);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                maNhaVanChuyen = rs.getInt("MaNVC");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return maNhaVanChuyen;
    }
}
