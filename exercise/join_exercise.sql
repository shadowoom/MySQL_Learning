CREATE TABLE students(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(100)
);

CREATE TABLE papers(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    title VARCHAR(100),
    grade INT NOT NULL DEFAULT 0,
    student_id INT,
    FOREIGN KEY papers_students_fk (student_id) 
        REFERENCES students(id)
        ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- Exercise 1
SELECT 
    s.first_name,
    p.title,
    p.grade
FROM students s INNER JOIN papers p ON s.id = p.student_id
ORDER BY p.grade DESC;  

-- Exercise 2
SELECT 
    s.first_name,
    p.title,
    p.grade
FROM students s LEFT JOIN papers p ON s.id = p.student_id;

-- Exercise 3
SELECT 
    s.first_name,
    IFNULL(p.title, 'Missing') AS title,
    IFNULL(p.grade, 0) AS grade
FROM students s LEFT JOIN papers p ON s.id = p.student_id;

-- Exercise 4
SELECT 
    s.first_name,
    AVG(IFNULL(p.grade, 0)) AS average
FROM students s LEFT JOIN papers p ON s.id = p.student_id
GROUP BY s.first_name
ORDER BY average DESC;

-- Exercise 5
SELECT 
    s.first_name AS first_name,
    AVG(IFNULL(p.grade, 0)) AS average,
    CASE
        WHEN  AVG(IFNULL(p.grade, 0)) < 75 THEN 'FAILING'
        ELSE 'PASSING'
    END AS passing_status
FROM students s LEFT JOIN papers p ON s.id = p.student_id
GROUP BY s.first_name
ORDER BY average DESC;



