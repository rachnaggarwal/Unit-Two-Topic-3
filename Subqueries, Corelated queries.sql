/*Subqueries vs Co-related queries
With a normal nested subquery, the inner SELECT query runs first and executes once, 
returning values to be used by the main query. A correlated subquery, 
however, executes once for each candidate row considered by the outer query. 
In other words, the inner query is driven by the outer query.*/
use mydb;
-- Subquery (Query inside query)
SELECT * FROM mystudent where id IN (SELECT id FROM mystudent WHERE percentage>=60);

Use rachna;
-- Co-related query
SELECT project_id, SUM(amount_per_day) as Sum
FROM allocation
Group by project_id
HAVING SUM(amount_per_day)>=ALL(SELECT SUM(amount_per_day) FROM allocation Group by project_id);