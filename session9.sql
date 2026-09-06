create database influ;
use influ;

#1)Create two tables, influencers and brands, with at least 3 sample rows each. Use a FULL OUTER JOIN to list all influencers and brands, showing influencer_name and brand_name, matching on city. If there is no match, display NULL for the missing side.<br><br><em><strong>Hint:</strong> Use LEFT JOIN, RIGHT JOIN, and UNION if your SQL dialect does not support FULL OUTER JOIN directly.</em>

CREATE TABLE influencers (
    influencer_id INT PRIMARY KEY,
    influencer_name VARCHAR(100),
    city VARCHAR(50)
);
INSERT INTO influencers VALUES
(1,'Riya','Surat'),
(2,'Aman','Ahmedabad'),
(3,'Neha','Rajkot');

CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(100),
    city VARCHAR(50)
);
INSERT INTO brands VALUES
(1,'Nike','Surat'),
(2,'Puma','Mumbai'),
(3,'Adidas','Rajkot');


SELECT i.influencer_name, b.brand_name
FROM influencers i
LEFT JOIN brands b
ON i.city = b.city

UNION

SELECT i.influencer_name, b.brand_name
FROM influencers i
RIGHT JOIN brands b
ON i.city = b.city;


#2)Given a table called playlists with columns (id, playlist_name, parent_playlist_id), write a SELF JOIN query to display each playlist alongside its parent playlist's name, similar to how Spotify might nest playlists.
CREATE TABLE playlists (
    id INT PRIMARY KEY,
    playlist_name VARCHAR(100),
    parent_playlist_id INT
);
INSERT INTO playlists VALUES
(1,'Bollywood',NULL),
(2,'Romantic',1),
(3,'Party',1),
(4,'English',NULL);

SELECT
p1.playlist_name AS Playlist,
p2.playlist_name AS Parent_Playlist
FROM playlists p1
LEFT JOIN playlists p2
ON p1.parent_playlist_id = p2.id;

#3)Create two tables: users and offers. Write a CROSS JOIN query to generate all possible combinations of users and offers, displaying user_name and offer_title. Explain in a comment how this could be used for a Flipkart-style personalized offer campaign.
CREATE TABLE users1 (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100)
);

INSERT INTO users1 VALUES
(1,'Rohini'),
(2,'Amit'),
(3,'Priya');
 use influ;
CREATE TABLE offers (
    offer_id INT PRIMARY KEY,
    offer_title VARCHAR(100)
);
INSERT INTO offers VALUES
(1,'10% OFF'),
(2,'Free Delivery'),
(3,'Buy 1 Get 1');

SELECT
u.user_name,
o.offer_title
FROM users1 u
CROSS JOIN offers o;

#4)You have an employees table with columns (id, name, manager_id). Write a SELF JOIN to display each employee's name along with their manager's name. Then, modify your query to only show employees who do not have a manager (i.e., top-level managers).
use influ;
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT
);
INSERT INTO employees VALUES
(1,'Rahul',NULL),
(2,'Rohini',1),
(3,'Amit',1),
(4,'Priya',2);

SELECT
e.name AS Employee,
m.name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.id;
SELECT *
FROM employees
WHERE manager_id IS NULL;

#5)Use ChatGPT or Copilot to help you write a SQL query that finds all pairs of users from a users table who live in the same city (excluding pairs where the user is compared with themselves). Paste the query and briefly describe how the AI helped you improve or debug it.

use influ;
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    city VARCHAR(50)
);
INSERT INTO users VALUES
(1,'Rohini','Surat'),
(2,'Amit','Surat'),
(3,'Priya','Ahmedabad'),
(4,'Neha','Ahmedabad');
SELECT
u1.user_name AS User1,
u2.user_name AS User2,
u1.city
FROM users u1
JOIN users u2
ON u1.city = u2.city
AND u1.user_id < u2.user_id;

