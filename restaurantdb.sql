--restaurant TABLE

CREATE TABLE restaurant2(
    restaurantId serial primary key,
    name varchar,
    address varchar,
    category varchar
);

CREATE TABLE reviewer(
    reviewerId serial primary key,
    name varchar,
    email varchar,
    karma integer check(karma >-1 and karma <8)
);

CREATE TABLE review(
    id serial primary key,
    reviewerId integer REFERENCES reviewer (reviewerId),
    stars integer check(stars >-1 and stars <6),
    title varchar,
    review text,
    restaurantId integer REFERENCES restaurant2 (restaurantId)
);

--List all the reviews for a given restaurant given a specific restaurant ID.
SELECT * FROM review WHERE restaurantId = 4;

--List all the reviews for a given restaurant, given a specific restaurant name.
SELECT * FROM restaurant2 INNER JOIN review ON restaurant2.restaurantId = review.restaurantId WHERE name LIKE 'sal grosso';

--List all the reviews for a given reviewer, given a specific author name.
SELECT * FROM reviewer INNER JOIN review ON reviewer.reviewerId = review.reviewerId WHERE name LIKE 'imelda marcos';

--List all the reviews along with the restaurant they were written for. In the query result, select the restaurant name and the review text.
SELECT review, FROM review INNER JOIN restaurant2
