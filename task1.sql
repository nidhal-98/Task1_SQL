CREATE TABLE employees(
id int  IDENTITY PRIMARY KEY,
name VARCHAR(20) NOT NULL,
age int NOT NULL,
salary float NOT NULL,
);

INSERT INTO employees (name, age, salary)
VALUES ('John Smith', 32, 55000.50);

INSERT INTO employees (name, age, salary)
VALUES ('Sarah Johnson', 28, 48000.75);

INSERT INTO employees (name, age, salary)
VALUES ('Michael Brown', 41, 71000.00);

SELECT * 
FROM employees


CREATE TABLE books(
id int  IDENTITY PRIMARY KEY,
title VARCHAR(50) NOT NULL,
author VARCHAR(20) NOT NULL,
price float NOT NULL,
);

INSERT INTO books
VALUES ('The Great Gatsby', 'F. Scott Fitzgerald', 10.99);

INSERT INTO books
VALUES ('To Kill a Mockingbird', 'Harper Lee', 12.50);

INSERT INTO books
VALUES ('1984', 'George Orwell', 8.99);

INSERT INTO books
VALUES ('Pride and Prejudice', 'Jane Austen', 9.75);

SELECT title, author, price
  FROM books
 WHERE price >= 10.00


CREATE TABLE students(
id int  IDENTITY PRIMARY KEY,
name VARCHAR(50) NOT NULL,
age int NOT NULL,
major VARCHAR(50) NOT NULL,
gpa float NOT NULL,
);

INSERT INTO students
VALUES ('John Smith', 22, 'Computer Science', 3.8);

INSERT INTO students
VALUES ('Sarah Johnson', 20, 'Biology', 3.2);

INSERT INTO students
VALUES ('Michael Brown', 24, 'Business', 3.5);

INSERT INTO students
VALUES ('Emily Wilson', 21, 'English', 3.9);

INSERT INTO students
VALUES ('David Lee', 23, 'Psychology', 3.6);

SELECT name, age, major, gpa
  FROM students
 WHERE gpa >= 3.5



 CREATE TABLE orders(
id int  IDENTITY PRIMARY KEY,
product_name  VARCHAR(50) NOT NULL,
customer_name VARCHAR(50) NOT NULL,
order_date date NOT NULL,
quantity int NOT NULL,
);

INSERT INTO orders
VALUES ('Widget A', 'John Smith', '2023-02-14', 5);
INSERT INTO orders
VALUES ('Widget B', 'Sarah Johnson', '2023-02-13', 3);
INSERT INTO orders
VALUES ('Widget c', 'Michael Brown', '2023-02-12', 7);

SELECT product_name, customer_name, order_date, quantity
  FROM orders
 WHERE order_date >= '2023-02-13';


 CREATE TABLE	customers(
 customer_id INT PRIMARY KEY,
 customer_name VARCHAR(50),
 email  VARCHAR(50),
 phone_number VARCHAR(50),
 );

INSERT INTO customers
 VALUES(1, 'John Smith', 'john.smith@example.com', '555-555-1212');
INSERT INTO customers
 VALUES(2, 'Jane Doe', 'jane.doe@example.com', '555-555-2323');
INSERT INTO customers
 VALUES(3, 'Bob Brown', 'bob.brown@example.com', '555-555-3434');

 SELECT *
   FROM customers;



CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
category VARCHAR(50) NOT NULL,
price DECIMAL NOT NULL,
quantity_in_stock INT NOT NULL,
);

INSERT INTO products
 VALUES (1, 'iPhone', 'Electronics', 999.99, 100);
 INSERT INTO products
 VALUES (2, 'Samsung Galaxy', 'Electronics', 799.99, 50);
 INSERT INTO products
 VALUES (3, 'Nike Air Max', 'Shoes', 119.99, 200);

SELECT *
  FROM products
 WHERE quantity_in_stock <= 100
 AND price >= 850;


 CREATE TABLE movies(
 movie_id INT PRIMARY KEY,
 movie_title VARCHAR(50) NOT NULL,
 director  VARCHAR(50) NOT NULL,
 genre VARCHAR(50) NOT NULL,
 release_year INT NOT NULL,
 );

INSERT INTO movies
 VALUES(1, 'The Shawshank Redemption', 'Frank Darabont', 'Drama', 1994)
INSERT INTO movies
 VALUES(2, 'The Godfather', 'Francis Ford Coppola', 'Drama', 1972)
INSERT INTO movies
 VALUES(3, 'The Dark Knight', 'Christopher Nolan', 'Action', 2008)

SELECT *
  FROM movies
 WHERE genre LIKE 'action';



CREATE TABLE inventory(
product_id INT PRIMARY KEY,
product_name VARCHAR(50) NOT NULL,
supplier VARCHAR(50) NOT NULL,
category VARCHAR(50) NOT NULL,
quantity INT NOT NULL,
price REAL,
);

INSERT INTO inventory
 VALUES(1, 'iPhone 13', 'Apple Inc.', 'Electronics', 10, 999.99);

 INSERT INTO inventory
 VALUES(2, 'Kindle Paperwhite', 'Amazon', 'Books & Media', 20, 129.99);

 INSERT INTO inventory
 VALUES(3, 'Nike Air Max 90', 'Nike Inc.', 'Apparel', 5, 119.99);

SELECT *
  FROM inventory
 WHERE supplier LIKE '%Nike%';