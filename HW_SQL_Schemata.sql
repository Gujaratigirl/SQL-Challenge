--Create all of the tables to use from the csv files
-- Delete the table if it exists
DROP TABLE if exists department;

CREATE TABLE department (
	dept_no varchar,
	dept_name varchar
	);
select * from department; 

-- Delete the table if it exists
DROP TABLE if exists dept_emp;

CREATE TABLE dept_emp (
	emp_no integer,
	dept_no varchar
	);
	
select * from dept_emp;	

-- Delete the table if it exists
DROP TABLE if exists dept_manager;

CREATE TABLE dept_manager (
	dept_no varchar,
	emp_no integer
	);
	
select * from dept_manager;

-- Delete the table if it exists
DROP TABLE if exists employee;

CREATE TABLE employee (
	emp_no integer,
	emp_title_id varchar,
	birth_data date,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date date
);
	
select * from employee;

-- Delete the table if it exists
DROP TABLE if exists salaries;

CREATE TABLE salaries (
	emp_no integer,
	salary integer
);
	
select * from salaries;

-- Delete the table if it exists
DROP TABLE if exists titles;

CREATE TABLE titles (
	title_id varchar,
	title varchar
);
	
select * from titles;

--Testing some ideas with the data
-- To see how many departments are in the file
SELECT COUNT ( DISTINCT dept_no ) AS "Number of departments" FROM dept_emp;

SELECT COUNT ( DISTINCT emp_no ) AS "Number of employees" FROM dept_emp;

--Something is wrong here.  There are employees that are listed as working in more than 1 department
SELECT COUNT (dept_no)  AS "Number of employees by Department" FROM dept_emp;

SELECT emp_no, COUNT(emp_no) AS "Emp Number"
FROM dept_emp
GROUP BY emp_no
ORDER BY "Emp Number" DESC;

select * from dept_emp;


--List the following details of each employee: employee number, last name, first name, sex, and salary.
--Make a NEW table
DROP view if exists emp_list;

Create view emp_list as
select employee.emp_no,
	employee.last_name,
	employee.first_name,
	employee.sex,
	salaries.salary
From employee
inner join salaries on employee.emp_no = salaries.emp_no;

select * from emp_list;

--From QuickDBD tool website
-- Physical

CREATE TABLE "Departments" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL
);

CREATE TABLE "Dept_manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "Employee" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" varchar   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" varchar   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "Titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL
);

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");


