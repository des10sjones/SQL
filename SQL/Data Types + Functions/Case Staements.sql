# CASE Statements

SELECT tip,
order_total,
IF(tip > 1,order_total * .75, order_total * 1.1 ) newTotal
FROM customer_orders
;

SELECT units_in_stock,
CASE
	WHEN units_in_stock < 20 THEN 'ORDER IMMEDIATELY'
    WHEN units_in_stock BETWEEN 21 AND 50 THEN 'Check in 3 days'
    WHEN units_in_stock > 51 THEN 'In Stock'
END AS 'Order Status'
FROM products
;


SELECT units_in_stock,
CASE
	WHEN units_in_stock < 20 THEN 'ORDER IMMEDIATELY'
    WHEN units_in_stock BETWEEN 21 AND 50 THEN 'Check in 3 days'
    ELSE 'In Stock'
END AS 'Order Status'
FROM products
;



SELECT order_id,
order_date,
CASE
	WHEN YEAR(order_date) = 2023 THEN 'Active'
    WHEN YEAR(order_date) =2022 THEN 'Last Year'
    ELSE 'Archived'
END AS 'Year'

FROM customer_orders;