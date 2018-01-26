-- Exercise 1

SELECT 10 != 10;  -- 0

SELECT 15 > 14 && 99 - 5 <= 94; -- 1

SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; --1

-- Exercise 2 Select All Books Written Before 1980 (non inclusive)

SELECT * FROM books WHERE released_year < 1980;

-- Exercise 3 Select All Books Written By Eggers Or Chabon

SELECT * FROM books WHERE author_lname = 'Eggers' || author_lname = 'Chabon';

-- Exercise 4 Select All Books Written By Lahiri, Published after 2000

SELECT * FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000;

-- Exercise 5 Select All books with page counts between 100 and 200

SELECT * FROM books WHERE pages BETWEEN 100 AND 200;

-- Exercise 6 Select all books where author_lname starts with a 'C' or an 'S''

SELECT * FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

-- Exercise 7 

SELECT title, author_lname,
    CASE 
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title LIKE '%Just Kids%' || title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books;


-- Exercise 8

SELECT title, author_lname, 
    CONCAT(
        COUNT(*),
        CASE 
            WHEN COUNT(*) > 1 THEN ' books'
            ELSE ' book'
        END
    ) AS COUNT
FROM books GROUP BY author_lname, author_fname;
