use food_delivery_db;
CREATE TABLE Songs (
    id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist_name VARCHAR(100)
);
INSERT INTO Songs VALUES
(1, 'Kesariya', 'Arijit Singh'),
(2, 'Believer', 'Imagine Dragons'),
(3, 'Tum Hi Ho', 'Arijit Singh'),
(4, 'Perfect', 'Ed Sheeran');

 
 use food_delivery_db;
 use restaurants;
 select * from restaurants;
 INSERT INTO restaurants
VALUES
(6, 'Star Cafe', 'Surat', 'Cafe', 4.6),
(7, 'Royal Cafe', 'Ahmedabad', 'Cafe', 4.3);

#1)Write an SQL query to find all restaurants in a table called Restaurants whose names end with 'Cafe' using the LIKE operator.
SELECT *
FROM Restaurants
WHERE name LIKE '%Cafe';

#2)In a Flipkart-style Products table, use the BETWEEN operator to select all products with a price between 500 and 1500 rupees.
SELECT *
FROM products
WHERE price BETWEEN 500 AND 1500;

#3)Write an SQL query to display all users from a Users table whose city is either 'Ahmedabad', 'Surat', or 'Vadodara' using the IN operator.
SELECT *
FROM users
WHERE city IN ('Ahmedabad', 'Surat', 'Vadodara');

#4)Given a table called Songs with columns song_name and artist_name, find all songs where the artist_name contains the letter sequence 'ar' anywhere in the name using the LIKE operator.<br><br><em><strong>Hint:</strong> Use wildcards on both sides of the pattern.</em>
SELECT *
FROM songs
WHERE artist_name LIKE '%ar%';
