--Creating tables
CREATE TABLE departments (
dept_no VARCHAR(30) PRIMARY KEY NOT NULL,
dept_name VARCHAR(30) NOT NULL
);
CREATE TABLE dept_emp (
emp_no INT NOT NULL,
dept_no VARCHAR(30) NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
CREATE TABLE titles (
title_id VARCHAR(30) PRIMARY KEY NOT NULL,
title VARCHAR(30) NOT NULL
);
CREATE TABLE employees (
emp_no INT PRIMARY KEY NOT NULL,
emp_title VARCHAR(30) NOT NULL,
birth_date VARCHAR NOT NULL,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
sex VARCHAR(30) NOT NULL,
hire_date VARCHAR(30) NOT NULL,
FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);
CREATE TABLE salaries (
emp_no INT PRIMARY KEY NOT NULL,
salary INT NOT NULL
);
CREATE TABLE dept_manager (
dept_no VARCHAR(30) NOT NULL,
emp_no INT PRIMARY KEY NOT NULL
);
-- 1. List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no, employees.last_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no=salaries.emp_no;
-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date LIKE '%1986';
-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN employees ON
dept_manager.emp_no=employees.emp_no
INNER JOIN departments ON
dept_manager.dept_no=departments.dept_no;
-- 4. List the department number for each employee along with that employee's employee number, last name, first name, and department name
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON
dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON
dept_emp.dept_no=departments.dept_no;
-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whos last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
-- 6. List each employee in the Sales department, including their employee number, last name, and first name
SELECT departments.dept_name, departments.dept_no, dept_emp.emp_no, employees.first_name, employees.last_name
FROM dept_emp
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no
INNER JOIN employees ON
employees.emp_no=dept_emp.emp_no
WHERE dept_name = 'Sales';
-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and departments name
SELECT departments.dept_name, dept_emp.emp_no, employees.first_name, employees.last_name
FROM dept_emp
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no
INNER JOIN employees ON
employees.emp_no=dept_emp.emp_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';