
CREATE DATABASE zomato_db1;
USE zomato_db;
Drop database zomato_db1;
USE zomato_db;

SHOW TABLES;
SELECT * FROM zomato ;
#1)Write an SQL query to find the top 5 highest-rated restaurants in Koramangala, showing their name, average rating, and number of votes.

SELECT 
    `Restaurant Name` AS name,
    `Aggregate rating` AS average_rating,
    Votes
FROM zomato
WHERE Locality LIKE '%Koramangala%'
ORDER BY `Aggregate rating` DESC
LIMIT 5;

#2)Using the Zomato Bangalore dataset, create an SQL query that lists all unique cuisines available in Indiranagar along with the count of restaurants offering each cuisine
SELECT 
    Cuisines, 
    COUNT(*) AS restaurant_count
FROM zomato
WHERE 
    LOWER(TRIM(City)) = 'Bangalore' 
    AND LOWER(TRIM(Locality)) = 'Indiranagar'
GROUP BY Cuisines
ORDER BY restaurant_count DESC;


#3)Write an SQL query to calculate the average cost for two people for each restaurant type (such as 'Cafe', 'Casual Dining', etc.) and order the results from most to least expensive.
SELECT  Cuisines, 
    AVG("Average Cost for two") AS avg_cost_for_two
FROM  zomato
GROUP BY Cuisines
ORDER BY avg_cost_for_two DESC;

#4)Find all restaurants that have a rating below 3.0 but more than 200 votes, and suggest a possible marketing action for these based on your findings.<br><br><em><strong>Hint:</strong> Think about discounts, partnerships, or events to improve ratings or attract new customers.</em>
SELECT 
    Restaurant Name,
    City,
    Aggregate_rating,
    Votes,
    Rating_text
FROM zomato
WHERE Aggregate_rating < 3.0 
  AND Votes > 200
ORDER BY Aggregate_rating ASC, Votes DESC;


#5)Use ChatGPT to generate an SQL query that segments restaurants into three market categories: 'Budget' (cost for two < 500), 'Mid-range' (500-1500), and 'Premium' (>1500). Test and run the query on your dataset, and paste the working query in your submission.
USE zomato_db;

SELECT
    CASE
        WHEN `Average Cost for two` < 500 THEN 'Budget'
        WHEN `Average Cost for two` BETWEEN 500 AND 1500 THEN 'Mid-range'
        WHEN `Average Cost for two` > 1500 THEN 'Premium'
    END AS market_category,
    COUNT(*) AS restaurant_count
FROM zomato
GROUP BY market_category
ORDER BY
    CASE market_category
        WHEN 'Budget' THEN 1
        WHEN 'Mid-range' THEN 2
        WHEN 'Premium' THEN 3
    END;