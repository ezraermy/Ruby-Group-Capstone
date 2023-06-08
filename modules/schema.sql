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