CREATE TABLE employees (
    id INT NOT NULL AUTO_INCREMENT, 
    last_name VARCHAR(20) NOT NULL, 
    first_name VARCHAR(20) NOT NULL, 
    middle_name VARCHAR(20), 
    age INT NOT NULL, 
    current_status VARCHAR(20) NOT NULL DEFAULT 'employed', 
    PRIMARY KEY (id));
    
INSERT INTO employees (first_name, last_name, age) VALUES ('Dora', 'Smith', 52);

CREATE TABLE employees (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    last_name VARCHAR(20) NOT NULL, 
    first_name VARCHAR(20) NOT NULL, 
    middle_name VARCHAR(20), 
    age INT NOT NULL, 
    current_status VARCHAR(20) NOT NULL DEFAULT 'employed'
);