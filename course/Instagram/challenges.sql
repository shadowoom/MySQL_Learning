-- 1. Find the 5 oldest users
SELECT * FROM users ORDER BY created_at ASC LIMIT 5;

-- 2. Find the day of week do most users register
SELECT 
    DATE_FORMAT(created_at, '%W') AS day_of_week,
    COUNT(*) AS number_of_user
FROM users
GROUP BY day_of_week
ORDER BY number_of_user DESC LIMIT 1;

-- 3. Find the users who have never posted a photo
SELECT 
    users.username,
    users.created_at
FROM
users LEFT JOIN photos
ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- 4. Single most liked photo
SELECT
    users.username,
    image_url,
    COUNT(*) AS number_of_like
FROM
photos INNER JOIN likes
ON photos.id = likes.photo_id
INNER JOIN users ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY number_of_like DESC LIMIT 1;

-- 5. Find out average times users post
SELECT AVG(userposts.count) AS avg
FROM(
    SELECT 
        username,
        IFNULL(COUNT(photos.id), 0) AS count
    FROM users LEFT JOIN photos
    ON users.id = photos.user_id
    GROUP BY users.id
) userposts;

-- another solution

SELECT (SELECT Count(*) 
        FROM   photos) / (SELECT Count(*) 
                          FROM   users) AS avg; 
                          

-- 6. Top 5 commonly used hashtags;
SELECT 
    tags.tag_name,
    COUNT(*) AS count
FROM tags
INNER JOIN photo_tags ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY count DESC LIMIT 5;

-- 7. Find users who have liked every single photo on the site;

SELECT 
    user_like.username,
    user_like.total_likes
FROM
    (SELECT 
        username,
        count(likes.photo_id) as total_likes
    FROM users INNER JOIN
    likes ON users.id = likes.user_id
    GROUP BY users.id) user_like
WHERE user_like.total_likes = (SELECT COUNT(*) FROM photos);

-- solution 2
SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 





