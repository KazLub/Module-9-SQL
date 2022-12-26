-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.gender, 
	salaries.salary
FROM employees
JOIN salaries 
ON employees.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, 
	last_name,  
	hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT
	m.dept_no,
	d.dept_name,
	m.emp_no, 
	e.last_name,
	e.first_name
FROM dept_manager as m
JOIN departments as d 
	ON m.dept_no = d.dept_no
JOIN employees as e 
	on e.emp_no = m.emp_no;
	
-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT e.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name,
	d.dept_no
FROM employees as e
JOIN dept_emp as junct 
	on e.emp_no = junct.emp_no
JOIN departments as d 
	on junct.dept_no = d.dept_no;
	
-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, 
	last_name, 
	gender
FROM employees
WHERE first_name = 'Hercules' 
and  last_name like 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT e.emp_no, 
	e.last_name, 
	e.first_name
FROM employees as e
JOIN dept_emp as junct 
	on e.emp_no = junct.emp_no
JOIN departments as d 
	on junct.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name
FROM employees as e
JOIN dept_emp as junct 
	on e.emp_no = junct.emp_no
JOIN departments as d 
	on junct.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' 
or d.dept_name = 'Development'
order by last_name;

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) as "frequency"
FROM employees 
GROUP BY last_name
ORDER BY frequency desc;