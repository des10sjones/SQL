# Aliasing 

SELECT *
FROM products
;

SELECT product_name AS 'Goodie Name',units_in_stock 'uis'
FROM products
;

SELECT units_in_stock * sale_price 'Potential_Revenue'
FROM products
;

