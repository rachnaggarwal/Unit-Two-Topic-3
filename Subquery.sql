/*What is a subquery?
Subquery is a select query that is enclosed inside another query
The inner select query is usually used to determine the results of the outer select query*/
use world;
SELECT Name FROM country
WHERE SurfaceArea = (SELECT Max(SurfaceArea) FROM country);

SELECT * FROM country
WHERE Name='Aruba';

-- Display the region with the maximum population from the COUNTRY table
SELECT Region FROM country
WHERE Population IN (SELECT Max(Population) FROM country);

-- or
SELECT Region FROM country
WHERE Population = (SELECT Max(Population) FROM country);

/* First inner query gets executed based on that outer query is executed 
For eg in above example: - First we get max(population) as output then Region as output*/

-- Types of Subqueries
-- Subqueries with SELECT, UPDATE, INSERT and DELETE

/*SYNTAX WITH SELECT
SELECT column_name FROM table 
WHERE cloumn_name OPERATOR (SELECT column_name FROM table [WHERE]) */

SELECT COUNT(Region) FROM country
WHERE Population > (SELECT AVG(Population) FROM country);

/*SYNTAX WITH INSERT
INSERT INTO table_name SELECT column_name FROM table
WHERE cloumn_name OPERATOR (SELECT column_name FROM table [WHERE]) */

create table products(
prod_id INT NOT NULL,
item varchar(30),
sell_price float,
product_type varchar(30),
PRIMARY KEY(prod_id)
);
TRUNCATE products;
INSERT INTO products VALUE ('101','Jewley',1800, 'Luxury'); 
INSERT INTO products VALUE ('102','gem',231, 'Non-Luxury'); 
INSERT INTO products VALUE ('103','Jey',1980, 'Luxury');
INSERT INTO products VALUE ('104','Plat',980, 'Non-Luxury'); 
INSERT INTO products VALUE ('105','grease',900, 'Non-Luxury'); 
SELECT * from products;

CREATE TABLE orders(
order_id INT NOT NULL,
product_sold varchar(30),
selling_price float,
PRIMARY KEY(order_id)
);

TRUNCATE orders;

INSERT INTO orders 
SELECT prod_id, item, sell_price FROM products
WHERE product_type IN (SELECT product_type from products where sell_price>1000);

SELECT * FROM orders;

-- Subquery with UPDATE
/*UPDATE table SET column_name = new_value WHERE OPERATOR value
(SELECT column_name FROM table WHERE);*/

-- I want to update the salary of the employee with age greater than 27 years
UPDATE employees SET salary = salary*0.35 
WHERE AGE IN (SELECT age from Employee WHERE age>=27);

-- NOTE: - = is used as operator in subquery with where when we get single record as output from inner query.
-- = is used as operator in subquery with where when we get multiple record as output from inner query.

/*Subquery for DELETE
SYNTAX
DELETE FROM TABLE 
WHERE COLUMN_NAME OPERATOR (SELECT COLUMN_NAME FROM TABLE [WHERE])*/

-- I want to delete the employee where age is greater than 27 in another table

DELETE FROM employee
WHERE age IN (SELECT age FROM employee_b WHERE age>27);