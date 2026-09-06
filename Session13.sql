create database food_delivery_db2;
use food_delivery_db2;
#1)Create a table called Orders with columns: order_id, user_id, order_amount, and app_name (e.g., 'Zomato', 'Swiggy', 'Flipkart'). Insert at least 10 sample records with different users and apps. Write an SQL query using the OVER() function to display each order's amount along with the total order amount for all orders.
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_amount DECIMAL(10,2),
    app_name VARCHAR(50)
);

INSERT INTO Orders VALUES
(101, 1, 450, 'Zomato'),
(102, 2, 780, 'Swiggy'),
(103, 1, 320, 'Flipkart'),
(104, 3, 650, 'Zomato'),
(105, 2, 1200, 'Flipkart'),
(106, 4, 550, 'Swiggy'),
(107, 3, 400, 'Flipkart'),
(108, 1, 900, 'Swiggy'),
(109, 4, 300, 'Zomato'),
(110, 2, 700, 'Zomato');


SELECT order_id, user_id, app_name, order_amount,
SUM(order_amount) OVER() AS total_order_amount
FROM Orders;



#2)Using the Orders table, write an SQL query to show each user's order_id, order_amount, and the average order_amount for that user using the OVER(PARTITION BY user_id) clause.<br><br><em><strong>Hint:</strong> Use AVG(order_amount) OVER(PARTITION BY user_id) to get the per-user average.</em>
SELECT order_id, user_id, order_amount,
AVG(order_amount) OVER(PARTITION BY user_id) AS avg_order_amount
FROM Orders;


#3)Suppose you have a table called Playlist with columns: song_id, user_id, and duration_sec. Write an SQL query to display each song's duration, and the total duration of songs added by each user using SUM(duration_sec) OVER(PARTITION BY user_id).
CREATE TABLE Playlist (
    song_id INT PRIMARY KEY,
    user_id INT,
    duration_sec INT
);
INSERT INTO Playlist VALUES
(1, 101, 240),
(2, 101, 180),
(3, 102, 300),
(4, 103, 210),
(5, 102, 250),
(6, 101, 200),
(7, 103, 190),
(8, 104, 280),
(9, 104, 220),
(10, 102, 260);


SELECT song_id, user_id, duration_sec,
    SUM(duration_sec) OVER(PARTITION BY user_id) AS total_duration
FROM Playlist;


#4)Given a table named MovieRatings with columns: rating_id, user_id, movie_name, and rating (1-5), write an SQL query to show each rating, the average rating per movie, and the difference between the user's rating and the movie's average rating using window functions.<br><br><em><strong>Hint:</strong> Use AVG(rating) OVER(PARTITION BY movie_name) and subtract it from the user's rating.</em>
CREATE TABLE MovieRatings (
    rating_id INT PRIMARY KEY,
    user_id INT,
    movie_name VARCHAR(100),
    rating INT
);
INSERT INTO MovieRatings VALUES
(1, 101, 'KGF', 5),
(2, 102, 'KGF', 4),
(3, 103, 'KGF', 3),
(4, 101, 'Pushpa', 5),
(5, 102, 'Pushpa', 4),
(6, 103, 'Pushpa', 5),
(7, 104, 'Leo', 4),
(8, 105, 'Leo', 3),
(9, 106, 'Leo', 5),
(10, 107, 'Leo', 4);

SELECT rating_id, user_id, movie_name, rating,
AVG(rating) OVER(PARTITION BY movie_name) AS avg_movie_rating,
rating - AVG(rating) OVER(PARTITION BY movie_name) AS rating_difference
FROM MovieRatings;