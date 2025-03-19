# LIKE Operator

SElECT *
FROM customers
;

SElECT *
FROM customers
WHERE first_name LIKE  'k%'
;

SElECT *
FROM customers
WHERE first_name LIKE  '%n'
;

SElECT *
FROM customers
WHERE first_name LIKE  '%n%'
;

SElECT *
FROM customers
WHERE first_name LIKE  '__n'
;

SElECT *
FROM customers
WHERE first_name LIKE  '_o_'
;

SElECT *
FROM customers
WHERE first_name LIKE  '___kin'
;

SElECT *
FROM customers
WHERE last_name LIKE  's_____%'
;

SElECT *
FROM customers
WHERE phone LIKE  '975-%'
;