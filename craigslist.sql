DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    region VARCHAR(15),
    location VARCHAR(20) NOT NULL
);
INSERT INTO regions (region, location)
VALUES
    ('None', 'None'),
    ('Atlanta', 'GA'),
    ('Chicago', 'IL'),
    ('Boston', 'MA'),
    ('Dallas', 'MA'),
    ('Detroit', 'MI'),
    ('New York City', 'NY'),
    ('Portland', 'OR'),
    ('San Francisco', 'CA'),
    ('Seattle', 'WA'),
    ('Tampa Bay', 'FL');

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) NOT NULL
);
INSERT INTO users (username) 
VALUES
    ('Colt'),
    ('Ryan');


CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category VARCHAR(15) NOT NULL
);
INSERT INTO categories (category)
VALUES
    ('Animals'),
    ('Books'),
    ('Education'),
    ('Film'),
    ('Games'),
    ('Music'),
    ('Nature'),
    ('Social Media'),
    ('Technology'),
    ('Vehicles');


CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    text TEXT NOT NULL,
    category INTEGER REFERENCES categories(id),
    uploader INTEGER REFERENCES users(id),
    posted_in INTEGER REFERENCES regions(id),
    location INTEGER REFERENCES regions(id)
);
INSERT INTO posts (title, text, category, uploader, posted_in, location)
VALUES 
    ('My Favorite Animals', 'I like dogs and cats', 1, 1, 1, 1),
    ('My Favorite Book', 'Call of the Wild', 2, 2, 4, 4);


SELECT posts.id, 
       posts.title, 
       posts.text,
       categories.category, 
       users.username,
       regions.region,
       regions.location
    FROM posts 
        JOIN categories ON posts.category = categories.id
        JOIN users ON posts.uploader = users.id
        JOIN regions ON posts.posted_in = regions.id OR posts.location = regions.id;