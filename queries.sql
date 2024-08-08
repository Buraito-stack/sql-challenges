-- 1. List all transactions
SELECT * 
FROM transactions;

-- 2. List all transactions with columns: transactions.id, products.name, categories.name
SELECT 
    transactions.id,
    products.name AS product_name,
    categories.name AS category_name
FROM
    transactions   
INNER JOIN
    products ON transactions.product_id = products.id
INNER JOIN
    categories ON products.category_id = categories.id;

-- 3. List only 10 transactions, starting from record no 21
SELECT 
    transactions.id,
    transactions.product_id
FROM
    transactions
ORDER BY
    transactions.id
LIMIT 10 OFFSET 20;

-- 4. List transactions only for 'Radio'
SELECT *
FROM 
    transactions
WHERE 
    product_name = 'Radio';

-- 5. List transactions only for 'Radio' between '2024-01-01' and '2024-02-15'
SELECT *
FROM 
    transactions
WHERE 
    product_name = 'Radio'
AND 
    created_at BETWEEN '2024-01-01' AND '2024-02-15';

-- 6. List transactions for 'Microwave' in February 2024
SELECT *
FROM 
    transactions
WHERE 
    product_name = 'Microwave'
AND 
    EXTRACT(MONTH FROM created_at) = 2
AND 
    EXTRACT(YEAR FROM created_at) = 2024;

-- 7. Sum transactions from 'Microwave' in February 2024
SELECT 
    SUM(total) AS total_sum
FROM 
    transactions 
WHERE 
    product_name = 'Microwave' 
AND 
    EXTRACT(MONTH FROM created_at) = 2
AND 
    EXTRACT(YEAR FROM created_at) = 2024;

-- 8. List transactions from 'TV' only in 2024
SELECT *
FROM 
    transactions
WHERE 
    product_name = 'TV'
AND 
    EXTRACT(YEAR FROM created_at) = 2024;

-- 9. Count the number of transactions that 'TV' has for each year
SELECT 
    YEAR(created_at) AS year,
    COUNT(*) AS transaction_count
FROM 
    transactions
WHERE 
    product_name = 'TV'
GROUP BY 
    YEAR(created_at);

-- 10. Sum the qty from all transactions for each product
SELECT
    product_name,
    SUM(qty) AS total_qty
FROM 
    transactions
GROUP BY 
    product_name;

-- 11. Find the average total for all transactions
SELECT
    AVG(total) AS avg_total
FROM 
    transactions;
