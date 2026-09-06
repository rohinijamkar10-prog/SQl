use food_delivery_db;
#1)Create two tables in your SQL database: Users (user_id, username, city) and Orders (order_id, user_id, product, amount). Insert at least 3 users and 5 orders, making sure some users have no orders.

CREATE TABLE Userss (
    user_id INT PRIMARY KEY,
    username VARCHAR(100),
    city VARCHAR(50)
);
INSERT INTO Userss VALUES
(1, 'Rohini', 'Valsad'),
(2, 'Amit', 'Surat'),
(3, 'Priya', 'Ahmedabad'),
(4, 'Karan', 'Rajkot');

CREATE TABLE Orderss (
    order_id INT PRIMARY KEY,
    user_id INT,
    product VARCHAR(100),
    amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Userss(user_id)
);
INSERT INTO Orderss VALUES
(101, 1, 'Pizza', 350),
(102, 1, 'Burger', 200),
(103, 2, 'Pasta', 450),
(104, 2, 'Sandwich', 150),
(105, 4, 'Coffee', 120);

SELECT * FROM Userss;
SELECT * FROM Orderss;



CREATE TABLE CustomerSegments (
    segment_id INT PRIMARY KEY,
    segment_name VARCHAR(50)
);

INSERT INTO CustomerSegments VALUES
(1,'Silver'),
(2,'Gold'),
(3,'Platinum');

ALTER TABLE Userss
ADD segment_id INT;

UPDATE Userss SET segment_id=1 WHERE user_id=1;
UPDATE Userss SET segment_id=2 WHERE user_id=2;
UPDATE Userss SET segment_id=3 WHERE user_id=3;
UPDATE Userss SET segment_id=2 WHERE user_id=4;


ALTER TABLE Userss
ADD CONSTRAINT fk_segment
FOREIGN KEY (segment_id)
REFERENCES CustomerSegments(segment_id);

#2)Write an SQL query using INNER JOIN to list all usernames and their ordered products, showing only users who have placed at least one order.
SELECT u.username, o.product
FROM Userss u
INNER JOIN Orderss o
ON u.user_id = o.user_id;

#3)Write an SQL query using LEFT JOIN to display all usernames along with their ordered products. For users who haven't placed any orders, show NULL for the product.
SELECT u.username, o.product
FROM Userss u
LEFT JOIN Orderss o
ON u.user_id = o.user_id;

#4)Write an SQL query using RIGHT JOIN to show all orders and the corresponding username for each order. If an order has a user_id that doesn't exist in the Users table, display NULL for the username.<br><br><em><strong>Hint:</strong> Try deleting one user and keeping their order to test this case.</em>
SELECT u.username, o.order_id, o.product, o.amount
FROM Userss u
RIGHT JOIN Orderss o
ON u.user_id = o.user_id;

#5)Suppose you want to analyze food delivery data like Zomato. Create a CustomerSegments table (segment_id, segment_name), and link it to Users with a foreign key. Write an SQL query to show each username, their segment name, and total order amount (use JOINs as needed).
SELECT
    u.username,
    cs.segment_name,
    SUM(o.amount) AS total_order_amount
FROM Userss u
LEFT JOIN CustomerSegments cs
ON u.segment_id = cs.segment_id
LEFT JOIN Orderss o
ON u.user_id = o.user_id
GROUP BY u.username, cs.segment_name;