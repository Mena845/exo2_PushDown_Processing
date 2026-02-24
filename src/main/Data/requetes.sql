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


-- q4
SELECT
    COUNT(CASE WHEN vote_type = 'VALID' THEN 1 END) AS valid_count,
    COUNT(CASE WHEN vote_type = 'BLANK' THEN 1 END) AS blank_count,
    COUNT(CASE WHEN vote_type = 'NULL' THEN 1 END) AS null_count
FROM vote;



-- q5
SELECT
    (COUNT(DISTINCT voter_id)::decimal /
     (SELECT COUNT(*) FROM voter)) * 100 AS turnout_rate
FROM vote;