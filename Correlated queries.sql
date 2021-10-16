/*Co-related queries also known as SYNCHRONISED QUERIES
This subquery uses values from outer query having outer to inner query approach
KEYWORD: - exists*/
-- WHERE TO USE IT?
-- WHERE WE GET SOMETHING LIKE LOOPING OR ITERATION 
-- WHERE WE HAVE RELATION BETWEEN OUTER AND INNER QUERY THAT IS WHY KNOWN AS CO-RELATED

-- Find all employees detail who work in a department
SELECT * FROM employees
WHERE EXISTS(SELECT * FROM dept WHERE dept.eid=employees.eid)

-- 1st row of employee will be compared to all the rows of department table making it slower in comparison to non-corelated subqueries
