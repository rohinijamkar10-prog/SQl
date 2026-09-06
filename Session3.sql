use  food_delivery_db;
#1)Write an SQL query to select all restaurants from a table named 'restaurants' where the rating is greater than or equal to 4.5.
SELECT *
FROM restaurants
WHERE rating >= 4.5;

#2)In a table called 'movies', filter and display only the movies released after 2020 and with genre 'Action' using the WHERE clause and AND operator.
SELECT *
FROM movies
WHERE release_year > 2020
AND genre = 'Action';

#3)Given a table 'products' with columns (id, name, price, category), write a query to find all products not in the 'Electronics' category or with a price less than 500.

SELECT *
FROM products
WHERE category !='Electronics'
OR price < 500;

#4)Write an SQL query for a table 'users' to show all users who are NOT from 'Ahmedabad' and have more than 1000 followers.<br><br><em><strong>Hint:</strong> Use the NOT operator combined with AND.</em>
use  food_delivery_db;
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    followers INT
);
INSERT INTO users VALUES
(1, 'Rohini', 'Valsad', 1500),
(2, 'Amit', 'Ahmedabad', 2500),
(3, 'Priya', 'Surat', 800),
(4, 'Neha', 'Rajkot', 1800),
(5, 'Karan', 'Ahmedabad', 900);

SELECT *
FROM users
WHERE NOT city = 'Ahmedabad'
AND followers > 1000;