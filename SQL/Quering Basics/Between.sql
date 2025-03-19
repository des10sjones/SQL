# Between

SELECT *
FROM customers
WHERE total_money_spent BETWEEN 500 AND 1000
;

SELECT *
FROM customers
WHERE total_money_spent BETWEEN 534 AND 1009
;

SELECT *
FROM customers
WHERE total_money_spent BETWEEN 1009 AND 534
;

SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2020-01-01'
;

SELECT *
FROM customers
WHERE city BETWEEN 'Austin' AND 'Scranton'
;

SELECT *
FROM customers
WHERE city BETWEEN 'Dallas' AND 'Scranton'
;

SELECT *
FROM customers
WHERE city BETWEEN 'D' AND 'S'
;

