# Having Clause vs Where

SELECT customer_id,SUM(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id
HAVING total_tips > 5
ORDER BY 2
;

SELECT customer_id,SUM(order_total) AS total
FROM customer_orders
GROUP BY customer_id
HAVING total > 40
ORDER BY 2
;