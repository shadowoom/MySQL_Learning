/* exercise 1 */

DECLARE @str1 VARCHAR(44);
SET @str1 = "Why does my cat look at me with such hatred?";

SELECT UPPER(REVERSE (@str1)) AS 'Capitalized Reversed String';

/* exercise 2 */
SELECT
    REPLACE
   (
        CONCAT('I', ' ', 'like', ' ', 'cats'),
        ' ',
        '-'
    ) AS 'Exercise 2';

/* exercise 3 */

SELECT REPLACE(title, ' ', '->') AS 'title' FROM books;

/* exercise 4 */

SELECT 
    author_lname AS forwards, 
    REVERSE(author_lname) AS backwards
FROM books;

/* exercise 5 */
SELECT 
    UPPER 
    ( 
        CONCAT(author_fname, ' ', author_lname)
    ) AS 'full name in caps'
FROM books;

/* exercise 6 */

SELECT 
    CONCAT(title, ' was released in ', released_year) AS 'book release year'
FROM books;

/* exercise 6 */

SELECT 
    title,
    CHAR_LENGTH (title) AS 'character count'
FROM books;

/* exercise 7 */

SELECT 
    CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
    CONCAT(author_lname, ',', author_fname) AS 'author',
    CONCAT(stock_quantity, ' in stock') AS 'quantity'
FROM books;