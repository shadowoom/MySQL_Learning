CREATE TABLE shirts (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    article VARCHAR(20) NOT NULL DEFAULT 'default_shirt',
    color VARCHAR(20) NOT NULL DEFAULT 'default_color',
    shirt_size VARCHAR(1) NOT NULL DEFAULT 'S',
    last_worn INT NOT NULL DEFAULT 0
);

ALTER TABLE shirts CHANGE shirt_size shirt_size VARCHAR (3) NOT NULL DEFAULT 'S';

INSERT INTO shirts (article, color, shirt_size, last_worn) VALUES 
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

INSERT INTO shirts (article, color, shirt_size, last_worn) VALUES 
('polo shirt', 'purple', 'M', 50);

SELECT article, color from shirts;

SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size = 'M';

UPDATE shirts SET shirt_size = 'L' WHERE article = 'polo shirt';

UPDATE shirts SET last_worn = 0 WHERE last_worn = 15;

UPDATE shirts SET color = 'off white', shirt_size = 'XS' WHERE color = 'white';

DELETE from shirts WHERE last_worn = 200;

DELETE FROM shirts WHERE article = 'tank top';

DELETE FROM shirts;

TRUNCATE shirts;

DROP TABLE shirts;