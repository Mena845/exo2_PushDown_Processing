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

