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
SELECT * FROM review INNER JOIN restaurant2 ON restaurant2.restaurantId = review.restaurantId WHERE restaurant2.name = 'sal grosso';

--List all the reviews for a given reviewer, given a specific author name.
SELECT * FROM review INNER JOIN reviewer ON review.reviewerId = reviewer.reviewerId WHERE reviewer.name = 'imelda marcos';

--List all the reviews along with the restaurant they were written for. In the query result, select the restaurant name and the review text.
SELECT restaurant2.name, review.review FROM review INNER JOIN restaurant2 ON review.restaurantId = restaurant2.restaurantId;

--Get the average stars by restaurant. The result should have the restaurant name and its average star rating.
SELECT restaurant2.name, AVG(review.stars) FROM restaurant2 INNER JOIN review ON review.restaurantId = restaurant2.restaurantId GROUP BY restaurant2.name;

--Get the number of reviews written for each restaurant. The result should have the restaurant name and its review count.

--List all the reviews along with the restaurant, and the reviewer's name. The result should have the restaurant name, the review text, and the reviewer name. Hint: you will need to do a three-way join - i.e. joining all three tables together.

--Get the average stars given by each reviewer. (reviewer name, average star rating)

--Get the lowest star rating given by each reviewer. (reviewer name, lowest star rating)

--Get the number of restaurants in each category. (category name, restaurant count)

--Get number of 5 star reviews given by restaurant. (restaurant name, 5-star count)

--Get the average star rating for a food category. (category name, average star rating)
