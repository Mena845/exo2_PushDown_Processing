-- creation du type enum
CREATE TYPE vote_type AS ENUM ('VALID', 'BLANK', 'NULL');


-- creation de la table candidate
CREATE TABLE candidate (
                           id SERIAL PRIMARY KEY,
                           name TEXT NOT NULL
);


-- creation de la table voter
CREATE TABLE voter (
                       id SERIAL PRIMARY KEY,
                       name TEXT NOT NULL
);



-- creation de la table vote
CREATE TABLE vote (
                      id SERIAL PRIMARY KEY,
                      candidate_id INT REFERENCES candidate(id),
                      voter_id INT NOT NULL REFERENCES voter(id),
                      vote_type vote_type NOT NULL
);

-- insertion des candidats
INSERT INTO candidate (name) VALUES
                                 ('Alice'),
                                 ('Bob'),
                                 ('Charlie');

-- insertion des electeurs
INSERT INTO voter (name) VALUES
                             ('Voter1'),
                             ('Voter2'),
                             ('Voter3'),
                             ('Voter4'),
                             ('Voter5'),
                             ('Voter6');



-- insertion des votes
INSERT INTO vote (candidate_id, voter_id, vote_type) VALUES
                                                         (1, 1, 'VALID'),
                                                         (1, 2, 'VALID'),
                                                         (2, 3, 'VALID'),
                                                         (2, 4, 'BLANK'),
                                                         (NULL, 5, 'BLANK'),
                                                         (3, 6, 'NULL');


SELECT * FROM candidate;
SELECT * FROM voter;
SELECT * FROM vote;


DROP TABLE IF EXISTS vote CASCADE;
DROP TABLE IF EXISTS voter CASCADE;
DROP TABLE IF EXISTS candidate CASCADE;
DROP TYPE IF EXISTS vote_type CASCADE;


ALTER TABLE vote
    ADD CONSTRAINT unique_voter UNIQUE (voter_id);