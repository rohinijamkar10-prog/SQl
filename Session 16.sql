use food_delivery_db3;
CREATE TABLE users (
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO users
VALUES
('Rohini', 'Patel'),
('Amit', 'Shah'),
('Priya', 'Mehta');

CREATE TABLE playlists (
    song_title VARCHAR(100)
);

INSERT INTO playlists
VALUES
('Shape of You'),
('Believer'),
('Perfect');

CREATE TABLE food_items (
    item_code VARCHAR(20)
);

INSERT INTO food_items
VALUES
(' FD101 '),
(' FD205'),
('FD309 ');

CREATE TABLE movies (
    imdb_id VARCHAR(20)
);

INSERT INTO movies
VALUES
('tt1234567'),
('tt7654321'),
('tt9876543');

CREATE TABLE products (
    sku_code VARCHAR(30)
);

INSERT INTO products
VALUES
('MOB-123-XY'),
('TV-456-AB'),
('LAP-789-CD');

#1)Write an SQL query using CONCAT to combine first_name and last_name columns from a users table into a single full_name column and display the result.
  SELECT CONCAT(first_name, ' ', last_name) AS full_name
   FROM users;
   
   
#2)Given a table called playlists with a column song_title, write a query to display all song titles in uppercase using the UPPER function.
   SELECT UPPER(song_title) AS song_title FROM playlists;
   
 #3)You have a table food_items with a column item_code that sometimes contains extra spaces at the beginning or end. Write an SQL query to select item_code values after removing all leading and trailing spaces using TRIM.
	SELECT TRIM(item_code) AS item_code FROM food_items;  
    
#4)In a table called movies, the column imdb_id contains codes like 'tt1234567'. Write a query to extract just the numeric part (the last 7 characters) using RIGHT and display it as movie_number.<br><br><em><strong>Hint:</strong> Use RIGHT(imdb_id, 7) to get the numeric part.</em>
	SELECT RIGHT(imdb_id, 7) AS movie_number FROM movies;

#5)A products table has a column sku_code where some entries use dashes (e.g. 'MOB-123-XY'). Write an SQL query to replace all dashes '-' with underscores '_' in sku_code using the REPLACE function and display the updated codes.

  SELECT REPLACE(sku_code, '-', '_') AS updated_sku_code FROM products;
