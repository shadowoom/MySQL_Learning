-- problem 1 --

SELECT 
    title,
    rating
FROM series INNER JOIN reviews 
ON series.id = reviews.series_id;

-- problem 2 avg rating --

SELECT 
    title,
    AVG(rating) AS avg_rating
FROM series INNER JOIN reviews 
ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY avg_rating;

-- problem 3 --

SELECT 
    first_name,
    last_name,
    rating
FROM reviewers 
INNER JOIN reviews 
    ON reviewers.id = reviews.reviewer_id; 

SELECT
    first_name,
    last_name,
    rating
FROM reviews
INNER JOIN reviewers
    ON reviewers.id = reviews.reviewer_id;
    
-- problem 4 unreviewed series--
SELECT 
    title AS unreviewed_series
FROM series 
LEFT JOIN reviews
    ON series.id = reviews.series_id
    WHERE rating IS NULL;
    
-- problem 5 find average rating for genre--
SELECT 
    genre,
    ROUND(AVG(IFNULL(rating, 0)), 2) AS avg_rating
FROM series
LEFT JOIN reviews
    ON series.id = reviews.series_id
GROUP BY genre;

SELECT genre, 
       Round(Avg(rating), 2) AS avg_rating 
FROM   series 
       INNER JOIN reviews 
               ON series.id = reviews.series_id 
GROUP  BY genre; 

-- problem 6 --

SELECT 
    first_name,
    last_name,
    CASE
        WHEN rating IS NULL THEN 0
        ELSE COUNT(*)
    END AS COUNT,
    MIN(IFNULL(rating,0)) AS MIN,
    MAX(IFNULL(rating,0)) AS MAX,
    AVG(IFNULL(rating,0)) AS AVG,
    CASE
        WHEN rating IS NULL THEN 'INACTIVE'
        ELSE 'ACTIVE'
    END AS STATUS
FROM reviewers LEFT JOIN reviews
ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;

-- CHALLENGE 6 - Reviewer Stats 

SELECT first_name, 
       last_name, 
       Count(rating)                               AS COUNT, 
       Ifnull(Min(rating), 0)                      AS MIN, 
       Ifnull(Max(rating), 0)                      AS MAX, 
       Round(Ifnull(Avg(rating), 0), 2)            AS AVG, 
       IF(Count(rating) > 0, 'ACTIVE', 'INACTIVE') AS STATUS 
FROM   reviewers 
       LEFT JOIN reviews 
              ON reviewers.id = reviews.reviewer_id 
GROUP  BY reviewers.id; 
-- CHALLENGE 6 - Reviewer Stats With POWER USERS 

SELECT first_name, 
       last_name, 
       Count(rating)                    AS COUNT, 
       Ifnull(Min(rating), 0)           AS MIN, 
       Ifnull(Max(rating), 0)           AS MAX, 
       Round(Ifnull(Avg(rating), 0), 2) AS AVG, 
       CASE 
         WHEN Count(rating) >= 10 THEN 'POWER USER' 
         WHEN Count(rating) > 0 THEN 'ACTIVE' 
         ELSE 'INACTIVE' 
       end                              AS STATUS 
FROM   reviewers 
       LEFT JOIN reviews 
              ON reviewers.id = reviews.reviewer_id 
GROUP  BY reviewers.id; 


-- problem 7 --

SELECT 
    s.title,
    r.rating,
    CONCAT(a.first_name, ' ', a.last_name) AS reviewer
FROM series s 
INNER JOIN reviews r ON s.id = r.series_id
INNER JOIN reviewers a ON r.reviewer_id = a.id
ORDER BY s.title;
