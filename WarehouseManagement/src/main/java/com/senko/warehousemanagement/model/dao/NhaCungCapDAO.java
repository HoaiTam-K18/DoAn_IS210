
package com.senko.warehousemanagement.model.dao;

import com.senko.warehousemanagement.model.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class NhaCungCapDAO {
    public int getMaNhaCungCap(String nhaCungCap) {
        int maNhaCungCap = 0;
        String query = "SELECT MANCC FROM NHACUNGCAP WHERE TENNCC = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, nhaCungCap);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                maNhaCungCap = rs.getInt("MAncc");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return maNhaCungCap;
    }
}
