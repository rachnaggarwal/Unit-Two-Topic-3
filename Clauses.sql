/* SYNTAX OF CLAUSES WHERE, HAVING, GROUP BY, ORDER BY
SELECT column
FROM table_name
WHERE conditions
GROUP BY column
HAVING
ORDER BY column
*/

Use rachna;
Select * from allocation
WHERE amount_per_day>300 
GROUP BY role_id
Having YEAR(from_date)=2013
ORDER BY emp_id;

-- PROJECT having maximum number of EMPLOYEES
SELECT project_id, COUNT(*) AS emp_count
FROM allocation 
GROUP BY project_id
HAVING COUNT(*)>=ALL(SELECT COUNT(*) FROM allocation GROUP BY project_id);
