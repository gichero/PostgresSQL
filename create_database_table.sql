CREATE TABLE restaurant(
    NameId serial primary key,
    name varchar NOT NULL,
    distance integer,
    stars integer DEFAULT 0,
    type_of_food varchar,
    favorite_dish varchar,
    does_takeout boolean,
    last_time_you_were_there date
);

insert into restaurant (name, distance, stars, type_of_food, favorite_dish,does_takeout, last_time_you_were_there)values
    ('Trattoria', 4000, 3, 'Italian', 'Carbonara', True, '03-12-2016'),
    ('Chipotle', 1, 4, 'mexican', 'burrito', True, '02-22-2017'),
    ('Farm Burgers', 1, 4, 'burgers', 'mushroom beef burger', True, '03-17-2017')

    SELECT name FROM restaurant WHERE stars >= 4;

    SELECT name, favorite_dish FROM restaurant;

    SELECT NameId FROM restaurant WHERE name like '%Brazilian Steaks%';

    SELECT * FROM restaurant WHERE type_of_food = 'Chinese';

    SELECT * FROM restaurant WHERE does_takeout = true AND type_of_food = 'mexican';

    SELECT * FROM restaurant WHERE distance <= 2;

    SELECT * FROM restaurant WHERE last_time_you_were_there < '03-20-2017';

    SELECT * FROM restaurant WHERE last_time_you_were_there >= '03-20-2017' AND stars = 4;

    SELECT * FROM restaurant ORDER BY distance;

    SELECT * FROM restaurant ORDER BY stars DESC LIMIT 2;

    SELECT * FROM restaurant WHERE distance <= 2 ORDER BY stars DESC LIMIT 2;

    SELECT COUNT(*) FROM restaurant;

    SELECT type_of_food, COUNT(type_of_food) FROM restaurant GROUP BY type_of_food;

    SELECT AVG(stars) FROM restaurant;

    SELECT type_of_food, MAX(stars) FROM restaurant GROUP BY type_of_food;
