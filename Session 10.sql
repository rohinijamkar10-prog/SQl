create database app;
use app;

#1)Create two tables: AppOrders (for orders placed via a food delivery app like Zomato) and InStoreOrders (for direct restaurant orders), each with columns: order_id, customer_name, amount, and order_date. Insert at least 3 sample records into each table.

CREATE TABLE AppOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO AppOrders VALUES
(101, 'Rohini', 350.00, '2026-07-20'),
(102, 'Amit', 450.00, '2026-07-21'),
(103, 'Priya', 250.00, '2026-07-22');


CREATE TABLE InStoreOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    amount DECIMAL(10,2),
    order_date DATE
);

#2)Write a SQL query using UNION to combine all unique customer names from both AppOrders and InStoreOrders tables into a single list.
SELECT customer_name
FROM AppOrders

UNION

SELECT customer_name
FROM InStoreOrders;

#3)Write a SQL query using UNION ALL to display every order (including duplicates if any) from both AppOrders and InStoreOrders, showing order_id, customer_name, amount, and order_date.
SELECT order_id, customer_name, amount, order_date FROM AppOrders
UNION ALL
SELECT order_id, customer_name, amount, order_date
FROM InStoreOrders;


INSERT INTO InStoreOrders VALUES
(201, 'Neha', 300.00, '2026-07-20'),
(202, 'Amit', 500.00, '2026-07-21'),
(203, 'Karan', 400.00, '2026-07-22');


#4)Demonstrate the difference between UNION and UNION ALL by adding a duplicate customer_name in both tables, then running both queries and noting the difference in the result count.<br><br><em><strong>Hint:</strong> UNION removes duplicates, UNION ALL does not.</em>
INSERT INTO AppOrders VALUES
(104, 'Neha', 600.00, '2026-07-23');

INSERT INTO InStoreOrders VALUES
(204, 'Neha', 450.00, '2026-07-24');

SELECT customer_name FROM AppOrders
UNION
SELECT customer_name FROM InStoreOrders;

SELECT customer_name FROM AppOrders
UNION ALL
SELECT customer_name FROM InStoreOrders;


