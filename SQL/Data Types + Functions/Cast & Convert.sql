# Cast and Convert Functions

SELECT CAST("2022-01-01" AS DATETIME);


SELECT birth_date,
CAST(birth_date as DATETIME),
CONVERT(birth_date, DATETIME)
FROM customers
;
