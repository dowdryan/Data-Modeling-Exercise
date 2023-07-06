-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;
CREATE DATABASE air_traffic;
\c air_traffic


CREATE TABLE airlines (
  airline_id SERIAL PRIMARY KEY,
  airline_name VARCHAR(20) NOT NULL
);
INSERT INTO airlines (airline_name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');


CREATE TABLE flight_times (
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL
);
INSERT INTO flight_times (departure, arrival)
VALUES 
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00');


CREATE TABLE locations ( 
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);
INSERT INTO locations (city, country)
VALUES
  ('Washington DC', 'United States'),
  ('Seattle', 'United States'),
  ('Tokyo', 'Japan'),
  ('London', 'United Kingdom'),
  ('Los Angeles', 'United States'),
  ('Las Vegas', 'United States'),
  ('Paris', 'France'),
  ('Casablanca', 'Morocco'),
  ('Dubai', 'UAE'),
  ('Beijing', 'China'),
  ('New York', 'United States'),
  ('Charlotte', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Chicago', 'United States'),
  ('New Orleans', 'United States'),
  ('Sao Paolo', 'Brazil'),
  ('Santiago', 'Chile');


CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(15) NOT NULL,
  last_name VARCHAR(15) NOT NULL,
  airline INTEGER REFERENCES airlines(airline_id) NOT NULL,
  seat VARCHAR(5) NOT NULL,
  departure INTEGER REFERENCES flight_times(id) NOT NULL,
  arrival INTEGER REFERENCES flight_times(id) NOT NULL,
  going_to INTEGER REFERENCES locations(id) NOT NULL,
  coming_from INTEGER REFERENCES locations(id) NOT NULL
);
INSERT INTO passengers (first_name, last_name, airline, seat, departure, arrival, going_to, coming_from)
VALUES
  ('Jennifer', 'Finch', 1, '33B', 1, 1, 1, 1),
  ('Thadeus', 'Gathercoal', 2, '8A', 2, 2, 1, 1),
  ('Sonja', 'Pauley', 3, '12F', 3, 3, 1, 1),
  ('Waneta', 'Skeleton', 4, '23D', 4, 4, 1, 1),
  ('Berkie', 'Wycliff', 1, '9E', 5, 5, 1, 1),
  ('Alvin', 'Leathes', 6, '1A', 6, 6, 1, 1),
  ('Cory', 'Squibbes', 7, '10D', 7, 7, 1, 1);


SELECT passengers.id,
       passengers.first_name,
       passengers.last_name,
       airlines.airline_name,
       passengers.seat,
       flight_times.departure,
       flight_times.arrival,
       locations.city,
       locations.country
FROM passengers
JOIN airlines ON passengers.airline = airlines.airline_id
JOIN flight_times ON passengers.departure = flight_times.id OR passengers.arrival = flight_times.id
JOIN locations ON passengers.going_to = locations.id OR passengers.coming_from = locations.id;