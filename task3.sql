CREATE TABLE sales (
  sale_id INT PRIMARY KEY,
  sale_date DATE,
  sale_amount DECIMAL(10,2)
);

INSERT INTO sales ( sale_id,sale_date, sale_amount)
VALUES
  (1,'2022-01-01', 100.00),
  (2,'2022-01-02', 50.00),
  (3,'2022-01-15', 75.00),
  (4,'2022-02-01', 200.00),
  (5,'2022-02-05', 150.00),
  (6,'2022-02-20', 175.00);

SELECT month(sale_date) AS Month, SUM(sale_amount) AS Toatal_Sales
FROM sales
GROUP BY month(sale_date);

SELECT AVG(sale_amount) AS Average
FROM sales;

SELECT COUNT(sale_id) AS Available
FROM sales

SELECT MAX(sale_amount) AS higest_amount
FROM sales;

SELECT MIN(sale_amount) AS lowest_amount
FROM sales;

SELECT *
FROM sales
ORDER BY sale_id DESC;

SELECT *
FROM sales
WHERE sale_date BETWEEN '2022-01-01' AND '2022-02-01';