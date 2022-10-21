# Task 1- Creating a database- Sales
CREATE DATABASE IF NOT EXISTS Sales;

# Task 2- Create the “customers” table in the “sales” database. 
# Let it contain the following 5 columns: customer_id, first_name, 
# last_name, email_address, and number_of_complaints.
# Let the data types of customer_id and number_of_complaints be integer,
# while the data types of all other columns be VARCHAR of 255.
USE Sales;
CREATE TABLE customers (
    customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT
);

# Task 3- Prmary key Constraint
DROP TABLE customers;
CREATE TABLE customers                                                    
(  
    customer_id INT,  
    first_name varchar(255),  
    last_name varchar(255),  
    email_address varchar(255),   
    number_of_complaints int,   
primary key (customer_id)   
);  
CREATE TABLE items                                                                                                                              
(  
    item_code varchar(255),   
    item varchar(255),   
    unit_price numeric(10,2),   
    company_id varchar(255),
primary key (item_code)   
);  
CREATE TABLE companies   
(
    company_id varchar(255),   
    company_name varchar(255),  
    headquarters_phone_number int(12),   
primary key (company_id)   
);

# Task 4- Foreign key constraint
# drop all tables from the “Sales” database in the following order: 
# first drop “sales”, then “customers”, “items”, and finally “companies”.
DROP TABLE sales;
DROP TABLE customers;
DROP TABLE items;
DROP TABLE companies;

# Task 5- Unique constraint
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id) 
);
 ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;
INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);

# Task 6- Default Constraint 
# Recreate the “companies” table
# This time setting the “headquarters phone number” to be the unique key,
# and default value of the company's name to be “X”.   
# After you execute the code properly, drop the “companies” table.
CREATE TABLE companies
(
    company_id VARCHAR(255),
    company_name VARCHAR(255) DEFAULT 'X',
    headquarters_phone_number VARCHAR(255),
PRIMARY KEY (company_id),
UNIQUE KEY (headquarters_phone_number)
);
DROP TABLE companies;

# Task 7- Not null constraint
# Using ALTER TABLE, first add the NULL constraint to the headquarters_phone_number 
# field in the “companies” table, and then drop that same constraint.
ALTER TABLE companies
MODIFY headquarters_phone_number VARCHAR(255) NULL;

ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;

