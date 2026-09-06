create database food_delivery_db3;
use food_delivery_db3;
#1)Write an SQL query using the NOW() function to display the current date and time as 'CurrentDateTime' in your result set.

	SELECT NOW() AS CurrentDateTime;

#2)Suppose you have a table called Orders with a column order_date (DATE type). Write a query to display each order's order_date, the year, month, and day as separate columns using YEAR(), MONTH(), and DAY().
	CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE
);

INSERT INTO Orders VALUES
(101, '2024-01-10'),
(102, '2024-02-15'),
(103, '2024-03-20'),
(104, '2024-04-25'),
(105, '2024-05-30');
Query
SELECT
    order_date,
    YEAR(order_date) AS Year,
    MONTH(order_date) AS Month,
    DAY(order_date) AS Day
FROM Orders;
3. Deliveries Table - Expected Pickup Date
Create Table
CREATE TABLE Deliveries (
    delivery_id INT PRIMARY KEY,
    delivery_date DATE
);
Insert Sample Data
INSERT INTO Deliveries VALUES
(1, '2024-07-10'),
(2, '2024-07-15'),
(3, '2024-07-20'),
(4, '2024-07-25'),
(5, '2024-07-30');
Query
SELECT
    delivery_date,
    DATE_SUB(delivery_date, INTERVAL 2 DAY) AS expected_pickup_date
FROM Deliveries;
4. Subscriptions Table - Subscription Duration
Create Table
CREATE TABLE Subscriptions (
    user_id INT,
    start_date DATE,
    end_date DATE
);
Insert Sample Data
INSERT INTO Subscriptions VALUES
(101, '2024-01-01', '2024-02-01'),
(102, '2024-03-10', '2024-04-15'),
(103, '2024-05-01', '2024-05-31'),
(104, '2024-06-05', '2024-07-05'),
(105, '2024-07-01', '2024-08-01');
Query
SELECT
    user_id,
    start_date,
    end_date,
    DATEDIFF(end_date, start_date) AS total_days
FROM Subscriptions;
#5. AppLogins Table - Users Not Logged in for More Than 30 Days

CREATE TABLE AppLogins (
    user_id INT,
    last_login_date DATE
);
INSERT INTO Orders VALUES
(101, '2024-01-10'),
(102, '2024-02-15'),
(103, '2024-03-20'),
(104, '2024-04-25'),
(105, '2024-05-30');

SELECT order_date, YEAR(order_date) AS Year, MONTH(order_date) AS Month, DAY(order_date) AS Day
FROM Orders;

#3)Imagine you are building a feature like Zomato's order delivery estimate. Given a table Deliveries with a column delivery_date, write a query to show delivery_date and a new column expected_pickup_date which is 2 days before delivery_date using DATE_SUB().
    CREATE TABLE Deliveries (
    delivery_id INT PRIMARY KEY,
    delivery_date DATE
);

INSERT INTO Deliveries VALUES
(1, '2024-07-10'),
(2, '2024-07-15'),
(3, '2024-07-20'),
(4, '2024-07-25'),
(5, '2024-07-30');

SELECT delivery_date, DATE_SUB(delivery_date, INTERVAL 2 DAY) AS expected_pickup_date
FROM Deliveries;

#4)You have a table called Subscriptions with columns user_id, start_date, and end_date. Write a query to display user_id, start_date, end_date, and the total number of days of each subscription using DATEDIFF().<br><br><em><strong>Hint:</strong> Use DATEDIFF(end_date, start_date) to get the duration.</em>
CREATE TABLE Subscriptions (
    user_id INT,
    start_date DATE,
    end_date DATE
);
INSERT INTO Subscriptions VALUES
(101, '2024-01-01', '2024-02-01'),
(102, '2024-03-10', '2024-04-15'),
(103, '2024-05-01', '2024-05-31'),
(104, '2024-06-05', '2024-07-05'),
(105, '2024-07-01', '2024-08-01');

SELECT user_id, start_date, end_date,
    DATEDIFF(end_date, start_date) AS total_days
FROM Subscriptions;

#5)Create an SQL query for a table named AppLogins (columns: user_id, last_login_date) to find all users who haven't logged in for more than 30 days from today. Use NOW() and DATEDIFF() in your query.<br><br><em><strong>Constraint:</strong> Only select user_id and last_login_date for users who meet the criteria.</em>
CREATE TABLE AppLogins (
    user_id INT,
    last_login_date DATE
);

INSERT INTO AppLogins VALUES
(101, '2024-06-01'),
(102, '2024-06-25'),
(103, '2024-07-05'),
(104, '2024-05-20'),
(105, '2024-07-15');

SELECT user_id, last_login_date
FROM AppLogins
WHERE DATEDIFF(NOW(), last_login_date) > 30;