package org.example;

public class Main {

    public static void main(String[] args) {

        DataRetriever dr = new DataRetriever();

        System.out.println("Q1 total votes = " + dr.countAllVotes());
        System.out.println("Q2 votes by type = " + dr.countVotesByType());
        System.out.println("Q3 valid votes by candidate = " + dr.countValidVotesByCandidate());
        System.out.println("Q4 summary = " + dr.computeVoteSummary());
        System.out.println("Q5 turnout rate = " + dr.computeTurnoutRate() + "%");
        System.out.println("Q6 winner = " + dr.findWinner());
    }
}