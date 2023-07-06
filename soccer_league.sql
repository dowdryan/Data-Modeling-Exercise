DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league


CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team VARCHAR(25)
);
INSERT INTO teams (team) 
VALUES
    ('AFC Bournemouth'),
    ('Arsenal'),
    ('Aston Villa'),
    ('Brentford'),
    ('Brighton & Hove Albion'),
    ('Burnley'),
    ('Chelsea'),
    ('Crystal Palace'),
    ('Everton'),
    ('Fulham'),
    ('Liverpool'),
    ('Luton Town'),
    ('Manchester City'),
    ('Manchester United'),
    ('Newcastle United'),
    ('Nottingham Forest'),
    ('Sheffield United'),
    ('Tottenham Hotspur'),
    ('West Ham United'),
    ('Wolverhampton Wanderers');


CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    referee VARCHAR(20)
);
INSERT INTO referees (referee)
VALUES 
    ('Ref'),
    ('Feree');


CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    home_team INTEGER REFERENCES teams(id),
    away_team INTEGER REFERENCES teams(id),
    home_score INTEGER,
    away_score INTEGER,
    referee INTEGER REFERENCES referees(id)
);
INSERT INTO matches (home_team, away_team, home_score, away_score, referee)
VALUES
    (8, 16, 1, 1, 1),
    (14, 10, 2, 1, 2);


SELECT m.match_id,
       home_teams.team AS home_team,
       m.home_score,
       away_teams.team AS away_team,
       m.away_score,
       referees.referee
FROM matches AS m
JOIN teams AS home_teams ON m.home_team = home_teams.id
JOIN teams AS away_teams ON m.away_team = away_teams.id
JOIN referees ON m.referee = referees.id;