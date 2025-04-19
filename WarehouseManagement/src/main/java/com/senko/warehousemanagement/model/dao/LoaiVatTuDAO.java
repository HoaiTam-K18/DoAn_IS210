
package com.senko.warehousemanagement.model.dao;

import com.senko.warehousemanagement.model.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LoaiVatTuDAO {
    public int getMaLoaiVatTu(String loaiVT) {
        int maLoaiVatTu = 0;
        String query = "SELECT MALVT FROM LOAIVT WHERE TENLVT = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, loaiVT);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                maLoaiVatTu = rs.getInt("MALVT");
                System.out.println(maLoaiVatTu);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return maLoaiVatTu;
    }
}
