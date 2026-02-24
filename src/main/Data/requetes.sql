-- q1
SELECT COUNT(*) AS total_votes
FROM vote;

-- q2
SELECT vote_type, COUNT(*) AS count
FROM vote
GROUP BY vote_type;


-- q3
SELECT c.name AS candidate_name,
       COUNT(v.id) AS valid_vote_count
FROM candidate c
         LEFT JOIN vote v
                   ON c.id = v.candidate_id
                       AND v.vote_type = 'VALID'
GROUP BY c.name;