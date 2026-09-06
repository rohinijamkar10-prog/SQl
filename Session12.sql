create database food_delivery_db1;
use food_delivery_db1;
CREATE TABLE SpotifyArtists (
    artist_id INT PRIMARY KEY,
    name VARCHAR(100),
    followers INT
);

INSERT INTO SpotifyArtists VALUES
(1,'Arijit Singh',5000000),
(2,'Taylor Swift',9000000),
(3,'Ed Sheeran',8500000),
(4,'Shreya Ghoshal',4500000),
(5,'Atif Aslam',6000000);

CREATE TABLE FlipkartOrders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO FlipkartOrders VALUES
(1,101,'2023-01-10',1200),
(2,102,'2023-01-15',1500),
(3,101,'2023-02-12',2500),
(4,103,'2023-02-20',1800),
(5,104,'2023-03-05',3000);

CREATE TABLE ZomatoRestaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    rating DECIMAL(2,1)
);

INSERT INTO ZomatoRestaurants VALUES
(1,'Dominos','Surat',4.5),
(2,'Pizza Hut','Surat',4.2),
(3,'KFC','Ahmedabad',3.8),
(4,'McDonalds','Ahmedabad',4.3),
(5,'Subway','Rajkot',4.7);


CREATE TABLE IPLMatches (
    match_id INT,
    team VARCHAR(100),
    runs INT,
    match_year INT
);

INSERT INTO IPLMatches VALUES
(1,'CSK',250,2023),
(2,'CSK',300,2023),
(3,'MI',1800,2023),
(4,'MI',500,2023),
(5,'RCB',1500,2023),
(6,'RCB',600,2023);


#1)Write an SQL query using the WITH clause to create a temporary result set called TopArtists that selects the top 3 most-followed artists from a table SpotifyArtists (columns: artist_id, name, followers), then select all rows from TopArtists.

WITH TopArtists AS (
    SELECT * FROM SpotifyArtists
    ORDER BY followers DESC
    LIMIT 3
)
SELECT * FROM TopArtists;


#2)Using a table named FlipkartOrders (columns: order_id, user_id, order_date, total_amount), write a query with a CTE called MonthlyTotals that calculates the total sales amount for each month in 2023, then select the month with the highest total sales from MonthlyTotals.<br><br><em><strong>Hint:</strong> Use EXTRACT(MONTH FROM order_date) or DATE_FORMAT(order_date, '%m') depending on your SQL dialect.</em>

WITH MonthlyTotals AS (
    SELECT  MONTH(order_date) AS month_no, SUM(total_amount) AS total_sales
    FROM FlipkartOrders
    WHERE YEAR(order_date)=2023
    GROUP BY MONTH(order_date)
)
SELECT * FROM MonthlyTotals
ORDER BY total_sales DESC
LIMIT 1;


#3)Create a recursive CTE to generate a list of dates for the next 7 days starting from today in a table called CalendarDays (columns: day_date).<br><br><em><strong>Hint:</strong> Use UNION ALL inside your CTE and limit recursion to 7 levels.</em>

WITH RECURSIVE CalendarDays AS (
    SELECT CURDATE() AS day_date
    UNION ALL
    SELECT DATE_ADD(day_date, INTERVAL 1 DAY)
    FROM CalendarDays
    WHERE day_date < DATE_ADD(CURDATE(), INTERVAL 6 DAY)
)
SELECT * FROM CalendarDays;


#4)Given a table called ZomatoRestaurants (columns: id, name, city, rating), use a CTE to find the average rating for each city, then select all restaurants in cities where the average rating is above 4.0.
WITH CityAverage AS (
    SELECT city, AVG(rating) AS avg_rating FROM ZomatoRestaurants
    GROUP BY city
)
SELECT z.*
FROM ZomatoRestaurants z
JOIN CityAverage c
ON z.city = c.city
WHERE c.avg_rating > 4.0;

#5)Use ChatGPT or Copilot to help you write an SQL query with a CTE that, given a table IPLMatches (columns: match_id, team, runs, match_year), calculates the total runs scored by each team in 2023 and lists only teams with more than 2000 runs.
WITH TeamRuns AS (
    SELECT
        team,
        SUM(runs) AS total_runs
    FROM IPLMatches
    WHERE match_year = 2023
    GROUP BY team
)
SELECT * FROM TeamRuns
WHERE total_runs > 2000;