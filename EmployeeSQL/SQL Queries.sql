Select * from Titles
Select * from Employees 
Select * from Salaries
Select * from Departments
Select * from Department_Employees_Junction
Select * from Department_Manager_Junction

--1) List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

--2) List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986

--3) List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT DMJ.Dept_No, D.Dept_Name, E.Emp_No, E.Last_Name, E.First_Name
FROM Department_Manager_Junction DMJ
JOIN Departments D ON DMJ.Dept_No = D.Dept_No
JOIN Employees E ON DMJ.Emp_No = E.Emp_No;

--4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT DEJ.Dept_no, E.Emp_No, E.Last_Name, E.First_Name, D.Dept_Name
FROM Department_Employees_Junction DEJ
JOIN Departments D ON DEJ.Dept_No = D.Dept_No
JOIN Employees E ON DEJ.Emp_No = E.Emp_No;

--5) List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6) List each employee in the Sales department, including their employee number, last name, and first name.

--Method 1-Using Join operation
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN Department_Employees_Junction DEJ ON e.emp_no = DEJ.emp_no
JOIN departments d ON DEJ.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--Method 2-Using nested subqueries
SELECT emp_no,last_name, first_name
FROM employees
WHERE emp_no IN
(
  SELECT emp_no
  FROM Department_Employees_Junction
  WHERE dept_no IN
  (
    SELECT dept_no
    FROM departments
    WHERE dept_name = 'Sales'
  )
);

--7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM employees E
JOIN Department_Employees_Junction DEJ ON E.emp_no = DEJ.emp_no
JOIN Departments D ON DEJ.dept_no = D.dept_no
WHERE D.dept_name IN ('Sales', 'Development');

--8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(*) AS frequency_of_names
FROM employees
GROUP BY last_name
ORDER BY frequency_of_names DESC;

