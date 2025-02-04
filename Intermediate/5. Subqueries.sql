-- Subqueries

SELECT *
FROM employee_salary
ORDER BY dept_id, first_name;


SELECT *
FROM employee_demographics
ORDER BY first_name ;

SELECT *
FROM employee_demographics
WHERE employee_id in
				(SELECT employee_id
                    FROM employee_salary
                    WHERE dept_id = 1)
ORDER BY first_name;

SELECT first_name,
salary, 
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary
;

SELECT gender,AVG(age), MAX(age),MIN(age), COUNT(age) 
FROM employee_demographics
GROUP BY gender
;

SELECT AVG(Max_age), AVG(Min_age),AVG(count_age)
FROM 
(SELECT gender,
AVG(age) as Avg_age, 
MAX(age) as Max_age,
MIN(age) as Min_age,
COUNT(age) as count_age
FROM employee_demographics
GROUP BY gender) AS Agg_table

;