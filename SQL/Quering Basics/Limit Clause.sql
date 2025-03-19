# Limits

SELECT *
FROM customers
;

SELECT *
FROM customers
LIMIT 5
;

SELECT *
FROM customers
WHERE total_money_spent > 10000
LIMIT 5
;

SELECT *
FROM customers
ORDER BY total_money_spent DESC
LIMIT 5
;

SELECT *
FROM customers
ORDER BY total_money_spent DESC
LIMIT 5,2
;