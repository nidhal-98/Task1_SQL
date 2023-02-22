CREATE TABLE department(
dep_id INTEGER PRIMARY KEY,
dep_name VARCHAR(20),
dep_location VARCHAR(15)
);

CREATE TABLE salary_grade(
grade INTEGER,
min_salary INTEGER,
max_salary INTEGER
);

CREATE TABLE employeees(
emp_id INTEGER,
emp_name VARCHAR(15),
job_name VARCHAR(10),
manager_id INTEGER,
hire_date DATE,
salary DECIMAL(10, 2),
commission DECIMAL(7,2),
dep_id INTEGER Foreign key References department(dep_id)
);

INSERT INTO employeees
VALUES(68319, 'KAYLING', 'PRESIDENT', NULL, '1991-11-18', 6000.00, NULL, 1001),
(66928, 'BLAZE', 'MANAGER', 68319, '1991-05-01', 2750.00 , NULL, 3001),
(67832, 'CLARE', 'MANAGER', 68319, '1991-06-09', 2550.00 , NULL, 1001),
(65646, 'JONAS', 'MANAGER', 68319, '1991-04-02', 2957.00 , NULL, 2001),
(67858, 'SCARLET', 'ANALYST', 65646, '1997-04-19', 3100.00 , NULL, 2001),
(69062, 'FRANK', 'ANALYST',  65646, '1991-12-03', 3100.00, NULL, 2001),
(63679, 'SANDRINE', 'CLERK',  69062, '1990-12-18', 900.00, NULL, 2001),
(64989, 'ADELYN', 'SALESMAN',  66928, '1991-02-20', 1700.00, 400.00, 3001),
(65271, 'WADE', 'SALESMAN',  66928, '1991-02-22', 1350.00, 600.00, 3001),
(66564, 'MADDEN', 'SALESMAN',  66928, '1991-09-28', 1350.00, 1500.00, 3001),
(68454, 'TUCKER', 'SALESMAN',  66928, '1991-09-08', 1600.00, 0.00, 3001),
(68736, 'ADNRES', 'CLERK',  67858, '1997-05-23', 1200.00, NULL, 2001),
(69000, 'JULIUS', 'CLERK',  66928, '1991-12-03', 1050.00, NULL, 3001),
(69324, 'MARKER', 'CLERK',  67832, '1992-01-23', 1400.00, NULL, 1001);

INSERT INTO department
VALUES(1001, 'FINANCE', 'SYDNEY'),
(2001, 'AUDIT', 'MELBOURNE'),
(3001, 'MARKETING', 'PERTH'),
(4001, 'PRODUCTION', 'BRISBANE');

INSERT INTO salary_grade
VALUES(1, 800, 1300),
(2, 1301, 1500),
(3, 1501, 2100),
(4, 2101, 3100),
(5, 3101, 9999);


SELECT emp_name, salary
  FROM employeees

SELECT DISTINCT job_name
  FROM employeees

SELECT emp_name, (salary*1.15) AS Salary
  FROM employeees

SELECT emp_name, job_name
  FROM employeees

SELECT emp_id, emp_name, salary, FORMAT(hire_date, N'MMMM dd "," yyyy', 'en-US')
  FROM employeees
WHERE hire_date = 'February 22, 1991'

SELECT COUNT(emp_id) AS Counting
  FROM employeees
WHERE salary+commission > 2200

SELECT DISTINCT job_name, dep_id
  FROM employeees

SELECT *
  FROM employeees
WHERE dep_id = '2001'

SELECT *
  FROM employeees
WHERE hire_date < '1991'

SELECT AVG(salary) AS average_salary
  FROM employeees
WHERE job_name = 'ANALYST'

SELECT *
  FROM employeees
WHERE emp_name LIKE 'b%' OR emp_name LIKE '%e'

SELECT E.*, D.dep_name
  FROM employeees E, department D
WHERE D.dep_name LIKE 'B%' OR D.dep_name LIKE '%E'

SELECT E.*, D.dep_location
  FROM employeees E, department D
WHERE D.dep_location LIKE 'F%' OR D.dep_location LIKE '%N'

SELECT E.*, D.dep_name, dep_location
FROM employeees E, department D
WHERE commission > salary

SELECT *, (salary*1.25) AS after_increase
FROM employeees
WHERE (salary*1.25)>3000

SELECT *
FROM employeees
WHERE MONTH(hire_date) = 1;

SELECT CONCAT(emp_name, ' works for ', manager_id) AS employee_work_for_manager
FROM employeees

SELECT *
FROM employeees
WHERE job_name = 'CLERK'

SELECT *
FROM employeees
WHERE hire_date <= DATEADD(year, -27, GETDATE())