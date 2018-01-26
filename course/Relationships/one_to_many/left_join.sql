SELECT first_name, last_name, order_date, amount 
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;
    
    
SELECT 
    first_name, 
    last_name, 
    CASE
        WHEN SUM(amount) IS NULL THEN 0
        ELSE SUM(amount) 
    END AS total_spend
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id;

SELECT 
    first_name, 
    last_name, 
    IFNULL(SUM(amount), 0) AS total_spend
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spend DESC;


--------------------------------------------------------------------------------

-- LEFT JOINS

SELECT * FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;
    
SELECT first_name, last_name, order_date, amount
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id; 
    
    
SELECT 
    first_name, 
    last_name,
    IFNULL(SUM(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;