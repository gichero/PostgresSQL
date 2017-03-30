-- CREATE TABLE musician(
--     mid serial primary key,
--     name varchar
-- );

CREATE TABLE album(
    aid serial primary key,
    name varchar,
    year integer
);

CREATE TABLE track(
    tid serial primary key,
    name varchar,
    duration numeric,
    year integer
);

CREATE TABLE song(
    sid serial primary key,
    name varchar,
    duration numeric,
    year integer
);
