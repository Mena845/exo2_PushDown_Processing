-- creation du type enum
CREATE TYPE vote_type AS ENUM ('VALID', 'BLANK', 'NULL');


-- creation de la table candidate
CREATE TABLE candidate (
                           id SERIAL PRIMARY KEY,
                           name TEXT NOT NULL
);