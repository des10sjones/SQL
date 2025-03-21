# Date and Date format function

SELECT *
From customers
;

SELECT NOW(),
CURDATE(),
CURTIME();

SELECT YEAR(NOW()),
MONTH(NOW()),
DAY(NOW());

SELECT *
From customers
WHERE YEAR(birth_date) = YEAR(NOW())
;


SELECT *
From customer_orders
WHERE YEAR(order_date) + 5 = YEAR(NOW()) 
;

SELECT *
From customer_orders
WHERE YEAR(order_date) + 5 = YEAR(NOW()) -1

;



SELECT DAYNAME(NOW())
;

SELECT order_date,DAYNAME(order_date),MONTHNAME(order_date)
From customer_orders;


select birth_date, DATE_FORMAT(birth_date,'%M,%D,%Y'),DATE_FORMAT(birth_date,'%m,%d,%Y')

from customers
;

select birth_date, DATE_FORMAT(birth_date,'%m,%d,%Y')
from customers
;


select birth_date, DATE_FORMAT(birth_date,'%m-%d-%Y')
from customers
;
