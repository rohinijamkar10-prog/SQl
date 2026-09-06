create Database food_delivery_db4;
use  food_delivery_db4;
CREATE TABLE large_orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  product VARCHAR(50),
  category VARCHAR(50),
  amount INT
);

DELIMITER //
CREATE PROCEDURE InsertLargeOrders()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 10000 DO
    INSERT INTO large_orders (user_id, product, category, amount)
    VALUES (
      FLOOR(1 + RAND() * 100),
      ELT(FLOOR(1 + RAND() * 3), 'Pizza', 'Burger', 'Pasta'),
      ELT(FLOOR(1 + RAND() * 3), 'Food', 'Electronics', 'Fashion'),
      FLOOR(100 + RAND() * 5000)
    );
    SET i = i + 1;
  END WHILE;
END //
DELIMITER ;
 
CALL InsertLargeOrders();

#1)Run a SELECT query on a large 'orders' table (at least 10,000 rows) to find all orders for a specific user_id and measure the query execution time.
SELECT * FROM large_orders WHERE user_id = 5;

#2)Create an index on the user_id column of the 'orders' table and re-run the same SELECT query to measure the new execution time.<br><br><em><strong>Hint:</strong> Use CREATE INDEX idx_user_id ON orders(user_id); and compare the times before and after.</em>
CREATE INDEX idx_user_id ON large_orders(user_id);
SELECT * FROM large_orders WHERE user_id = 5;

#3)Use the EXPLAIN PLAN command to analyze how your SELECT query runs before and after adding the index, and write down the key differences you observe in the output.
EXPLAIN SELECT * FROM large_orders WHERE user_id = 5;

#4).Write a query for a 'products' table that avoids a full table scan by using an index on the 'category' column to fetch all products in a specific category.
CREATE INDEX idx_category ON large_orders(category);
SELECT * FROM large_orders WHERE category = 'Electronics';

#5)Suppose your SELECT query on the 'orders' table is still slow even after adding an index. Use EXPLAIN PLAN and research at least one more optimization technique (other than indexing) using an AI tool like ChatGPT or Copilot, and describe how you would apply it.
EXPLAIN SELECT * FROM large_orders WHERE user_id = 5;
SELECT order_id, amount FROM large_orders WHERE user_id = 5;