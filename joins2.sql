/*An aggregate function performs a calculation on a set of values,
 and returns a single value. Except for COUNT(*) 
 aggregate functions ignore null values. */
use rachna;

-- Very Important
SELECT emp_name, MAX(salary) AS highest_pay FROM employee;
-- getting wrong output. getting emp_name of 1st row not related to highest pay 
-- correct
SELECT emp_name FROM employee
WHERE salary=(SELECT Max(salary) FROM employee);

-- Join statemnt is used to combine rows of data from two or more tables based on a common field between them
SELECT e.emp_name, s.skill_id, e.dept_no, e.mobile_no FROM employee AS e
INNER JOIN employeeskill AS s ON e.emp_id=s.emp_id
ORDER BY s.skill_id;

SELECT e.emp_name, s.skill_id, e.dept_no, e.mobile_no FROM employee AS e
INNER JOIN employeeskill AS s ON e.emp_id=s.emp_id
ORDER BY s.skill_id DESC;

SELECT e.emp_name, p.project_id, e.dept_no, e.mobile_no FROM employee AS e
INNER JOIN allocation AS p ON e.emp_id=p.emp_id
WHERE emp_name = 'Kumar'
Group By p.project_id /*removes duplicate rows*/
HAVING e.dept_no='D002'
ORDER BY p.project_id DESC;

SELECT e.emp_name, p.project_id, e.dept_no, e.mobile_no FROM employee AS e
LEFT JOIN allocation AS p ON e.emp_id=p.emp_id
WHERE p.project_id is null;

SELECT e.emp_name, p.project_id, e.dept_no, e.mobile_no FROM employee AS e
RIGHT JOIN allocation AS p ON e.emp_id=p.emp_id
ORDER BY p.project_id;

-- self join
-- emloyees having same salary
SELECT A.emp_name AS emp1, B.emp_name AS emp2, A.salary
FROM employee A, employee B
WHERE A.emp_id<>B.emp_id
AND A.salary=B.salary
GROUP BY A.salary;

-- Full join not supported by MYSQL workbench
-- Left join UNION righ join
SELECT e.emp_name, p.project_id, e.dept_no, e.mobile_no FROM employee AS e
LEFT JOIN allocation AS p ON e.emp_id=p.emp_id 
UNION
SELECT e.emp_name, p.project_id, e.dept_no, e.mobile_no FROM employee AS e
RIGHT JOIN allocation AS p ON e.emp_id=p.emp_id;

-- CROSS join
SELECT e.emp_id, p.project_id FROM employee AS e
CROSS JOIN project AS p;