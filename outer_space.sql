-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;
CREATE DATABASE outer_space;
\c outer_space

DROP TABLE IF EXISTS moons;
DROP TABLE IF EXISTS planets;

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL,
  has_moons BOOLEAN NOT NULL
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name VARCHAR(15) NOT NULL,
  moon_of INTEGER REFERENCES planets(id) ON DELETE CASCADE
);


INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, has_moons)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way', TRUE),
  ('Mars', 1.88, 'The Sun', 'Milky Way', TRUE),
  ('Venus', 0.62, 'The Sun', 'Milky Way', FALSE),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', TRUE),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', FALSE),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', FALSE);
SELECT * FROM planets;


INSERT INTO moons
  (name, moon_of)
VALUES
  ('The Moon', 1),
  ('Phobos', 2),
  ('Deimos', 2),
  ('Naiad', 4),
  ('Thalassa', 4),
  ('Despina', 4),
  ('Galatea', 4),
  ('Larissa', 4),
  ('S/2004 N 1', 4),
  ('Proteus', 4),
  ('Triton', 4),
  ('Nereid', 4),
  ('Halimede', 4),
  ('Sao', 4),
  ('Laomedeia', 4),
  ('Psamathe', 4),
  ('Neso', 4);
SELECT moons.name, planets.name FROM moons
  JOIN planets ON moons.moon_of = planets.id;