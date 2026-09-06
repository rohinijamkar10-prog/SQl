use food_delivery_db3;

CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO Restaurants
VALUES
(1,'Spice Villa','Surat'),
(2,'Pizza Hub','Ahmedabad'),
(3,'Food Court','Vadodara');

CREATE TABLE RestaurantReviews (
    review_id INT PRIMARY KEY,
    restaurant_id INT,
    rating DECIMAL(2,1)
);

INSERT INTO RestaurantReviews
VALUES
(1,1,4.5),
(2,1,4.2),
(3,2,3.8),
(4,2,4.0),
(5,3,4.8),
(6,3,4.6);

#1)Create a SQL view named TopRatedRestaurants that selects the restaurant name, average rating, and total number of reviews from a table of Zomato-style restaurant reviews, showing only restaurants with an average rating above 4.0.
CREATE VIEW TopRatedRestaurants AS
SELECT
    r.restaurant_name,
    AVG(rr.rating) AS average_rating,
    COUNT(rr.review_id) AS total_reviews
FROM Restaurants r
INNER JOIN RestaurantReviews rr
ON r.restaurant_id = rr.restaurant_id
GROUP BY r.restaurant_name
HAVING AVG(rr.rating) > 4.0;

SELECT * FROM TopRatedRestaurants;

#2)Update the TopRatedRestaurants view to also include the city column from the original restaurants table by joining the relevant tables.<br><br><em><strong>Hint:</strong> Use an INNER JOIN to combine data from both tables in your view definition.</em>
CREATE OR REPLACE VIEW TopRatedRestaurants AS
SELECT
    r.restaurant_name,
    r.city,
    AVG(rr.rating) AS average_rating,
    COUNT(rr.review_id) AS total_reviews
FROM Restaurants r
INNER JOIN RestaurantReviews rr
ON r.restaurant_id = rr.restaurant_id
GROUP BY
r.restaurant_name,
r.city
HAVING AVG(rr.rating) > 4.0;

SELECT * FROM TopRatedRestaurants;


#3)Try to update the average rating column directly through the TopRatedRestaurants view and observe what error or limitation occurs. Write down the exact error message and explain why this happens based on SQL view limitations.
UPDATE TopRatedRestaurants
SET average_rating = 5
WHERE restaurant_name = 'Spice Villa';

#The target table TopRatedRestaurants of the UPDATE is not updatable.
#This error occurs because TopRatedRestaurants is not an updatable view.


CREATE TABLE Orderss (
    order_id INT PRIMARY KEY,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO Orderss
VALUES
(1,'2026-07-10',450),
(2,'2026-07-10',300),
(3,'2026-07-15',800),
(4,'2026-07-20',600),
(5,'2026-07-25',250);

#4)Create a view called DailyOrderSummary that shows, for each date, the total number of food orders and the total revenue from a Swiggy-style orders table. Ensure the view only includes dates from the last 30 days.<br><br><em><strong>Constraint:</strong> Use WHERE and GROUP BY clauses in your view definition.</em>
CREATE VIEW DailyOrderSummary AS
SELECT
    order_date,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue
FROM Orderss
WHERE order_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY order_date;

SELECT * FROM DailyOrderSummary;

#5)List 3 good practices you should follow when creating SQL views for analytics dashboards, and for each, give a one-line example related to a Flipkart sales reporting scenario.
#1. Always use meaningful names
--  Example: CREATE VIEW FlipkartDailySales (not VIEW1)
#2. Always filter only needed data using WHERE
--  Example: WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
#3. Never SELECT * in views, always name columns explicitly
 -- Example: SELECT order_date, SUM(amount) AS revenue