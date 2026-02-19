-- q1
SELECT COUNT(*) AS total_votes
FROM vote;

-- q2
SELECT vote_type, COUNT(*) AS count
FROM vote
GROUP BY vote_type;