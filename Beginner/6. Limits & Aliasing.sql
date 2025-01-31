-- Limit & Aliasing

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1
;

-- Aliasing
select gender, avg(age) AS avg_age
from employee_demographics
group by gender
having avg_age > 40 
;