UPDATE employees
SET salary = 31000.49
WHERE salary < 55000

SELECT *
FROM employees

DROP TABLE books;Alter table students
Add student_email VARCHAR(50)

UPDATE students
SET student_email = 'jhon@gmail.com'
WHERE id = 1

UPDATE students
SET student_email = 'sarah@gmail.com'
WHERE id = 2

UPDATE students
SET student_email = 'michael@gmail.com'
WHERE id = 3

UPDATE students
SET student_email = 'emily@gmail.com'
WHERE id = 4

UPDATE students
SET student_email = 'david@gmail.com'
WHERE id = 5

SELECT *
FROM students