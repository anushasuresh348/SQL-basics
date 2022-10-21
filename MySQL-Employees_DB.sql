# Load the "employees" dataset using the sql given
USE employees;

##################################################################################################################
# SECTION: The SQL SELECT Statement

# Task 1- SELECT- FROM
# Select the information from the “dept_no” column of the “departments” table.
SELECT dept_no
FROM departments;
# Select all data from the “departments” table.
SELECT *
FROM departments;

# Task 2- WHERE
# Select all people from the “employees” table whose first name is “Elvis”.
SELECT *
FROM employees
WHERE first_name = 'Elvis';

# Task 3- AND
# Retrieve a list with all female employees whose first name is Kellie.
SELECT *
FROM employees;
WHERE first_name='Kellie' AND gender='F';

# Task 4- OR
# Retrieve a list with all employees whose first name is either Kellie or Aruna.
SELECT *
FROM employees;
WHERE first_name='Kellie' OR first_name='Aruna';

# Task 5- Operator Presedence
# Retrieve a list with all female employees whose first name is either Kellie or Aruna.
SELECT *
FROM employees;
WHERE gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna');

# Task 6- IN- NOT IN
# Use the IN operator to select all individuals from the “employees” table, 
# whose first name is either “Denis”, or “Elvis”.
SELECT *
FROM employees
WHERE first_name IN ('Denis' , 'Elvis');
# Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
SELECT *
FROM employees
WHERE first_name NOT IN ('John' , 'Mark', 'Jacob');

# Task 7- LIKE- NOT LIKE
# Working with the “employees” table, use the LIKE operator to select the data about all individuals,
# whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.
SELECT *
FROM employees
WHERE first_name LIKE('Mark%');
# Retrieve a list with all employees who have been hired in the year 2000.
SELECT *
FROM employees
WHERE hire_date LIKE ('%2000%');
# Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. 
SELECT *
FROM employees
WHERE emp_no LIKE ('1000_');

# Task 8- Wildcard Characters
# Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
SELECT *
FROM employees
WHERE first_name LIKE ('%JACK%');
# Extract another list containing the names of employees that do not contain “Jack”.
SELECT *
FROM employees
WHERE first_name NOT LIKE ('%Jack%'); 

# Task 9- BETWEEN-AND
# Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
SELECT *
FROM salaries
WHERE salary BETWEEN 66000 AND 70000;
# Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
SELECT *
FROM employees
WHERE emp_no NOT BETWEEN '10004' AND '10012';
# Select the names of all departments with numbers between ‘d003’ and ‘d006’.
SELECT dept_name
FROM departments
WHERE dept_no BETWEEN 'd003' AND 'd006';

# Task 10- IS NOT NULL-IS NULL
# Select the names of all departments whose department number value is not null.
SELECT dept_name
FROM departments
WHERE dept_no IS NOT NULL;

# Task 11- Other Comparision operators
# Retrieve a list with data about all female employees who were hired in the year 2000 or after.
SELECT *
FROM employees
WHERE hire_date >= '2000-01-01' AND gender = 'F';
# Extract a list with all employees’ salaries higher than $150,000 per annum.
SELECT *
FROM salaries
WHERE salary > 150000;

# Task 12- SELECT DISTINCT
# Obtain a list with all different “hire dates” from the “employees” table.
# Expand this list and click on “Limit to 1000 rows”. This way you will set the limit 
# of output rows displayed back to the default of 1000.
SELECT DISTINCT hire_date
FROM employees;

# Task 13- Aggregate Function
# How many annual contracts with a value higher than or equal to $100,000 
# have been registered in the salaries table?
SELECT COUNT(*)
FROM salaries
WHERE salary >= 100000;
# How many managers do we have in the “employees” database? 
SELECT COUNT(*)
FROM dept_manager;

# Task 14- ORDER BY
# Select all data from the “employees” table, ordering it by “hire date” in descending order.
SELECT *
FROM employees
ORDER BY hire_date DESC;

# Task 15- Using Alias(AS)
# Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars.
# The second column, renamed to “emps_with_same_salary”, must show the number of employees contracted to that salary. 
# Lastly, sort the output by the first column.
SELECT salary, COUNT(emp_no) AS emps_with_same_salary
FROM salaries
WHERE salary > 80000
GROUP BY salary
ORDER BY salary;

# Task 16- HAVING
# Select all employees whose average salary is higher than $120,000 per annum.
SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

# Task 17- WHERE vs HAVING
# Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
SELECT emp_no
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

# Task 18- LIMIT
# Select the first 100 rows from the ‘dept_emp’ table. 
SELECT *
FROM dept_emp
LIMIT 100;

###########################################################################################################
# SECTION- SQL INSERT STATEMENT

# Task 1- INSERT
# Select ten records from the “titles” table to get a better idea about its content.
# Then, in the same table, insert information about employee number 999903. 
#State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.
# At the end, sort the records from the “titles” table in descending order to check 
# if you have successfully inserted the new record.
SELECT *
FROM employees
LIMIT 10;
INSERT INTO employees
(
	emp_no,
	birth_date,
	first_name,
	last_name,
	gender,
	hire_date
) VALUES 
(
	999901,
    '1986-04-21',
    'John',
    'Smith',
    'M',
    '2011-01-01'
);
SELECT *
FROM employees
ORDER BY emp_no DESC
LIMIT 10;

SELECT *
FROM titles
LIMIT 10;
insert into titles
(
   emp_no,
   title,
   from_date
)
values
(
   999903,
  'Senior Engineer',
  '1997-10-01'
);
SELECT *
FROM titles
ORDER BY emp_no DESC
LIMIT 10;

# Task 2- INSERT
# Insert information about the individual with employee number 999903 into the “dept_emp” table. 
# He/She is working for department number 5, and has started work on  October 1st, 1997; 
# her/his contract is for an indefinite period of time.
INSERT INTO employees
(
	birth_date,
    emp_no,
	first_name,
	last_name,
	gender,
	hire_date
) VALUES 
(
	'1973-3-26',
    999902,
    'Patricia',
    'Lawrence',
    'F',
    '2005-01-01'
);
INSERT INTO employees
VALUES
(
	999903,
    '1977-09-14',
    'Johnathan',
    'Creek',
    'M',
    '1999-01-01'
);
SELECT *
FROM employees
ORDER BY emp_no DESC
LIMIT 10;

SELECT *
FROM dept_emp
ORDER BY emp_no DESC
LIMIT 10;
insert into dept_emp
(
    emp_no,
    dept_no,
    from_date,
    to_date
)
values
(
    999903,
    'd005',
    '1997-10-01',
    '9999-01-01'
);

# Task 3- INSERT INTO
# Create a new department called “Business Analysis”. Register it under number ‘d010’.
SELECT *
FROM departments
LIMIT 10;
CREATE TABLE departments_dup 
(
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);
SELECT *
FROM departments_dup;
INSERT INTO departments_dup
(
    dept_no,
    dept_name
)
SELECT *
FROM departments;
SELECT *
FROM departments_dup
ORDER BY dept_no;
INSERT INTO departments VALUES ('d010', 'Business Analysis');

##################################################################################################################
# SECTION- UPDATE STATEMENT

# Task- Change the “Business Analysis” department name to “Data Analysis”.
UPDATE departments
SET dept_name = 'Data Analysis'
WHERE dept_no = 'd010';

##################################################################################################################
# SECTION- DELETE STATEMENT

# Task- Remove the department number 10 record from the “departments” table.
DELETE FROM departments 
WHERE dept_no = 'd010';

##################################################################################################################
# SECTION- AGGREGATE FUNCTIONS

# Task 1- COUNT()
# How many departments are there in the “employees” database? 
SELECT COUNT(DISTINCT dept_no)
FROM dept_emp;

# Task 2- SUM()
# What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
SELECT SUM(salary)
FROM salaries
WHERE from_date > '1997-01-01';

# Task 3- MIN() & MAX()
# 1. Which is the lowest employee number in the database?
SELECT MIN(emp_no)
FROM employees;
# 2. Which is the highest employee number in the database?
SELECT MAX(emp_no)
FROM employees;

# Task 4- AVG()
# What is the average annual salary paid to employees who started after the 1st of January 1997?
SELECT AVG(salary)
FROM salaries
WHERE from_date > '1997-01-01';

# Task 5- ROUND()
# Round the average amount of money spent on salaries for all contracts that started after 
# the 1st of January 1997 to a precision of cents.
SELECT ROUND(AVG(salary), 2)
FROM salaries
WHERE from_date > '1997-01-01';

# Task 6- COALESCE()
# Select the department number and name from the ‘departments_dup’ table and add a third column where you name 
# the department number (‘dept_no’) as ‘dept_info’. If ‘dept_no’ does not have a value, use ‘dept_name’.
SELECT dept_no,dept_name, COALESCE(dept_no, dept_name) AS dept_info
FROM departments_dup
ORDER BY dept_no ASC;

# Task 7- COALESCE()
# Modify the code obtained from the previous exercise in the following way.
# Apply the IFNULL() function to the values from the first and second column, 
# so that ‘N/A’ is displayed whenever a department number has no value, and 
# ‘Department name not provided’ is shown if there is no value for ‘dept_name’.
SELECT
    IFNULL(dept_no, 'N/A') as dept_no,
    IFNULL(dept_name,'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM departments_dup
ORDER BY dept_no ASC;

##################################################################################################################
# SECTION- SQL Joins

# Task 1-JOIN()
# If you currently have the ‘departments_dup’ table set up, use DROP COLUMN to remove the ‘dept_manager’ column from
# the ‘departments_dup’ table. Then, use CHANGE COLUMN to change the ‘dept_no’ and ‘dept_name’ columns to NULL.
# (If you don’t currently have the ‘departments_dup’ table set up, create it. Let it contain two columns: dept_no and
# dept_name. Let the data type of dept_no be CHAR of 4, and the data type of dept_name be VARCHAR of 40. Both columns 
# are allowed to have null values. Finally, insert the information contained in ‘departments’ into ‘departments_dup’.)
# Then, insert a record whose department name is “Public Relations”.
# Delete the record(s) related to department number two.
# Insert two new records in the “departments_dup” table. Let their values in the “dept_no” column be “d010” and “d011”.

# if you currently have ‘departments_dup’ set up:
ALTER TABLE departments_dup
DROP COLUMN dept_manager;
ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;
ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

# if you don’t currently have ‘departments_dup’ set up
DROP TABLE IF EXISTS departments_dup;
CREATE TABLE departments_dup
(
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);
INSERT INTO departments_dup
(
    dept_no,
    dept_name
)SELECT *
FROM departments;
INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');
DELETE FROM departments_dup
WHERE dept_no = 'd002'; 
INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

# Task 2: Create and fill in the ‘dept_manager_dup’ table
DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup (
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
  );
INSERT INTO dept_manager_dup
select * from dept_manager;
INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES (999904, '2017-01-01'),
       (999905, '2017-01-01'),
       (999906, '2017-01-01'),
       (999907, '2017-01-01');
DELETE FROM dept_manager_dup
WHERE dept_no = 'd001';
INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');
DELETE FROM departments_dup
WHERE dept_no = 'd002'; 

# Task 3- INER JOIN()
# Extract a list containing information about all managers’ employee number, first and last name, 
# department number, and hire date. 
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM
    employees e
        JOIN dept_manager dm ON e.emp_no = dm.emp_no;
        
# Task 4- LEFT JOIN()
# Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last 
# name is Markovitch. See if the output contains a manager with that name. 
SELECT
    e.emp_no,  
    e.first_name,  
    e.last_name,  
    dm.dept_no,  
    dm.from_date  
FROM  
    employees e  
        LEFT JOIN dept_manager dm ON e.emp_no = dm.emp_no  
WHERE e.last_name = 'Markovitch'  
ORDER BY dm.dept_no DESC, e.emp_no;

# Task 5- New and old join syntax
# Extract a list containing information about all managers’ employee number, first and last name, department
# number, and hire date. Use the old type of join syntax to obtain the result.
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM
    employees e,
    dept_manager dm
WHERE e.emp_no = dm.emp_no;
# New Join Syntax:
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM employees e
        JOIN dept_manager dm ON e.emp_no = dm.emp_no; 
        
# Task 6- JOIN and WHERE
# Select the first and last name, the hire date, and the job title of all employees whose first name is “Margareta” 
# and have the last name “Markovitch”.
SELECT e.first_name, e.last_name, e.hire_date, t.title
FROM employees e
        JOIN titles t ON e.emp_no = t.emp_no
WHERE first_name = 'Margareta' AND last_name = 'Markovitch'
ORDER BY e.emp_no;            

# Task 7a- CROSS JOIN
# Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table 
# and department number 9.
SELECT dm.*, d.*  
FROM departments d  
        CROSS JOIN dept_manager dm  
WHERE d.dept_no = 'd009'  
ORDER BY d.dept_no;

# Task 7b- CROSS JOIN
# Return a list with the first 10 employees with all the departments they can be assigned to.
SELECT e.*, d.*
FROM employees e
        CROSS JOIN departments d
WHERE e.emp_no < 10011
ORDER BY e.emp_no, d.dept_name;

# Task 8- Joining more tahn two tables in SQL
# Select all managers’ first and last name, hire date, job title, start date, and department name.
SELECT
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM employees e
        JOIN dept_manager m ON e.emp_no = m.emp_no
        JOIN departments d ON m.dept_no = d.dept_no
        JOIN titles t ON e.emp_no = t.emp_no
WHERE t.title = 'Manager'
ORDER BY e.emp_no;
# 2nd Solution:
SELECT
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM employees e
        JOIN dept_manager m ON e.emp_no = m.emp_no
        JOIN departments d ON m.dept_no = d.dept_no
        JOIN titles t ON e.emp_no = t.emp_no
            AND m.from_date = t.from_date
ORDER BY e.emp_no;

# Task 9- How many male and how many female managers do we have in the ‘employees’ database?
SELECT e.gender, COUNT(dm.emp_no)
FROM employees e
        JOIN dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;

# Task 10- UNION vs UNION ALL
SELECT *
FROM
    (SELECT e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT
        NULL AS emp_no,
	    NULL AS first_name,
		NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) as a
ORDER BY -a.emp_no DESC;

##################################################################################################################
# SECTION- SQL Subqueries

# Task 1- IN nested in WHERE
# Extract the information about all department managers who were hired between the 1st of January 1990 and 
# the 1st of January 1995.
SELECT *
FROM dept_manager
WHERE emp_no IN (SELECT emp_no
				FROM employees
                WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01');
                
# Task 2- EXISTS-NOT EXISTS nested inside WHERE
# Select the entire information for all employees whose job title is “Assistant Engineer”
SELECT *
FROM employees e
WHERE
    EXISTS( SELECT *
            FROM titles t
            WHERE t.emp_no = e.emp_no AND title = 'Assistant Engineer');
            
# Task 3- nested in SELECT and FROM
# Starting your code with “DROP TABLE”, create a table called “emp_manager” (emp_no – integer of 11, not null; 
# dept_no – CHAR of 4, null; manager_no – integer of 11, not null). 
DROP TABLE IF EXISTS emp_manager;
CREATE TABLE emp_manager (
   emp_no INT(11) NOT NULL,
   dept_no CHAR(4) NULL,
   manager_no INT(11) NOT NULL);
   
# Task 4- nested in SELECT and FROM 
# Fill emp_manager with data about employees, the number of the department they are working in, and their managers.
# INSERT INTO emp_manager
SELECT u.*
FROM (SELECT a.*
    FROM (SELECT e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT emp_no
                FROM dept_manager WHERE emp_no = 110022) AS manager_ID
    FROM employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT b.*
    FROM (SELECT e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT emp_no
			 FROM dept_manager WHERE emp_no = 110039) AS manager_ID
    FROM employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT c.*
    FROM (SELECT e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT emp_no
			 FROM dept_manager WHERE emp_no = 110039) AS manager_ID
    FROM employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT d.*
    FROM (SELECT e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT emp_no
			 FROM dept_manager WHERE emp_no = 110022) AS manager_ID
    FROM employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;   

###################################################################################################################
# Task - SQL Views
# Create a view that will extract the average salary of all managers registered in the database. 
# Round this value to the nearest cent. If you have worked correctly, after executing the view from 
# the “Schemas” section in Workbench, you should obtain the value of 66924.27.    
CREATE OR REPLACE VIEW v_manager_avg_salary AS
    SELECT
        ROUND(AVG(salary), 2)
    FROM salaries s
    JOIN dept_manager m ON s.emp_no = m.emp_no;
    
###################################################################################################################
# Section - Stored Routie

# Task 1- Stored Procedures
# Create a procedure that will provide the average salary of all employees.Then, call the procedure.
DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN
                SELECT AVG(salary)
                FROM salaries;
END$$
DELIMITER ;
CALL avg_salary;
CALL avg_salary();
CALL employees.avg_salary;
CALL employees.avg_salary();

# Task 2- Stored procedures with an output parameter 
# Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, 
# and returns their employee number.
DELIMITER $$
CREATE PROCEDURE emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)
BEGIN
                SELECT e.emp_no
                INTO p_emp_no FROM employees e
                WHERE e.first_name = p_first_name AND e.last_name = p_last_name;
END$$
DELIMITER ;

# Task 3- Variable 
# Create a variable, called ‘v_emp_no’, where you will store the output of the procedure you created in the last 
# exercise. Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name 
# respectively.Finally, select the obtained output.
SET @v_emp_no = 0;
CALL emp_info('Aruna', 'Journel', @v_emp_no);
SELECT @v_emp_no;

# Task 4- User-defined functions in MySQL 
# Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, and returns
# the salary from the newest contract of that employee.
DELIMITER $$
CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
	DECLARE v_max_from_date date;
    DECLARE v_salary decimal(10,2);
	SELECT MAX(from_date)
	INTO v_max_from_date FROM employees e
							JOIN salaries s ON e.emp_no = s.emp_no
							WHERE e.first_name = p_first_name AND e.last_name = p_last_name;
	SELECT s.salary
	INTO v_salary FROM employees e
					JOIN salaries s ON e.emp_no = s.emp_no
					WHERE e.first_name = p_first_name AND e.last_name = p_last_name AND s.from_date = v_max_from_date;
                   RETURN v_salary;
END$$
DELIMITER ;
SELECT EMP_INFO('Aruna', 'Journel');

###################################################################################################################
# Section ADVANCED SQL

# Task 1- SQL Triggers
# Create a trigger that checks if the hire date of an employee is higher than the current date. If true, 
# set this date to be the current date. Format the output appropriately (YY-MM-DD).
DELIMITER $$
CREATE TRIGGER trig_hire_date  
BEFORE INSERT ON employees
FOR EACH ROW  
BEGIN  
                IF NEW.hire_date > date_format(sysdate(), '%Y-%m-%d') THEN     
                                SET NEW.hire_date = date_format(sysdate(), '%Y-%m-%d');     
                END IF;  
END $$  
DELIMITER ;  
INSERT employees VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');  
SELECT *  
FROM employees
ORDER BY emp_no DESC;

# Task 2a- MySQL indexes
# Drop the ‘i_hire_date’ index.
ALTER TABLE employees
DROP INDEX i_hire_date;

# Task 2b- MySQL indexes
# Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.
# Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of 
# the same SELECT statement.
SELECT *
FROM salaries
WHERE salary > 89000;
CREATE INDEX i_salary ON salaries(salary);
SELECT *
FROM salaries
WHERE salary > 89000;

# Task 3a- CASE statement
# Similar to the exercises done in the lecture, obtain a result set containing the employee number, first name, 
# and last name of all employees with a number higher than 109990. Create a fourth column in the query, indicating 
# whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular 
# employee. 
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM employees e
        LEFT JOIN dept_manager dm ON dm.emp_no = e.emp_no
WHERE e.emp_no > 109990;

# Task 3b- CASE Statement
# Extract a dataset containing the following information about the managers: employee number, first name, and
# last name. Add two columns at the end – one showing the difference between the maximum and minimum salary of 
# that employee, and another one saying whether this salary raise was higher than $30,000 or NOT.
SELECT
    dm.emp_no,  
    e.first_name,  
    e.last_name,  
    MAX(s.salary) - MIN(s.salary) AS salary_difference,  
    CASE  
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more then $30,000'  
        ELSE 'Salary was NOT raised by more then $30,000'  
    END AS salary_raise  
FROM dept_manager dm  
        JOIN employees e ON e.emp_no = dm.emp_no  
        JOIN salaries s ON s.emp_no = dm.emp_no  
GROUP BY s.emp_no;  
# or
SELECT  
    dm.emp_no,  
    e.first_name,  
    e.last_name,  
    MAX(s.salary) - MIN(s.salary) AS salary_difference,  
    IF(MAX(s.salary) - MIN(s.salary) > 30000, 'Salary was raised by more then $30,000', 'Salary was NOT raised by more then $30,000') AS salary_increase  
FROM dept_manager dm  
        JOIN employees e ON e.emp_no = dm.emp_no  
        JOIN salaries s ON s.emp_no = dm.emp_no  
GROUP BY s.emp_no;

# Task 3b- CASE Statement
# Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, 
# called “current_employee” saying “Is still employed” if the employee is still working in the company, or 
# “Not an employee anymore” if they aren’t.
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employed'
        ELSE 'Not an employee anymore'
    END AS current_employee
FROM employees e
        JOIN dept_emp de ON de.emp_no = e.emp_no
GROUP BY de.emp_no
LIMIT 100;

# Task 4a- The ROW_NUMBER() Ranking Window Function
# Write a query that upon execution, assigns a row number to all managers we have information for in 
# the "employees" database (regardless of their department).
# Let the numbering disregard the department the managers have worked in. Also, let it start from the 
# value of 1. Assign that value to the manager with the lowest employee number.
SELECT
    emp_no,
    dept_no,
    ROW_NUMBER() OVER (ORDER BY emp_no) AS row_num
FROM dept_manager;

# Task 4b- The ROW_NUMBER() Ranking Window Function
# Write a query that upon execution, assigns a sequential number for each employee number registered in 
# the "employees" table. Partition the data by the employee's first name and order it by their last name 
# in ascending order (for each partition).
SELECT
	emp_no,
	first_name,
	last_name,
	ROW_NUMBER() OVER (PARTITION BY first_name ORDER BY last_name) AS row_num
FROM employees;

# Task 5a- Using Several Window Functions
# Obtain a result set containing the salary values each manager has signed a contract for. To obtain the data, 
# refer to the "employees" database.
# Use window functions to add the following two columns to the final output:
# - a column containing the row number of each row from the obtained dataset, starting from 1.
# - a column containing the sequential row numbers associated to the rows for each manager, where their highest
# salary has been given a number equal to the number of rows in the given partition, and their lowest - the number 1.
# Finally, while presenting the output, make sure that the data has been ordered by the values in the first of the 
# row number columns, and then by the salary values for each partition in ascending order.
SELECT
	dm.emp_no,
    salary,
    ROW_NUMBER() OVER () AS row_num1,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num2
FROM dept_manager dm
    JOIN salaries s ON dm.emp_no = s.emp_no
ORDER BY row_num1, emp_no, salary ASC;

# Task 5b- Using Several Window Functions
# Obtain a result set containing the salary values each manager has signed a contract for. To obtain the data, 
# refer to the "employees" database.
# Use window functions to add the following two columns to the final output:
# - a column containing the row numbers associated to each manager, where their highest salary has been given
# a number equal to the number of rows in the given partition, and their lowest - the number 1.
# - a column containing the row numbers associated to each manager, where their highest salary has been given 
# the number of 1, and the lowest - a value equal to the number of rows in the given partition.
# Let your output be ordered by the salary values associated to each manager in descending order.
SELECT
	dm.emp_no,
    salary,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary ASC) AS row_num1,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num2   
FROM dept_manager dm
    JOIN salaries s ON dm.emp_no = s.emp_no;

# Task 6- Window Functions Syntax
# Write a query that provides row numbers for all workers from the "employees" table, partitioning the data by 
# their first names and ordering each partition by their employee number in ascending order.
SELECT
	emp_no,
	first_name,
	ROW_NUMBER() OVER w AS row_num
FROM employees
WINDOW w AS (PARTITION BY first_name ORDER BY emp_no);

# Task 7a-The PARTITION BY Clause VS the GROUP BY Clause 
# Find out the lowest salary value each employee has ever signed a contract for. To obtain the desired output,
#  use a subquery containing a window function, as well as a window specification introduced with the help of 
# the WINDOW keyword. Also, to obtain the desired result set, refer only to data from the “salaries” table.
SELECT a.emp_no,
       MIN(salary) AS min_salary FROM (
SELECT
emp_no, salary, ROW_NUMBER() OVER w AS row_num
FROM
salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)) a
GROUP BY emp_no;

# Task 7b-The PARTITION BY Clause VS the GROUP BY Clause
# Again, find out the lowest salary value each employee has ever signed a contract for. Once again, to obtain 
# the desired output, use a subquery containing a window function. This time, however, introduce the window 
# specification in the field list of the given subquery.
# To obtain the desired result set, refer only to data from the “salaries” table.
SELECT a.emp_no,
       MIN(salary) AS min_salary FROM (
SELECT
emp_no, salary, ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary) AS row_num
FROM
salaries) a
GROUP BY emp_no;

# Task 7c- The PARTITION BY Clause VS the GROUP BY Clause
# Once again, find out the lowest salary value each employee has ever signed a contract for. This time, to obtain 
# the desired output, avoid using a window function. Just use an aggregate function and a subquery.
# To obtain the desired result set, refer only to data from the “salaries” table.
SELECT
    a.emp_no, MIN(salary) AS min_salary
FROM
    (SELECT
        emp_no, salary
    FROM
        salaries) a
GROUP BY emp_no;

# Task 7d- The PARTITION BY Clause VS the GROUP BY Clause
# Once more, find out the lowest salary value each employee has ever signed a contract for. To obtain the desired 
# output, use a subquery containing a window function, as well as a window specification introduced with the help 
# of the WINDOW keyword. Moreover, obtain the output without using a GROUP BY clause in the outer query.
# To obtain the desired result set, refer only to data from the “salaries” table.
SELECT a.emp_no,
a.salary as min_salary FROM (
SELECT
emp_no, salary, ROW_NUMBER() OVER w AS row_num
FROM
salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)) a
WHERE a.row_num=1;

# Task 7e- The PARTITION BY Clause VS the GROUP BY Clause
# Find out the second-lowest salary value each employee has ever signed a contract for. To obtain the desired 
# output, use a subquery containing a window function, as well as a window specification introduced with the help of
# the WINDOW keyword. Moreover, obtain the desired result set without using a GROUP BY clause in the outer query.
# To obtain the desired result set, refer only to data from the “salaries” table.
SELECT a.emp_no,
a.salary as min_salary FROM (
SELECT
emp_no, salary, ROW_NUMBER() OVER w AS row_num
FROM
salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)) a
WHERE a.row_num=2;

# Task 8a- RANK() and DENSE_RANK() Window Functions
# Write a query containing a window function to obtain all salary values that employee number 10560 has ever signed
# a contract for.
# Order and display the obtained salary values from highest to lowest.
SELECT
	emp_no,
	salary,
	ROW_NUMBER() OVER w AS row_num
FROM salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

# Task 8b- RANK() and DENSE_RANK() Window Functions
# Write a query that upon execution, displays the number of salary contracts that each manager has ever signed 
# while working in the company.
SELECT
    dm.emp_no, (COUNT(salary)) AS no_of_salary_contracts
FROM dept_manager dm
        JOIN salaries s ON dm.emp_no = s.emp_no
GROUP BY emp_no
ORDER BY emp_no;

# Task 8c- RANK() and DENSE_RANK() Window Functions 
# Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has 
# ever signed a contract for. Use a window function to rank all salary values from highest to lowest in a way that
# equal salary values bear the same rank and that gaps in the obtained ranks for subsequent rows are allowed.
SELECT
	emp_no,
	salary,
	RANK() OVER w AS rank_num
FROM salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

# Task 8d- RANK() and DENSE_RANK() Window Functions 
# Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has 
# ever signed a contract for. Use a window function to rank all salary values from highest to lowest in a way that 
# equal salary values bear the same rank and that gaps in the obtained ranks for subsequent rows are not allowed.
SELECT
	emp_no,
	salary,
	DENSE_RANK() OVER w AS rank_num
FROM salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

# Task 9a- MySQL Ranking Window Functions and Joins Together 
# Write a query that ranks the salary values in descending order of all contracts signed by employees numbered 
# between 10500 and 10600 inclusive. Let equal salary values for one and the same employee bear the same rank. 
# Also, allow gaps in the ranks obtained for their subsequent rows.
# Use a join on the “employees” and “salaries” tables to obtain the desired result.
SELECT
    e.emp_no,
    RANK() OVER w as employee_salary_ranking,
    s.salary
FROM employees e
JOIN salaries s ON s.emp_no = e.emp_no
WHERE e.emp_no BETWEEN 10500 AND 10600
WINDOW w as (PARTITION BY e.emp_no ORDER BY s.salary DESC);

# Task 9b- MySQL Ranking Window Functions and Joins Together
# Write a query that ranks the salary values in descending order of the following contracts from the "employees" 
# database:
#- contracts that have been signed by employees numbered between 10500 and 10600 inclusive.
#- contracts that have been signed at least 4 full-years after the date when the given employee was hired in the 
# company for the first time.
# In addition, let equal salary values of a certain employee bear the same rank. Do not allow gaps in the ranks 
# obtained for their subsequent rows.
# Use a join on the “employees” and “salaries” tables to obtain the desired result.
SELECT
    e.emp_no,
    DENSE_RANK() OVER w as employee_salary_ranking,
    s.salary,
    e.hire_date,
    s.from_date,
    (YEAR(s.from_date) - YEAR(e.hire_date)) AS years_from_start
FROM employees e
JOIN salaries s ON s.emp_no = e.emp_no AND YEAR(s.from_date) - YEAR(e.hire_date) >= 5
WHERE e.emp_no BETWEEN 10500 AND 10600
WINDOW w as (PARTITION BY e.emp_no ORDER BY s.salary DESC);

# Task 10a- LAG() and LEAD() value window function
# Write a query that can extract the following information from the "employees" database:
#- the salary values (in ascending order) of the contracts signed by all employees numbered
# between 10500 and 10600 inclusive
#- a column showing the previous salary from the given ordered list
#- a column showing the subsequent salary from the given ordered list
#- a column displaying the difference between the current salary of a certain employee and their previous salary
#- a column displaying the difference between the next salary of a certain employee and their current salary
# Limit the output to salary values higher than $80,000 only.
# Also, to obtain a meaningful result, partition the data by employee number.
SELECT
	emp_no,
    salary,
    LAG(salary) OVER w AS previous_salary,
    LEAD(salary) OVER w AS next_salary,
    salary - LAG(salary) OVER w AS diff_salary_current_previous,
	LEAD(salary) OVER w - salary AS diff_salary_next_current
FROM salaries
    WHERE salary > 80000 AND emp_no BETWEEN 10500 AND 10600
WINDOW w AS (PARTITION BY emp_no ORDER BY salary);

# Task 10b- LAG() and LEAD() value window function
# The MySQL LAG() and LEAD() value window functions can have a second argument, designating how many rows/steps back
# (for LAG()) or forth (for LEAD()) we'd like to refer to with respect to a given record.
# With that in mind, create a query whose result set contains data arranged by the salary values associated to each 
# employee number (in ascending order). Let the output contain the following six columns:
#- the employee number
#- the salary value of an employee's contract (i.e. which we’ll consider as the employee's current salary)
#- the employee's previous salary
#- the employee's contract salary value preceding their previous salary
#- the employee's next salary
#- the employee's contract salary value subsequent to their next salary
# Restrict the output to the first 1000 records you can obtain.
SELECT
	emp_no,
    salary,
    LAG(salary) OVER w AS previous_salary,
	LAG(salary, 2) OVER w AS 1_before_previous_salary,
	LEAD(salary) OVER w AS next_salary,
    LEAD(salary, 2) OVER w AS 1_after_next_salary
FROM salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)
LIMIT 1000;

# Task 11a- MySQL Aggregate Functions in the Context of Window Functions 
# Create a query that upon execution returns a result set containing the employee numbers, contract salary values,
# start, and end dates of the first ever contracts that each employee signed for the company.
# To obtain the desired output, refer to the data stored in the "salaries" table.
SELECT
    s1.emp_no, s.salary, s.from_date, s.to_date
FROM salaries s
        JOIN (SELECT
				emp_no, MIN(from_date) AS from_date
			  FROM salaries
		GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
WHERE s.from_date = s1.from_date;

# Task 11b- MySQL Aggregate Functions in the Context of Window Functions 
# Consider the employees' contracts that have been signed after the 1st of January 2000 and terminated before the
# 1st of January 2002 (as registered in the "dept_emp" table).
# Create a MySQL query that will extract the following information about these employees:
#- Their employee number
#- The salary values of the latest contracts they have signed during the suggested time period
#- The department they have been working in (as specified in the latest contract they've signed during the 
# suggested time period)
#- Use a window function to create a fourth field containing the average salary paid in the department the employee
# was last working in during the suggested time period. Name that field "average_salary_per_department".

SELECT
    de2.emp_no, d.dept_name, s2.salary, AVG(s2.salary) OVER 
w AS average_salary_per_department
FROM
    (SELECT    de.emp_no, de.dept_no, de.from_date, de.to_date
FROM dept_emp de
	 JOIN
(SELECT emp_no, MAX(from_date) AS from_date
FROM dept_emp
GROUP BY emp_no) de1 ON de1.emp_no = de.emp_no
WHERE de.to_date < '2002-01-01'
AND de.from_date > '2000-01-01'
AND de.from_date = de1.from_date) de2
JOIN
	(SELECT s1.emp_no, s.salary, s.from_date, s.to_date
FROM salaries s
	JOIN
	(SELECT	emp_no, MAX(from_date) AS from_date
FROM salaries
	GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
WHERE s.to_date < '2002-01-01'
AND s.from_date > '2000-01-01'
AND s.from_date = s1.from_date) s2 ON s2.emp_no = de2.emp_no
JOIN departments d ON d.dept_no = de2.dept_no
GROUP BY de2.emp_no, d.dept_name
WINDOW w AS (PARTITION BY de2.dept_no)
ORDER BY de2.emp_no, salary;






