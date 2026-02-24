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