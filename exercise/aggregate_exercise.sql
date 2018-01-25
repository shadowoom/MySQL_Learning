-- 1. print number of books in db
SELECT COUNT(*) FROM books;

-- 2. print out how many books are released each year
SELECT released_year, COUNT(*) FROM books group by released_year;

-- 3. print out total number of books in stock
SELECT SUM(stock_quantity) FROM books;

-- 4. find the average released year by author
SELECT author_fname, author_lname, AVG(released_year) FROM books
GROUP BY author_fname, author_lname;

-- 5. find the full name of the author who wrote the longest book
SELECT CONCAT(
    author_fname,
    ' ',
    author_lname
) AS full_name FROM books WHERE pages = (SELECT MAX(pages) FROM books);

SELECT CONCAT(
    author_fname,
    ' ',
    author_lname
) AS full_name FROM books ORDER BY pages DESC LIMIT 1;

-- 6
SELECT released_year AS 'year', COUNT(*) AS '# books', AVG(pages) AS 'avg pages'
FROM books GROUP BY released_year;