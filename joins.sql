use rachna;
SELECT * FROM employee
INNER JOIN allocation ON employee.emp_id= allocation.emp_id
ORDER BY employee.emp_id;
-- selects records that have matching values in both tables

SELECT * FROM employee
LEFT JOIN allocation ON employee.emp_id= allocation.emp_id
ORDER BY employee.emp_id;
-- All rows of employee table where joined as anish had no project still he was displayed

SELECT * FROM employee
Right JOIN allocation ON employee.emp_id= allocation.emp_id
ORDER BY employee.emp_id;
-- returns all records from right table

SELECT * FROM employee
FULL JOIN allocation ON employee.emp_id= allocation.emp_id
ORDER BY employee.emp_id;