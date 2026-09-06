use food_delivery_db2;
#1)Given a table Orders with columns (order_id, user_id, order_date, total_amount), write an SQL query using ROW_NUMBER() to assign a unique sequential number to each order per user, ordered by order_date descending.
SELECT order_id, user_id, order_date, total_amount,
ROW_NUMBER() OVER(PARTITION BY user_id  ORDER BY order_date DESC
    ) AS row_num
FROM Orders;
select * from  Orders;

#2).Suppose you have a table called Songs with columns (song_id, artist, streams). Write an SQL query using RANK() to list each song along with its rank based on streams within each artist.
CREATE TABLE Songs (
    song_id INT PRIMARY KEY,
    artist VARCHAR(100),
    streams INT
);
INSERT INTO Songs VALUES
(1, 'Arijit Singh', 500000),
(2, 'Arijit Singh', 450000),
(3, 'Arijit Singh', 450000),
(4, 'Shreya Ghoshal', 600000),
(5, 'Shreya Ghoshal', 550000),
(6, 'Shreya Ghoshal', 500000),
(7, 'Atif Aslam', 700000),
(8, 'Atif Aslam', 650000),
(9, 'Atif Aslam', 650000);


SELECT song_id, artist, streams,
RANK() OVER(PARTITION BY artist ORDER BY streams DESC) AS song_rank
FROM Songs;


#3)For a table named Movies with columns (movie_id, genre, rating), write an SQL query using DENSE_RANK() to assign a rank to each movie within its genre based on rating, with the highest rating getting rank 1.
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    genre VARCHAR(50),
    rating DECIMAL(3,1)
);
INSERT INTO Movies VALUES
(1, 'Action', 9.2),
(2, 'Action', 8.8),
(3, 'Action', 8.8),
(4, 'Comedy', 8.5),
(5, 'Comedy', 8.0),
(6, 'Comedy', 7.8),
(7, 'Drama', 9.5),
(8, 'Drama', 9.0),
(9, 'Drama', 9.0);


SELECT movie_id, genre,rating,
DENSE_RANK() OVER( PARTITION BY genre ORDER BY rating DESC) AS movie_rank
FROM Movies;


#4)Imagine a table named Influencers with columns (id, platform, followers). Write an SQL query to display the top 3 influencers per platform using ROW_NUMBER(), showing id, platform, followers, and their row number.<br><br><em><strong>Hint:</strong> Use a subquery or CTE to filter for row numbers less than or equal to 3.</em>

CREATE TABLE Influencers (
    id INT PRIMARY KEY,
    platform VARCHAR(50),
    followers INT
);
INSERT INTO Influencers VALUES

(1, 'Instagram', 950000),
(2, 'Instagram', 870000),
(3, 'Instagram', 760000),
(4, 'Instagram', 650000),
(5, 'YouTube', 1200000),
(6, 'YouTube', 1100000),
(7, 'YouTube', 980000),
(8, 'YouTube', 850000),
(9, 'Facebook', 700000),
(10, 'Facebook', 650000),
(11, 'Facebook', 600000),
(12, 'Facebook', 500000);

    WITH RankedInfluencers AS (
    SELECT id,platform, followers,
        ROW_NUMBER() OVER(
            PARTITION BY platform
            ORDER BY followers DESC
        ) AS row_num
    FROM Influencers
)
SELECT id, platform, followers,row_num
FROM RankedInfluencers
WHERE row_num <= 3;

