# IF Functions

# IF (condition, output if true, output if false)

SELECT *
FROM customer_orders
;


SELECT tip,
IF(tip > 1,'Awesome','Brokie...')
FROM customer_orders
;

SELECT tip,
order_total,
IF(tip > 1,order_total * .75, order_total * 1.1 ) newTotal
FROM customer_orders
;



SELECT tip,
IF(tip > 2,'Awesome','Brokie...')
FROM customer_orders
;

