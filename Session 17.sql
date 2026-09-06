use food_delivery_db3;

CREATE TABLE FoodOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    total_amount DECIMAL(10,2)
);

INSERT INTO FoodOrders
VALUES
(1,'Rohini',250),
(2,'Amit',550),
(3,'Priya',1200),
(4,'Raj',850),
(5,'Neha',150);


#1)Write an SQL query using CASE WHEN to classify orders in a 'FoodOrders' table as 'Small', 'Medium', or 'Large' based on the total_amount: 'Small' for less than 300, 'Medium' for 300 to 999, and 'Large' for 1000 and above.
SELECT order_id, customer_name, total_amount,
CASE
    WHEN total_amount < 300 THEN 'Small'
    WHEN total_amount BETWEEN 300 AND 999 THEN 'Medium'
    ELSE 'Large'
END AS order_size
FROM FoodOrders;


CREATE TABLE Moviess (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    rating DECIMAL(3,1)
);

INSERT INTO Moviess
VALUES
(1,'KGF',8.7),
(2,'Pushpa',7.2),
(3,'Adipurush',4.8),
(4,'RRR',9.0),
(5,'Housefull',5.5);


#2)Given a 'Movies' table with a 'rating' column (out of 10), write an SQL query that adds a new column 'popularity' which shows 'Blockbuster' for ratings 8 and above, 'Hit' for 5 to 7.9, and 'Average' for below 5 using CASE WHEN ELSE END.
SELECT movie_id, movie_name, rating,
CASE
    WHEN rating >= 8 THEN 'Blockbuster'
    WHEN rating >= 5 THEN 'Hit'
    ELSE 'Average'
END AS popularity
FROM Moviess;

CREATE TABLE FlipkartProducts (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO FlipkartProducts
VALUES
(1,'Mouse',350),
(2,'Keyboard',900),
(3,'Laptop',65000),
(4,'Headphones',1800),
(5,'Charger',450);

#3)For a 'FlipkartProducts' table with a 'price' column, write an SQL query to create a 'price_category' column that bins prices as 'Budget' (below 500), 'Standard' (500 to 2000), and 'Premium' (above 2000) using CASE WHEN.
SELECT product_id, product_name, price,
CASE
    WHEN price < 500 THEN 'Budget'
    WHEN price BETWEEN 500 AND 2000 THEN 'Standard'
    ELSE 'Premium'
END AS price_category
FROM FlipkartProducts;

CREATE TABLE SpotifyTracks (
    track_id INT PRIMARY KEY,
    track_name VARCHAR(100),
    duration_seconds INT
);

INSERT INTO SpotifyTracks
VALUES
(1,'Believer',204),
(2,'Shape of You',233),
(3,'Thunder',172),
(4,'Bohemian Rhapsody',355),
(5,'Perfect',263);

#4)Write an SQL query for a 'SpotifyTracks' table that uses CASE WHEN to assign a 'duration_label' column: 'Short' for tracks under 180 seconds, 'Medium' for 180-300 seconds, and 'Long' for over 300 seconds.<br><br><em><strong>Hint:</strong> Use multiple WHEN conditions to cover all possible durations.</em>

SELECT track_id, track_name, duration_seconds,
CASE
    WHEN duration_seconds < 180 THEN 'Short'
    WHEN duration_seconds BETWEEN 180 AND 300 THEN 'Medium'
    ELSE 'Long'
END AS duration_label
FROM SpotifyTracks;
