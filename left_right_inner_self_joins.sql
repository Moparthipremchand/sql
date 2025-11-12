use 61r;

CREATE TABLE Customers (
  c_id INT PRIMARY KEY AUTO_INCREMENT,
  c_name VARCHAR(50) not null,
  c_city VARCHAR(30) not null,
  c_email VARCHAR(100) not null
);

INSERT INTO Customers (c_name, c_city, c_email) VALUES
('Vamsi', 'Hyderabad', 'vamsi@shopease.com'),
('Priya', 'Chennai', 'priya@shopease.com'),
('Rahul', 'Delhi', 'rahul@shopease.com'),
('Sneha', 'Mumbai', 'sneha@shopease.com'),
('Arjun', 'Pune', 'arjun@shopease.com'),
('Kiran', 'Hyderabad', 'kiran@shopease.com'),
('Divya', 'Bangalore', 'divya@shopease.com'),
('Sai', 'Vizag', 'sai@shopease.com'),
('Meena', 'Chennai', 'meena@shopease.com'),
('Anil', 'Delhi', 'anil@shopease.com');

CREATE TABLE customers_Orders (
  o_id INT PRIMARY KEY AUTO_INCREMENT,
  c_id INT,
  o_product VARCHAR(100),
  o_amount DECIMAL(10,2),
  o_date DATE,
  FOREIGN KEY (c_id) REFERENCES Customers(c_id)
);

set foreign_key_checks=0;

INSERT INTO customers_Orders (c_id, o_product, o_amount, o_date) VALUES
(1, 'Mobile', 15000, '2025-10-10'),
(1, 'Headphones', NULL, '2025-10-15'),    -- NULL amount
(2, 'Laptop', 55000, '2025-09-05'),
(3, 'Smart Watch', 7000, '2025-08-20'),
(3, 'Keyboard', NULL, '2025-08-22'),      -- NULL amount
(4, 'Television', 42000, '2025-07-18'),
(6, 'Tablet', 18000, '2025-10-02'),
(6, 'Mouse', NULL, '2025-10-10'),
(8, 'Fridge', 30000, '2025-09-09'),
(9, 'AC', 40000, '2025-08-01'),
(9, NULL, 2000, '2025-08-05'),            -- NULL product
(11, 'Camera', 22000, '2025-06-20');      -- invalid c_id for RIGHT JOIN demo

set foreign_key_checks=1;

-- LEFT JOIN-- 
 -- 1 Show all customers and their order details (include customers with no orders)
 select c_name, o_product,o_amount
 from customers
 left join customers_Orders
 using (c_id);
 
 -- 2 Find customers who have NOT placed any order 
 select c_name, o_product,o_amount
 from customers
 left join customers_Orders
 using (c_id)
 where o_product is null;
 
-- 3 Show all customers and total amount they have spent (include zero if no order)
  select c_name, sum(o_amount) as total_amount
 from customers
 left join customers_Orders
 using (c_id)
 group by c_name;
 
 --  4. Display customers and latest order date (if any)
 select c_name, max(o_date) as latest_date
 from customers
 left join customers_Orders
 using (c_id)
 group by c_id
 order by latest_date desc;
 
 --  Find customers who ordered NULL-priced products
select c_name, o_amount
from customers
left join customers_Orders
using (c_id)
where o_amount is null;

-- right join
-- -- 1. Show all orders and their corresponding customer names
select c_name, o_product,o_amount
from customers
right join customers_Orders
using (c_id);

-- 2. Find all orders that belong to non-existing customers
select o_product, o_amount, o_date
from customers
right join customers_Orders
using (c_id)
where customers.c_id is null;


-- 3. Display all orders with their customer’s city (if available)
select c_name, c_city, o_product, o_amount, o_date
from customers
right join customers_Orders
using (c_id);

-- 4. List all orders placed after August 2025, even if customer data is missing
select c_name,  o_product, o_date
from customers
right join customers_Orders
using (c_id)
where o_date > 2025;

-- inner join
-- 1. Get all customers with their ordered products
select c_name, o_product
from customers
inner join customers_Orders
using (c_id);

-- 2. Find each customer’s city and total purchase amount
select c_city,sum(o_amount) as total_purchase
from customers
inner join customers_Orders
using(c_id)
group by c_city;

-- 3. Show all customers who purchased items costing above ₹20,000
select c_name, o_amount
from customers
inner join customers_Orders
using (c_id)
where o_amount > 20000;

-- 4. Get all customer names with their order dates and product names
select c_name, o_product, o_date
from customers
inner join customers_Orders
using (c_id);

-- 5. Find total number of orders placed by each customer
select c_name, count(o_product) as total_order
from customers
inner join customers_Orders
using (c_id)
group by c_name
order by total_order desc;

-- self join 

select *
from Customers;
-- self join  
-- 1. Find all pairs of customers living in the same city 
select c1.c_name as name1, c2.c_name as name2, c1.c_city as city
from Customers c1
join Customers c2
on c1.c_city = c2.c_city
and c1.c_id < c2.c_id;

-- 2. Find customers who share a city with 'Vamsi'
select c1.c_name as pname1, c1.c_name as pname1, c1.c_city as city
from Customers c1
join Customers c2
using (c_city)
where c1.c_city="Hyderabad"
and c1.c_id < c2.c_id;

-- List cities that have more than one customer.
select c1.c_city, count(c1.c_name) as total_customers
from Customers c1
join Customers c2
on c1.c_city = c2.c_city
and c1.c_name <> c2.c_name
group by c_city
having total_customers>1;


-- Show the total number of customers per city (only for cities with more than one person).
select c1.c_city, count(c2.c_name) as t_customers
from  Customers c1
join   Customers c2
on c1.c_city = c2.c_city
and c2.c_name <> c1.c_name
group by c1.c_city;

-- Display customer pairs only from Hyderabad.
select c1.c_name as c1name, c2.c_name as c2name,c1.c_city
from  Customers c1
join Customers c2
on c1.c_city = c2.c_city
and c2.c_name < c1.c_name and c1.c_city="Hyderabad" ;

-- Find customers who don’t share their city with anyone else.
select c1.c_name, count(c2.c_city) as l_city
from  Customers c1
join Customers c2
on c1.c_city = c2.c_city
group by c1.c_name
having l_city <=1;

-- Find customers whose names start with the same letter.
select c1.c_name, c2.c_name
from  Customers c1
join Customers c2
on left(c1.c_name,1)=left(c2.c_name, 1)
and c1.c_name < c2.c_name;
















 
