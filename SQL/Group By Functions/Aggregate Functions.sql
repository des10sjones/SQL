#Aggrerate Functions

SELECT customer_id,SUM(tip) AS totalTips
FROM customer_orders
GROUP BY customer_id
;

SELECT customer_id,AVG(tip) AS averageTips
FROM customer_orders
GROUP BY customer_id
;

SELECT customer_id,MAX(tip) AS biggestTips,MIN(tip) AS smallestTips,COUNT(tip) AS count_of_tips
FROM customer_orders
GROUP BY customer_id
;

SELECT first_name,last_name, COUNT(phone)
FROM customers
GROUP BY first_name,last_name
;

SELECT product_id,tip,COUNT(tip),COUNT(DISTINCT tip)
FROM customer_orders
GROUP BY product_id,tip
ORDER BY product_id
;