
-- create a database table
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

--insert data
insert into restaurant (name, distance, stars, type_of_food, favorite_dish,does_takeout, last_time_you_were_there)values
    ('Trattoria', 4000, 3, 'Italian', 'Carbonara', True, '03-12-2016'),
    ('Chipotle', 1, 4, 'mexican', 'burrito', True, '02-22-2017'),
    ('Farm Burgers', 1, 4, 'burgers', 'mushroom beef burger', True, '03-17-2017')
--name of restaurants with more than 5 stars
    SELECT name FROM restaurant WHERE stars > 4;

--favorite dishes from restaurants
    SELECT name, favorite_dish FROM restaurant;

--id of a restaurant by a specific name
    SELECT NameId FROM restaurant WHERE name like '%Brazilian Steaks%';

--restaurant in the category of brazilian
    SELECT * FROM restaurant WHERE type_of_food = 'brazilian';

--restaurants that do takeouts and are mexiacan
    SELECT * FROM restaurant WHERE does_takeout = true AND type_of_food = 'mexican';

--restaurants within 2 miles
    SELECT * FROM restaurant WHERE distance <= 2;

--restaurants you haven't eaten at in the past week
    SELECT * FROM restaurant WHERE last_time_you_were_there < '03-20-2017';

--restaurant you haven't eaten at in the last week and has 5 stars
    SELECT * FROM restaurant WHERE last_time_you_were_there >= '03-20-2017' AND stars > 4;

--restaurants by closest distance
    SELECT * FROM restaurant ORDER BY distance;

--top 2 restaurants by distance
    SELECT * FROM restaurant ORDER BY stars DESC LIMIT 2;

--top 2 restaurants by stars
    SELECT * FROM restaurant WHERE distance <= 2 ORDER BY stars DESC LIMIT 2;

--count the number of restaurants in the db.
    SELECT COUNT(*) FROM restaurant;

--count the number of restaurants by category.
    SELECT type_of_food, COUNT(type_of_food) FROM restaurant GROUP BY type_of_food;

--get the average stars per restaurant by category.
    SELECT AVG(stars) FROM restaurant;

--get the max stars of a restaurant by category.
    SELECT type_of_food, MAX(stars) FROM restaurant GROUP BY type_of_food;
