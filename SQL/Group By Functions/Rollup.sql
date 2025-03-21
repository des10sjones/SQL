# Rollup

SELECT customer_id, SUM(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id WITH ROLLUP
;

SELECT customer_id, COUNT(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id WITH ROLLUP
;