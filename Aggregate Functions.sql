/*An aggregate function performs a calculation on 
a set of values, and returns a single value. Except for COUNT(*) , 
aggregate functions ignore null values. Aggregate functions are often 
used with the GROUP BY clause of the SELECT statement. 
All aggregate functions are deterministic.*/

use rachna;

-- COUNT function
SELECT project_id, COUNT(*) FROM allocation 
GROUP BY project_id;

use mydb;
SELECT COUNT(*) FROM mystudent 
WHERE percentage>=60;

SELECT COUNT(DISTINCT First_name) FROM mystudent 
WHERE percentage>=60;

-- SUM function
SELECT SUM(percentage) FROM mystudent WHERE percentage>=60;

-- AVERAGE function
SELECT AVG(percentage) FROM mystudent;
-- doubt - getting answer as 60.000. what should i add to get answer in integer instead of float

-- MAX function
SELECT MAX(percentage) FROM mystudent;

-- MIN function
SELECT MIN(percentage) FROM mystudent;

