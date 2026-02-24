package org.example;

import java.util.List;

public class Main {

    public static void main(String[] args) {

        DataRetriever dr = new DataRetriever();
//q1
        long totalVote = dr.countAllVotes();
        System.out.println("totalVote=" + totalVote);
//q2
        List<VoteTypeCount> voteTypeCounts = dr.countVotesByType();
        System.out.println(voteTypeCounts);
//q3
        List<CandidateVoteCount> candidateResults =
                dr.countValidVotesByCandidate();
        System.out.println(candidateResults);
//q4
        VoteSummary summary = dr.computeVoteSummary();
        System.out.println(summary);
//q5
        double turnoutRate = dr.computeTurnoutRate();
        long totalVoters = dr.countTotalVoters(); // petite méthode ajoutée

        System.out.println("Nombre total d’électeurs : " + totalVoters);
        System.out.println("Nombre de votes enregistrés : " + totalVote);
        System.out.println("Donc taux de participations = "
                + turnoutRate + "%");
//q6
        ElectionResult winner = dr.findWinner();
        System.out.println(winner);
    }
}