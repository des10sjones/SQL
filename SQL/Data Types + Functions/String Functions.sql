# String Functions

SELECT *
FROM customers;

SELECT LENGTH('sky');

SELECT first_name, LENGTH(first_name) as len_first
FROM customers
ORDER BY len_first
;

SELECT first_name,UPPER(first_name)
FROM customers
;

SELECT first_name,LOWER(first_name)
FROM customers
;

SELECT UPPER(first_name),LOWER(first_name)
FROM customers
;

SELECT '   sky   ',TRIM('   sky   '),LTRIM('   sky   '),RTRIM('   sky   ')
FROM customers
;

SELECT "I      Love      SQL",TRIM("I      Love      SQL");

SELECT LEFT('Destin',4);
SELECT RIGHT('Destin',4);


SELECT first_name, LEFT(first_name,3), RIGHT(first_name,3)
FROM customers;

SELECT SUBSTRING('DESTIN',2,3);


SELECT phone, SUBSTRING(phone,1,3),
SUBSTRING(phone,5,3),
SUBSTRING(phone,9,4),
CONCAT(SUBSTRING(phone,1,3),SUBSTRING(phone,5,3),SUBSTRING(phone,9,4))
FROM customers;


SELECT REPLACE(first_name,'a','z')
FROM customers
;

SELECT REPLACE(phone,'-','')
FROM customers
;

SELECT LOCATE('t','Destin');

SELECT first_name,LOCATE('Mic',first_name)
FROM customers
;




