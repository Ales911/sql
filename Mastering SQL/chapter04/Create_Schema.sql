
DROP SCHEMA IF EXISTS chapter04 CASCADE;
CREATE SCHEMA chapter04;

-- Create a new table for CUSTOMERS
CREATE TABLE chapter04.CUSTOMERS (
  customer_id INT NULL,
  customer_name VARCHAR(50) NULL,
  customer_address VARCHAR(50) NULL,
  customer_city VARCHAR(50) NULL,
  customer_state VARCHAR(2) NULL);

-- Inserting data into CUSTOMERS table
INSERT INTO chapter04.CUSTOMERS 
(customer_id, customer_name, customer_address, customer_city, customer_state)
VALUES 
(1, 'John Smith', '123 Maple Street', 'Orlando', 'FL'),
(2, 'Susan Johnson', '456 Oak Avenue', 'Austin', 'TX'),
(3, 'Robert Brown', '789 Pine Lane', 'Phoenix', 'AZ'),
(4, 'Linda Davis', '321 Birch Blvd', 'Raleigh', 'NC'),
(5, 'Michael Miller', '654 Cedar Place', 'Atlanta', 'GA');

-- Create a new table for ORDERS
CREATE TABLE chapter04.ORDERS (
  order_id INT NULL,
  customer_id INT NULL,
  salesperson_id INT NULL,
  order_date TIMESTAMP NULL,
  delivery_id INT NULL);

-- Inserting data into ORDERS table
INSERT INTO chapter04.ORDERS (order_id, customer_id, salesperson_id, order_date, delivery_id) VALUES
(1001, 1, 5, now(), 23),
(1002, 1, 7, now(), 24),
(1003, 2, 5, now(), 23);

-- Create a new table for SALESPERSON
CREATE TABLE chapter04.SALESPERSON (
  salesperson_id INT NULL,
  salesperson_name VARCHAR(50) NULL);

-- Inserting data into SALESPERSON table
INSERT INTO chapter04.SALESPERSON (salesperson_id, salesperson_name) VALUES
(1, 'Salesperson 1'),
(2, 'Salesperson 2'),
(3, 'Salesperson 3'),
(4, 'Salesperson 4'),
(5, 'Salesperson 5'),
(6, 'Salesperson 6'),
(7, 'Salesperson 7');