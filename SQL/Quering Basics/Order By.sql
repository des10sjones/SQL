#Order By

SELECT * 
FROM customers
;

SELECT * 
FROM customers
ORDER BY first_name DESC
;

SELECT * 
FROM customers
ORDER BY state,total_money_spent DESC
;

SELECT * 
FROM customers
ORDER BY state DESC,total_money_spent DESC
;

SELECT * 
FROM customers
ORDER BY 8 DESC,9 ASC
;