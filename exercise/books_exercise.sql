-- exercise 1

SELECT title FROM books WHERE title LIKE '%stories%';

-- exercise 2

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

-- exercise 3

SELECT 
    CONCAT(
        title,
        ' - ',
        released_year
    ) AS summary
FROM books ORDER BY released_year DESC LIMIT 0,3;

-- exercise 4

SELECT title, author_lname FROM books
WHERE author_lname LIKE '% %';

-- exercise 5

SELECT title, released_year, stock_quantity
FROM books ORDER BY stock_quantity LIMIT 3;

-- exercise 6

SELECT title, author_lname FROM books
ORDER BY author_lname, title;

-- exercise 7

SELECT UPPER(
    CONCAT(
        'my favorite author is ',
        author_fname,
        ' ',
        author_lname,
        '!'
    )
) AS 'yell' FROM books ORDER BY author_lname;

