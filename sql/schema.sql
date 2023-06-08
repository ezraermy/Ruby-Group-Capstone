CREATE DATABASE catalog;
\c catalog

CREATE TABLE book (
  id SERIAL PRIMARY KEY NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN,
  publisher VARCHAR (200),
  cover_state VARCHAR (20),
  genre_id INTEGER,
  author_id INTEGER,
  label_id INTEGER
);

CREATE TABLE label (
  id SERIAL PRIMARY KEY NOT NULL,
  title VARCHAR (200),
  color VARCHAR (200)
);

ALTER TABLE book ADD CONSTRAINT fk_label FOREIGN KEY(label_id) REFERENCES label(id);

CREATE TABLE items (
  id VARCHAR(36) PRIMARY KEY,
  genre VARCHAR(255),
  author VARCHAR(255),
  label VARCHAR(255),
  publish_date DATE,
  archived BOOLEAN
);

CREATE TABLE music_albums (
  id VARCHAR(36) PRIMARY KEY,
  item_id VARCHAR(36) UNIQUE,
  on_spotify BOOLEAN,
  FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE genres (
  id VARCHAR(36) PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE games (
    id INT GENERATED ALWAYS AS IDENTITY,
    muliplayer boolean,
    last_played_at DATE,
    published_at DATE,
    archived boolean,
    genre varchar(255),
    author varchar(255),
    label varchar(255),
    PRIMARY KEY(id)
);

CREATE TABLE authors (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name varchar(255),
    last_name varchar(255),
    items array,
    PRIMARY KEY(id)
);

