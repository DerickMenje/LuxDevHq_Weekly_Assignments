--Q1. Create a schema called nairobi_academy and make sure SQL is using it before you do anything else.
CREATE SCHEMA IF NOT EXISTS nairobi_academy;

SET SEARCH_PATH TO nairobi_academy; -- Specifying the schema to be used. This removes the need to use the schema prefix for the tables in the schema.

SHOW search_path;

--Q2. Create the students table with the following columns:
CREATE TABLE students
(
	student_id INT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(1),
	date_of_birth DATE,
	"class" VARCHAR(10),
	city VARCHAR(50)
);

--Q3. Create the subjects table with the following columns:
CREATE TABLE subjects
(
	subject_id INT PRIMARY KEY,
	subject_name VARCHAR(100) UNIQUE NOT NULL,
	department VARCHAR(50),
	teacher_name VARCHAR(100),
	credits INT
);

--Q4. Create the exam_results table with the following columns:
CREATE TABLE exam_results
(
	result_id INT PRIMARY KEY,
	student_id INT NOT NULL,
	subject_id INT NOT NULL,
	marks INT NOT NULL,
	exam_date DATE,
	grade VARCHAR(2)
);

--Q5. After creating the students table, the school realises they forgot to include a phone number column. Use ALTER TABLE to add a column called phone_number with data type VARCHAR(20).
ALTER TABLE students
ADD COLUMN phone_number VARCHAR(20);

--Q6. The column credits in the subjects table needs to be renamed to credit_hours. Write the SQL to rename it.
ALTER TABLE subjects
RENAME COLUMN credits TO credit_hours;

--Q7. The school decides they no longer need the phone_number column you added in Q5. Write the SQL to remove it completely from the students table.
ALTER TABLE students
DROP COLUMN phone_number;

--Q8. Insert all 10 students into the students table
INSERT INTO students (student_id, first_name, last_name, gender, date_of_birth, "class", city)
VALUES 
(2, 'Brian', 'Ochieng', 'M', '2007-07-25', 'Form 4', 'Mombasa'),
(3, 'cynthia', 'Mutua', 'F', '2008-11-05', 'Form 3', ' Kisumu'),
(4, 'David', 'Kamau', 'M', '2007-02-18', 'Form 4', 'Nairobi'),
(5, 'Esther', 'Akinyi', 'F', '2009-06-30', 'Form 2', 'Nakuru'),
(6, 'Felix', 'Otieno', 'M', '2009-09-14', 'Form 2', 'Eldoret'),
(7, 'Grace', 'Mwangi', 'F', '2008-01-22', 'Form 3', 'Nairobi'),
(8, 'Hassan', 'Abdi', 'M', '2007-04-09', 'Form 4', 'Mombasa'),
(9, 'Ivy', 'Chebet', 'F', '2009-12-01', 'Form 2', 'Nakuru'),
(10, 'James', 'Kariuki', 'M', '2008-08-17', 'Form 3', 'Nairobi');

--Q9. Insert all 10 subjects into the subjects table.
INSERT INTO subjects (subject_id, subject_name, department, teacher_name, credit_hours)
VALUES
(1, 'Mathematics', 'Sciences', 'Mr.Njoroge', 4),
(2, 'English', 'Languages', 'Ms.Adhiambo', 3),
(3, 'Biology', 'Sciences', 'Ms.Otieno', 4),
(4, 'History', 'Humanities', 'Mr.Waweru', 3),
(5, 'Kiswahili', 'Languages', 'Ms.Nduta', 3),
(6, 'Physics', 'Sciences', 'Mr.Kamande', 4),
(7, 'Geography', 'Humanities', 'Ms.Chebet', 3),
(8, 'Chemistry', 'Sciences', 'Ms.Muthoni', 4),
(9, 'Computer Studies', 'Sciences', 'Mr.Oduya', 3),
(10, 'Business Studies', 'Humanities', 'Ms.Wangari', 3);

--Q10. Insert all 10 exam results into the exam_results table
INSERT INTO exam_results (result_id, student_id, subject_id, marks, exam_date, grade)
VALUES 
(1, 1, 1, 78,'2024-03-15', 'B'),
(2, 1, 2, 85,'2024-03-16', 'A'),
(3, 2, 1, 92,'2024-03-15', 'A'),
(4, 2, 3, 55,'2024-03-17', 'C'),
(5, 3, 2, 49, '2024-03-16', 'D'),
(6, 3, 4, 71, '2024-03-18', 'B'),
(7, 4, 1, 88, '2024-03-15', 'A'),
(8, 4, 6, 63, '2024-03-19', 'C'),
(9, 5, 5, 39, '2024-03-20', 'F'),
(10, 6, 9, 95, '2024-03-21', 'A');

--Q11. After inserting the data, run a SELECT query to confirm all 10 rows exist in each of the three tables.
SELECT * FROM students;
SELECT * FROM subjects;
SELECT * FROM exam_results;

--Q12. Esther Akinyi has moved from Nakuru to Nairobi. Write an UPDATE statement to change her city. (Her student_id is 5)
UPDATE students
SET city = 'Nairobi'
WHERE student_id = 5;

--Q13. The marks for result_id 5 were entered incorrectly - the correct marks are 59, not 49. Write an UPDATE to fix this.
UPDATE exam_results
SET marks = 59
WHERE result_id = 5;

--Q14. The exam result with result_id 9 has been cancelled by the school. Write a DELETE statement to remove it from the exam_results table.
DELETE FROM exam_results
WHERE result_id = 9;

--Q15. Write a query to find all students who are in Form 4.
SELECT first_name, last_name
FROM students
WHERE "class" = 'Form 4';

--Q16. Write a query to find all subjects in the Sciences department.
SELECT subject_name FROM subjects
WHERE department = 'Sciences';

--Q17. Write a query to find all exam results where the marks are greater than or equal to 70.
SELECT *  FROM exam_results
WHERE marks >= 70;

--Q18. Write a query to find all female students only. (Hint: gender = 'F')
SELECT * FROM students
WHERE gender = 'F';

--Q19. Write a query to find all students who are in Form 3 AND from Nairobi.
SELECT * FROM students
WHERE "class" = 'Form 3' AND city = 'Nairobi';

--Q20. Write a query to find all students who are in Form 2 OR Form 4.
SELECT * FROM students
WHERE "class" = 'Form 2' OR "class" = 'Form 4';

-- PART2 - BETWEEN, IN/NOT IN, LIKE, COUNT, and CASE WHEN

-- Q1. Write a query to find all exam results where marks are between 50 and 80 (inclusive).
SELECT * FROM exam_results
WHERE marks BETWEEN 50 AND 80;

-- Q2. Write a query to find all exams that took place between 15th March 2024 and 18th March 2024.
SELECT * FROM exam_results
WHERE exam_date BETWEEN '2024-03-15' AND '2024-03-18';

-- Q3. Write a query to find all students who live in Nairobi, Mombasa, or Kisumu - use IN.
SELECT * FROM students
WHERE city IN ('Nairobi', 'Mombasa', 'Kisumu');

--Q4. Write a query to find all students who are NOT in Form 2 or Form 3 - use NOT IN.
SELECT * FROM students
WHERE "class" NOT IN ('Form 2', 'Form 3');

--Q5. Write a query to find all students whose first name starts with the letter 'A' or 'E' - use LIKE.
SELECT * FROM students
WHERE first_name LIKE 'A%' OR first_name LIKE 'E%';

--Q6. Write a query to find all subjects whose subject name contains the word 'Studies'.
SELECT * FROM subjects
WHERE subject_name LIKE '%Studies%';

-- Q7. How many students are currently in Form 3? Write the query.
SELECT COUNT(*) FROM students
WHERE "class" = 'Form 3';

--Q8. How many exam results have a mark of 70 or above? Write the query.
SELECT count(*) FROM exam_results
WHERE marks >= 70;

/* SECTION C - CASE WHEN
Q9. Write a query using CASE WHEN to label each exam result with a grade description:
•	'Distinction' if marks >= 80
•	'Merit' if marks >= 60
•	'Pass' if marks >= 40
•	'Fail' if marks below 40
Call the new column performance.*/
SELECT *, 
CASE
	WHEN marks >= 80 THEN 'Distinction'
	WHEN marks >= 60 THEN 'Merit'
	WHEN marks >= 40 THEN 'Pass'
	ELSE 'Fail'
	END AS performances
FROM exam_results;

/*Q10. Write a query using CASE WHEN to label each student as:
•	'Senior' if they are in Form 3 or Form 4
•	'Junior' if they are in Form 2 or Form 1
Call the new column student_level. Show the student's first name, last name, class, and student_level in your result.*/
SELECT first_name, last_name, "class",
CASE 
	WHEN "class" = 'Form 3' OR "class" = 'Form 4' THEN 'Senior'
	WHEN "class" = 'Form 2' OR "class" = 'Form 1' THEN 'Junior'
	END AS student_level
FROM students;

SELECT * FROM students;
	
	
	
	
	
	
	
	
	
	
	