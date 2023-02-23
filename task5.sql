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

CREATE PROCEDURE emp_table AS
BEGIN
SELECT *
  FROM employeees
END

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

SELECT *
FROM employeees
WHERE salary < 3500

SELECT emp_name, job_name, salary
FROM employeees
WHERE job_name LIKE 'ANALYST'

SELECT *
FROM employeees
WHERE YEAR(hire_date) = 1991;

SELECT emp_id, emp_name, hire_date, salary
FROM employeees
WHERE hire_date < '1991-04-01'

SELECT emp_name, job_name
FROM employeees
WHERE manager_id IS NULL

SELECT emp_id, emp_name, hire_date, salary
FROM employeees
WHERE hire_date = '1991-05-01'

SELECT emp_id, emp_name, salary, (YEAR(GETDATE()) - YEAR(hire_date)) AS experience
FROM employeees
WHERE emp_id = 68319

SELECT emp_id, emp_name, salary, (YEAR(GETDATE()) - YEAR(hire_date)) AS experience
FROM employeees
WHERE (salary/30) > 100

SELECT emp_name
FROM employeees
WHERE (YEAR('1999-12-31') - YEAR(hire_date)) >= 8

SELECT *
FROM employeees
WHERE salary%2 = 1

SELECT *
FROM employeees
WHERE salary LIKE '___'

SELECT *
FROM employeees
WHERE MONTH(hire_date) = 04;

SELECT *
FROM employeees
WHERE DAY(hire_date) < 19;

SELECT *
FROM employeees
WHERE job_name LIKE 'SALESMAN' 
AND (YEAR(GETDATE()) - YEAR(hire_date))/2 > 10;

SELECT *
FROM employeees
WHERE YEAR(hire_date) = 1991
AND (dep_id = 3001 OR dep_id = 1001);

SELECT *
FROM employeees
WHERE(dep_id = 1001 OR dep_id = 2001);

SELECT *
FROM employeees
WHERE job_name LIKE 'CLERK' AND dep_id = 2001;

SELECT *
FROM employeees
WHERE job_name LIKE 'CLERK' OR job_name LIKE 'MANAGER';

SELECT *
FROM employeees
WHERE MONTH(hire_date) <> 02;

SELECT *
FROM employeees
WHERE hire_date LIKE '%1991_06%';

SELECT *
FROM employeees
WHERE (salary*12) BETWEEN 23999 AND 49999

SELECT *
FROM employeees
WHERE hire_date LIKE '%____-05-01%' OR hire_date LIKE '%____-02-20%' OR hire_date LIKE '%1991-12-03%'

SELECT *
FROM employeees
WHERE manager_id IN (63679, 68319, 66564, 69000);

SELECT *
FROM employeees
WHERE hire_date LIKE '%199_-__-__%';

SELECT *
FROM employeees
WHERE job_name LIKE 'manager'
AND dep_id IN (1001, 2001);

SELECT *
FROM employeees
WHERE MONTH(hire_date) = 02
AND salary BETWEEN 1000 AND 2001

SELECT *
FROM employeees
WHERE YEAR(hire_date) < 1991 
OR YEAR(hire_date) > 1991 

SELECT E.*, D.dep_name
FROM employeees E, department D
WHERE E.dep_id = D.dep_id

SELECT E.emp_name, E.job_name, E.salary*12 AS Annual_salary, E.dep_id, D.dep_name, S.grade
FROM employeees E, department D, salary_grade S
WHERE (E.dep_id = D.dep_id)  AND (E.salary*12 >= 60000 OR job_name <> 'ANALYST') 
AND (E.salary BETWEEN S.min_salary AND S.max_salary)

SELECT e.emp_name AS employee_name, e.job_name, e.manager_id, e.salary, m.emp_name AS manager_name, m.salary AS manager_salary
FROM employeees e
INNER JOIN employeees m ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;

SELECT E.emp_name, E.dep_id, E.salary, E.commission
FROM employeees E, department D
WHERE(E.dep_id = D.dep_id) AND (salary BETWEEN 1999 AND 5001)
AND D.dep_location LIKE 'PERTH'

SELECT E.emp_name, S.grade
FROM employeees E, department D, salary_grade S
WHERE (E.dep_id = D.dep_id)
AND (E.salary BETWEEN S.min_salary AND S.max_salary)
AND (D.dep_id = 1001 OR D.dep_id = 3001)
AND S.grade <> 4
AND E.hire_date < '1991-12-31'

SELECT e.emp_name AS employee_name, e.job_name, e.manager_id, E.hire_date, e.salary, E.dep_id, m.emp_name AS manager_name
FROM employeees e
INNER JOIN employeees m ON e.manager_id = m.emp_id
WHERE m.emp_name LIKE 'JONAS'

SELECT e.emp_name, MAX(s.max_salary) AS max_salary
FROM employeees e
INNER JOIN salary_grade s ON e.salary BETWEEN s.min_salary AND s.max_salary
WHERE e.emp_name LIKE 'FRANK'
GROUP BY e.emp_name;

EXEC emp_table

SELECT *
FROM employeees
WHERE (job_name = 'MANAGER' OR job_name = 'ANALYST') 
AND (salary BETWEEN 1999  AND 5001)
AND (commission IS NULL)

SELECT E.emp_id, E.emp_name, E.job_name, E.manager_id, E.hire_date, E.salary, E.commission, E.dep_id, D.dep_location
FROM employeees E, department D
WHERE (E.dep_id = D.dep_id)
AND (job_name = 'MANAGER' OR job_name = 'ANALYST') 
AND (salary BETWEEN 1999  AND 5001)
AND (commission IS NULL)
AND YEAR(E.hire_date) = 1991
AND (D.dep_location LIKE 'SYDNEY' OR D.dep_location LIKE 'MELBOURNE')

SELECT E.dep_id, E.emp_id, E.emp_name, E.salary, D.dep_name, D.dep_location, S.grade 
FROM employeees E, department D, salary_grade S
WHERE (E.dep_id = D.dep_id)
AND (E.salary BETWEEN S.min_salary AND S.max_salary)
AND D.dep_name LIKE 'MARKETING'
AND D.dep_location IN ('MELBOURNE', 'PERTH')
AND S.grade IN (3, 4, 5)
AND (YEAR(GETDATE()) - YEAR(hire_date)) >= 25

SELECT *
FROM employeees e
INNER JOIN employeees m ON e.manager_id = m.emp_id
WHERE m.job_name LIKE 'PRESIDENT'

EXEC emp_table

SELECT emp_name
FROM employeees
WHERE YEAR(hire_date) > 1991
  AND emp_name NOT IN ('MARKER', 'ADELYN')
  AND dep_id NOT IN (
    SELECT dep_id
    FROM department
    WHERE dep_name IN ('PRODUCTION', 'AUDIT')
  )

SELECT *
FROM employeees
ORDER BY salary ASC

SELECT *
FROM employeees
ORDER BY dep_id DESC, job_name DESC

SELECT DISTINCT job_name
FROM employeees
ORDER BY job_name DESC

SELECT emp_id, emp_name, salary, salary/30 AS Daily_Salary, 12*salary AS Anual_Salary
FROM employeees
ORDER BY (12*salary) DESC

SELECT *
FROM employeees
WHERE job_name IN ('CLERK', 'ANALYST')
ORDER BY job_name DESC

SELECT D.dep_location
FROM employeees E, department D
WHERE (E.dep_id = D.dep_id)
AND (E.emp_name LIKE 'CLARE')

SELECT *
FROM employeees
WHERE hire_date IN ('1-MAY-91', '3-DEC-91', '19-JAN-90')
ORDER BY hire_date ASC

EXEC emp_table

SELECT *
FROM employeees
WHERE salary < 1000
ORDER BY salary ASC

SELECT *
FROM employeees
ORDER BY job_name ASC, emp_id DESC

SELECT DISTINCT job_name, dep_id
FROM employeees
WHERE dep_id IN (2001, 3001)
ORDER BY dep_id DESC

SELECT *
FROM employeees
WHERE job_name <> 'PRESIDENT' AND job_name <> 'MANAGER'
ORDER BY salary ASC

SELECT *
FROM employeees
WHERE salary*12 < 25000
ORDER BY salary ASC

SELECT emp_id, emp_name, salary*12 AS Annual_Salary, salary/30 AS Daily_Salary
FROM employeees
WHERE job_name = 'SALESMAN'
ORDER BY (salary*12) ASC

SELECT emp_id, emp_name, hire_date, GETDATE() AS Current_Date1, YEAR(GETDATE()) - YEAR(hire_date) AS Experinces 
FROM employeees