package org.example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DataRetriever {


//    q1 = nombre total des votes
    public long countAllVotes() {

        String sql = "SELECT COUNT(*) AS total_votes FROM vote";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getLong("total_votes");
            }
            return 0;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
