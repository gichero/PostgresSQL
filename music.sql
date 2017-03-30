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

--1. What are tracks for a given album?
select * from track where aid = 4;

-- 2. What are the albums produced by a given artist?
select * from album where mid = 2;

-- 3. What is the track with the longest duration?
select * from track order by duration desc limit 1;

-- 4. What are the albums released in the 60s? 70s? 80s? 90s?
select * from album where year between 1960 and 2000 order by year;

-- 5. How many albums did a given artist produce in the 90s?
select * from album where year between 1990 and 1999 and mid = 2;

-- 6. What is each artist's latest album?
select musician.name, max(album.year) from musician inner join album on album.mid = musician.mid group by musician.mid;

-- 7. List all albums along with its total duration based on summing the duration of its tracks.



-- 8.List all albums along with its total duration based on summing the duration of its tracks.
select album.name, sum(track.duration) from track inner join album on album.aid = track.aid group by album.aid order by sum(track.duration)desc limit 1;

-- 10 Who are the 5 most prolific artists based on the number of albums they have recorded?
select musician.name, count(album.mid) from album inner join musician on musician.mid = album.mid group by musician.mid order by count(album.mid)desc limit 5;

--11. What are all the tracks a given artist has recorded?
select * from track where mid = 4;

--14. What songs has a given artist recorded?
select * from song where mid = 1;
