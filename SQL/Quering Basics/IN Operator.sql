# IN Operator 

SELECT *
FROM customers
WHERE state IN ('PA','TX','IL')
;

SELECT *
FROM customers
WHERE first_name IN ('Kevin','Frodo')
;

SELECT *
FROM customers
WHERE first_name NOT IN ('Kevin','Frodo')
;
