use 61r;
CREATE TABLE employees_table (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) not null,
    department VARCHAR(50) not null,
    salary INT
);

INSERT INTO employees_table (emp_id, emp_name, department, salary) VALUES
(1, 'John', 'HR', 50000),
(2, 'Mary', 'IT', 70000),
(3, 'Alex', 'HR', 45000),
(4, 'Steve', 'IT', 65000),
(5, 'Emma', 'Finance', 55000);


-- single row sub query
-- 1 Find the employee who earns the maximum salary.
select emp_name
from employees_table
where salary = (
select max(salary) as maxsal
from employees_table
);

-- 2 Employees Who Earn More Than the Average Salary

select emp_name, salary
from employees_table
where salary > (
select avg(salary) as avgsal
from employees_table
);

-- 3  Employee Working in the Same Department as “Alex”
select emp_name, department
from employees_table
where department = (
select department
from employees_table
where emp_name = "Alex"
);

-- 4  Employees with Salary Equal to the Minimum Salary
 
select emp_name, salary
from employees_table
where salary = (
select min(salary) as minsal
from employees_table
);

-- 5 Department of the Highest Paid Employee
select emp_name, salary, department
from employees_table
where salary = (
select min(salary) as minsal
from employees_table
);


-- table 2
CREATE TABLE employees_table2 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) not null,
    department VARCHAR(50) not null,
    salary INT,
    city VARCHAR(50) not null
); 

INSERT INTO employees_table2 (emp_id, emp_name, department, salary, city) VALUES
(1, 'John', 'HR', 50000, 'London'),
(2, 'Mary', 'IT', 70000, 'New York'),
(3, 'Alex', 'HR', 45000, 'London'),
(4, 'Steve', 'IT', 65000, 'Paris'),
(5, 'Emma', 'Finance', 55000, 'London'),
(6, 'Rachel', 'Finance', 60000, 'Paris');

-- 6 Find employee(s) working in the same city as ‘Emma’.
select emp_name
from  employees_table2
where city = (
select city
from employees_table2
where emp_name= "Emma"
);

-- 7 Find employees earning less than ‘Mary’.
select emp_name
from  employees_table2
where salary < (
select salary
from employees_table2
where emp_name = "Mary"
);

-- 8  Find department of the lowest-paid employee.
select department
from  employees_table2
where salary = (
select min(salary) as minsal
from employees_table2
);

-- 9  Find the employee who earns the same salary as ‘Steve’.
select emp_name
from employees_table2
where salary = (
select salary
from employees_table2
where emp_name = "Steve"
);

-- 10 Find employees who work in the same department as the employee with ID 2.
select emp_name, department
from employees_table2
where department = (
select department
from employees_table2
where emp_id=2
);

-- 11 Find employees whose salary equals the average salary of all employees.
select emp_name, salary
from  employees_table2
where salary = (
select avg(salary) 
from employees_table2
);

-- 12  Find the highest-paid employee in the Finance department.
select emp_name, salary
from employees_table2
where salary = (
select max(salary)
from employees_table2
where department = "Finance"
);

-- 13 Find department of the employee with the second-highest salary.
select emp_name, department, salary
from employees_table2
where salary = (
select salary
from employees_table2
order by salary desc
limit 1 offset 1
);


 





