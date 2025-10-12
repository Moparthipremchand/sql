create database 61r;
show databases;
use 61r;
create table hr (
empid int primary key,
empname varchar(60) not null,
Department varchar(30) not null,
Salary decimal(10,2) not null,
JoiningDate date
);
show tables;
select * from hr;
insert into hr (empid,empname,Department,Salary,JoiningDate)
values (1,"vikrantha","hr operations",47000,'2022-07-12'),
(2,"subhani","testinge ",60000,'2023-12-05'),
(3,"navarath","business development",30000,'2022-03-24'),
(4,"ankith","software daveloper",80000,'2023-06-19');
select * from hr;
select * from hr
where empid=3;
select * from hr
where Salary > 50000