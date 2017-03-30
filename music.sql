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

select * from track where aid = 4;

select * from album where mid = 2;

select * from track order by duration desc limit 1;

select * from album where year between 1960 and 2000 order by year;

select * from album where year between 1990 and 1999 and mid = 2;
