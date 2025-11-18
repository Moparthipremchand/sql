use 61r;

CREATE TABLE employees_details2 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) not null,
    department VARCHAR(50) not null,
    salary INT,
    city varchar (30) not null
);

INSERT INTO employees_details2 (emp_id, emp_name, department, salary, city) VALUES
(1, 'John', 'HR', 50000, 'London'),
(2, 'Mary', 'IT', 70000, 'New York'),
(3, 'Alex', 'HR', 45000, 'London'),
(4, 'Steve', 'IT', 65000, 'Paris'),
(5, 'Emma', 'Finance', 55000, 'London'),
(6, 'Rachel', 'Finance', 60000, 'Paris'),
(7, 'David', 'Marketing', 48000, 'Berlin'),
(8, 'Sophia', 'IT', 72000, 'Tokyo'),
(9, 'Liam', 'HR', 52000, 'Sydney'),
(10, 'Olivia', 'Operations', 58000, 'Toronto');

select *
from employees_details2;

-- 1 find employes working in the same department and city as those "HR"
select emp_name, city
from employees_details2
where (department, city)  in (
select department, city
from employees_details2
where department="HR" 
);


-- 2 find employes whose (department, salarey) is greater than any (department , salary) from Finance
select emp_name,salary, department
from employees_details2
where  ( salary) > any  (
select salary
from employees_details2
where department= "Finance"
) and department != "Finance";


-- 2 find employes whose (department, salarey) is greater than all (department , salary) from Finance 
select emp_name,salary, department
from employees_details2
where  ( salary)  > all  (
select salary
from employees_details2
where department= "Finance"
) and department != "Finance";


-- find employes whose (department, city) match those where the average salery is more than 50000
select emp_name, salary
from employees_details2
where (department, city)  in (
select department, city
from employees_details2
group by department, city
having avg(salary) > 50000
);


-- 1  Find employees whose salary is greater than the average salary of any department.
select emp_name, salary 
from employees_details2
where salary >  (
select avg(salary)
from employees_details2
);

-- 2 Find departments having employees working in the same department 
-- as John or Emma, and show total employees per department.
 select department, count(emp_name) as total_employtes_in_department
 from employees_details2
 where department in (
 select department
 from employees_details2
 where emp_name="Emma" or emp_name="John"
 )
 group by department;
 
 -- 3  Find employees whose salary is greater than any employee in the HR department.
select emp_name 
from employees_details2
 where salary  > any (
 select salary
  from employees_details2
  where department="HR"
 ) and department="HR" ;
 
-- 4  Find employees earning less than any average department salary (based on grouped averages).
select emp_name, salary
from employees_details2
where salary < any(
select avg(salary)
from employees_details2
group by department
);

-- 5  Find employees whose salary is greater than all salaries in the HR department.
select emp_name,salary
from employees_details2
where salary > all (
select salary
from employees_details2
where department="HR"
);

-- 6. Find departments where the maximum salary is greater than all IT salaries.
select department
from employees_details2
where salary > all (
select max(salary)
from employees_details2
where department = "IT"
group by department
);



 


