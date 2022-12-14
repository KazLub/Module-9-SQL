--Dropping any exisitng tables

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS departments;


--Create departments table 
CREATE TABLE departments (
	dept_no VARCHAR(20) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(50) UNIQUE NOT NULL
);

--Create titles table
CREATE TABLE titles (
	title_id VARCHAR(30) PRIMARY KEY NOT NULL,
	title VARCHAR(30) UNIQUE NOT NULL
);
--Create dept_emp table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(20) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)  
);

--Create dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(20) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)  
);

--Create employees table
CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(30) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL
);

--Create salaries table
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL
	
);

