DROP DATABASE IF EXISTS music;
CREATE DATABASE music;
\c music


CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  artist VARCHAR(30) NOT NULL
);
INSERT INTO artists (artist)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Cary'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');
  

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  song VARCHAR(30) NOT NULL
);
INSERT INTO songs (song)
VALUES
  ('MMMBop'),
  ('Bohemian Rhapsody'),
  ('One Sweet Day'),
  ('Shallow'),
  ('How You Remind Me'),
  ('New York State of Mind'),
  ('Dark Horse'),
  ('Moves Like Jagger'),
  ('Complicated'),
  ('Say My Name');


CREATE TABLE duration_of_songs (
  id SERIAL PRIMARY KEY, 
  duration INTEGER NOT NULL
);
INSERT INTO duration_of_songs (duration)
VALUES
  (238),
  (355),
  (282),
  (216),
  (223),
  (276),
  (215),
  (201),
  (244),
  (240);


CREATE TABLE release_dates (
  id SERIAL PRIMARY KEY, 
  release_date DATE NOT NULL
);
INSERT INTO release_dates (release_date)
VALUES
  ('04-15-1997'),
  ('10-31-1975'),
  ('11-14-1995'),
  ('09-27-2018'),
  ('08-21-2001'),
  ('10-20-2009'),
  ('12-17-2013'),
  ('06-21-2011'),
  ('05-14-2002'),
  ('11-07-1999');


CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  album VARCHAR(60) NOT NULL
);
INSERT INTO albums (album)
VALUES
  ('Middle of Nowhere'),
  ('A Night at the Opera'),
  ('Daydream'),
  ('A Star Is Born'),
  ('Silver Side Up'),
  ('The Blueprint 3'),
  ('Prism'),
  ('Hands All Over'),
  ('Let Go'),
  ('The Writing''s on the Wall');


CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  producer VARCHAR(30) NOT NULL
);
INSERT INTO producers (producer)
VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');



CREATE TABLE song_info (
  id SERIAL PRIMARY KEY,
  song INTEGER REFERENCES songs(id),
  duration INTEGER REFERENCES duration_of_songs(id),
  release_date INTEGER REFERENCES release_dates(id),
  artist_name INTEGER REFERENCES artists(id),
  album_id INTEGER REFERENCES albums(id),
  producer_id INTEGER REFERENCES producers(id)
);
INSERT INTO song_info (song, duration, release_date, artist_name, album_id, producer_id)
VALUES 
  (1, 1, 1, 1, 1, 2),
  (1, 1, 1, 1, 1, 1),
  (2, 2, 2, 2, 2, 3),
  (3, 3, 3, 3, 3, 4),
  (4, 4, 4, 4, 4, 5),
  (5, 5, 5, 5, 5, 6),
  (6, 6, 6, 6, 6, 7),
  (7, 7, 7, 7, 7, 8),
  (7, 7, 7, 7, 7, 9),
  (8, 8, 8, 8, 8, 10),
  (8, 8, 8, 8, 8, 11),
  (9, 9, 9, 9, 9, 12),
  (10, 10, 10, 10, 10, 13);

SELECT songs.id,
       songs.song, 
       duration_of_songs.duration,
       release_dates.release_date,
       artists.artist,
       albums.album, 
       producers.producer 
FROM song_info
      JOIN songs ON song_info.song = songs.id
      JOIN duration_of_songs ON song_info.duration = duration_of_songs.id
      JOIN release_dates ON song_info.release_date = release_dates.id
      JOIN artists ON song_info.artist_name = artists.id
      JOIN albums ON song_info.album_id = albums.id
      JOIN producers ON song_info.producer_id = producers.id;