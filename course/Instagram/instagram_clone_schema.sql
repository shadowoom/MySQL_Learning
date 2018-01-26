DROP DATABASE IF EXISTS ig_clone;
CREATE DATABASE ig_clone;
USE ig_clone;

-- CREATE USER TABLE
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- CREATE PHOTO TABLE
DROP TABLE IF EXISTS photos;
CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY photo_user_fk (user_id) REFERENCES users(id)
);

-- CREATE COMMENTS TABLE
DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY comment_user_fk (user_id) REFERENCES users(id),
    FOREIGN KEY comment_photo_fk (photo_id) REFERENCES photos(id)
);

-- CREATE LIKE TABLE
DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY like_user_fk (user_id) REFERENCES users(id),
    FOREIGN KEY like_photo_fk (photo_id) REFERENCES photos(id),
    PRIMARY KEY (user_id, photo_id)
);

-- CREATE FOLLOWER/FOLLOWEE TABLE
DROP TABLE IF EXISTS follows;
CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY follower_user_fk (follower_id) REFERENCES users(id),
    FOREIGN KEY followee_user_fk (followee_id) REFERENCES users(id),
    PRIMARY KEY (follower_id, followee_id)
);

-- CREATE NOT FOLLOWER/FOLLOWEE TABLE
DROP TABLE IF EXISTS unfollows;
CREATE TABLE unfollows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY follower_user_fk (follower_id) REFERENCES users(id),
    FOREIGN KEY followee_user_fk (followee_id) REFERENCES users(id),
    PRIMARY KEY (follower_id, followee_id)
);

-- CREATE HASHTAGS TABLE
DROP TABLE IF EXISTS tags;
CREATE TABLE tags (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

DROP TABLE IF EXISTS photo_tags;
CREATE TABLE photo_tags(
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY tag_photo_fk (tag_id) REFERENCES tags(id),
    FOREIGN KEY photo_tag_fk (photo_id) REFERENCES photos(id),
    PRIMARY KEY (photo_id, tag_id)
);



