package org.example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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


//     q2 = vote par type
    public List<VoteTypeCount> countVotesByType() {

        String sql = """
            SELECT vote_type, COUNT(*) AS count
            FROM vote
            GROUP BY vote_type
        """;

        List<VoteTypeCount> result = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                result.add(new VoteTypeCount(
                        rs.getString("vote_type"),
                        rs.getLong("count")
                ));
            }
            return result;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


//    q3 = Votes valides par candidat
    public List<CandidateVoteCount> countValidVotesByCandidate() {

        String sql = """
            SELECT c.name AS candidate_name,
                   COUNT(v.id) AS valid_vote_count
            FROM candidate c
            LEFT JOIN vote v
                ON c.id = v.candidate_id
                AND v.vote_type = 'VALID'
            GROUP BY c.name
        """;

        List<CandidateVoteCount> result = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                result.add(new CandidateVoteCount(
                        rs.getString("candidate_name"),
                        rs.getLong("valid_vote_count")
                ));
            }
            return result;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
