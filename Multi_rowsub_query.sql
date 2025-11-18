use 61r;

CREATE TABLE employees_details (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) not null,
    department VARCHAR(50) not null,
    salary INT
);

INSERT INTO employees_details (emp_id, emp_name, department, salary) VALUES
(1, 'John', 'HR', 50000),
(2, 'Mary', 'IT', 70000),
(3, 'Alex', 'HR', 45000),
(4, 'Steve', 'IT', 65000),
(5, 'Emma', 'Finance', 55000);

select * from employees_details;

-- multiple row query
-- 1 Find all employees who work in the same department as either John or Emma
select emp_name
from employees_details
where department in (select department
from employees_details
where emp_name= "John" or emp_name="Emma");

-- 2 Find all employees whose salary equals any salary from the IT department
select *
from  employees_details
where salary in (
select salary
from employees_details
where department = "IT"
);

-- any
-- 3 Find employees whose salary is greater than any salary of HR department employees
select *
from  employees_details
where salary > any (
select salary
from  employees_details
where department = "HR"
);

-- 4 Find employees whose salary is less than any salary in the IT department
 select *
from  employees_details
where salary < any (
select salary
from  employees_details
where department = "IT"
);


-- all
-- 5 Find employees whose salary is greater than all HR employees
 select *
from  employees_details
where salary > all (
select salary
from  employees_details
where department = "HR"
);

-- 6 Find employees whose salary is less than all IT employees
 
 select *
from  employees_details
where salary < all (
select salary
from  employees_details
where department = "IT"
);