--List first name, last name, and hire date for employees who were hired in 1986.
DROP view if exists emp_list_1986;
Create view emp_list_1986 as
select 
	employee.last_name,
	employee.first_name,
	employee.hire_date
From employee
inner join salaries on employee.emp_no = salaries.emp_no;

select * from emp_list_1986 
where hire_date > '1986-01-01'and hire_date <'1986-12-31'
;

select * from emp_list_1986;

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
DROP view if exists managers;
Create view managers as
select 
	dept_manager.dept_no,
	dept_manager.emp_no,
	department.dept_name
From dept_manager
inner join department on dept_manager.dept_no = department.dept_no;

select * from managers ;

DROP view if exists managers_name;
Create view managers_name as
select 
	managers.dept_no,
	managers.emp_no,
	managers.dept_name,
	employee.last_name,
	employee.first_name
From managers
inner join employee on managers.emp_no = employee.emp_no;

select * from managers_name ;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

DROP view if exists emp_dept;
Create view emp_dept as
select 
	dept_emp.emp_no,
	department.dept_name
From dept_emp
inner join department on dept_emp.dept_no = department.dept_no;

select * from emp_dept ;

DROP view if exists emp_dept_w_name;
Create view emp_dept_w_name as
select 
	emp_dept.emp_no,
	emp_dept.dept_name,
	employee.last_name,
	employee.first_name
From emp_dept
inner join employee on emp_dept.emp_no = employee.emp_no;

select * from emp_dept_w_name ;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

DROP view if exists hercules_name;
Create view hercules_name as
select 
	employee.first_name,
	employee.last_name,
	employee.sex
From employee 
where first_name = 'Hercules' and SUBSTRING (employee.last_name, 1 , 1 ) = 'B';

select * from hercules_name ;


--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.

DROP view if exists sales_dept;
Create view sales_dept as
select 
	emp_dept_w_name.emp_no,
	emp_dept_w_name.last_name,
	emp_dept_w_name.first_name,
	emp_dept_w_name.dept_name
from emp_dept_w_name
where dept_name = 'Sales';

select * from sales_dept ;
--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

DROP view if exists sales_and_dev_dept;
Create view sales_and_dev_dept as
select 
	emp_dept_w_name.emp_no,
	emp_dept_w_name.last_name,
	emp_dept_w_name.first_name,
	emp_dept_w_name.dept_name
from emp_dept_w_name
where dept_name = 'Sales' or dept_name = 'Development';

select * from sales_and_dev_dept ;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
DROP view if exists last_name_count;
Create view last_name_count as
SELECT last_name, COUNT(last_name) AS "Count last_name"
FROM employee
GROUP BY last_name
ORDER BY "last_name" DESC;

select * from last_name_count;



--your employee ID number is 499942.
create view emp_id_me as 
select * from employee where emp_no = 499942; 

select * from emp_id_me;