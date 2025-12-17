use 61r;

CREATE TABLE sales_table (
    sale_id INT PRIMARY KEY,
    salesperson VARCHAR(50) not null,
    region VARCHAR(50) not null,
    sale_date DATE,
    product VARCHAR(50) not null,
    units_sold INT,
    total_amount INT
);


INSERT INTO sales_table (sal_id, salesperson, region, sale_date, product, units_sold, total_amount) VALUES
(1, 'John', 'North', '2024-01-02', 'Laptop', 5, 250000),
(2, 'Mary', 'South', '2024-01-03', 'Laptop', 3, 150000),
(3, 'Alex', 'North', '2024-01-05', 'Tablet', 8, 160000),
(4, 'John', 'North', '2024-02-01', 'Laptop', 4, 200000),
(5, 'Mary', 'South', '2024-02-04', 'Tablet', 10, 180000),
(6, 'Alex', 'East', '2024-02-05', 'Laptop', 6, 300000),
(7, 'John', 'North', '2024-03-02', 'Tablet', 2, 40000),
(8, 'Mary', 'South', '2024-03-06', 'Laptop', 5, 250000),
(9, 'Alex', 'East', '2024-03-08', 'Tablet', 7, 140000),
(10, 'John', 'North', '2024-03-09', 'Laptop', 3, 150000);


--  ROW_NUMBER()
--  1️ Write a query to assign a unique rank to each sale in order of total_amount (highest first).

select salesperson,region, total_amount, rank_order
from ( select salesperson,region, total_amount, row_number() over(order by total_amount desc) as rank_order
from sales_table
) as region;

-- 2️ Find the top 3 salespersons based on total sales amount using the RANK() function. 
select salesperson, total_amount, p_rank
from ( select salesperson, total_amount, rank() over(order by total_amount desc) as p_rank
from sales_table
) as r_table
where p_rank in (1,2,3);

-- 3 Display each salesperson’s rank based on their total sales amount, ensuring that rank numbers are consecutive even for ties.
select salesperson,  t_amount,total
from (select salesperson, sum(total_amount) as t_amount, dense_rank() over(order by sum(total_amount)) as total
from sales_table
group by salesperson ) as total_s;

-- 4   Show the rank of each salesperson within their region based on total_amount.
select salesperson, region, t_amount,total
from (select salesperson, region, sum(total_amount) as t_amount, dense_rank() over(partition by region order by sum(total_amount) desc) as total
from sales_table
group by salesperson, region
 ) as total_s;


-- 5  Divide all sales into 4 quartiles (NTILE(4)) based on total sales amount and show which quartile each sale falls into.
SELECT sale_id, salesperson, region, product, total_amount,
    NTILE(4) OVER (ORDER BY total_amount DESC) AS quartile
FROM sales_table;

-- 6 Calculate the running total of total_amount for each salesperson ordered by sale_date.
select salesperson, sale_date, t_amount, date_wise
from (
select salesperson, sale_date, sum(total_amount) as t_amount,rank() over(order by sale_date) as date_wise
from sales_table
group by sale_date, salesperson
) as running_total;

-- 7 For each region, find the average total_amount using AVG() OVER (PARTITION BY region).
SELECT
    salesperson,
    region,
    AVG(total_amount) OVER (PARTITION BY region ) AS avg_region_amount
FROM sales_table;


-- 8 For each region, show the total number of sales made (without grouping).
select salesperson, region,r_n
from (select salesperson, region, count(units_sold)   over (partition by region) as r_n
from sales_table) as sale
order by r_n;

-- 9 For each salesperson, display their current sale amount and the previous sale amount using LAG(total_amount).
select salesperson, sale_date, total_amount, rank()
over (partition by salesperson order by salesperson, sale_date) as recent_sale
from sales_table;

-- 10 For each salesperson, display their sale and the next sale amount using LEAD(total_amount).
select salesperson, sale_date, total_amount, lead(total_amount) 
over (partition by salesperson order by sale_date ) as next_amt
from sales_table;

-- 11 Calculate the cumulative sales of each region over time (ordered by sale_date).
select salesperson, region, sale_date, row_number()
over(partition by region order by sale_date) as tab
from sales_table ;

-- 12  For each salesperson, find how much more (or less) they sold compared to their previous sale 
-- using total_amount - LAG(total_amount) OVER (PARTITION BY salesperson ORDER BY sale_date)
select salesperson,  total_amount - LAG(total_amount)
 OVER (PARTITION BY salesperson ORDER BY sale_date) as leas
 from sales_table;
 
-- 13 Find the top-performing salesperson in each region 
-- using a CTE and RANK() OVER (PARTITION BY region ORDER BY total_amount DESC). 
SELECT salesperson, region, SUM(total_amount) AS total_sales,
RANK() OVER (PARTITION BY region ORDER BY SUM(total_amount) DESC) AS region_rank
FROM sales_table
GROUP BY salesperson, region;

-- 14 Calculate the percentage contribution of each sale to the total company sales using
-- (total_amount * 100.0 / SUM(total_amount) OVER ()).
select total_amount,sale_id, salesperson, 
(total_amount * 100.0 / SUM(total_amount) OVER ()) as percentage
from sales_table;
 

-- 15 Using FIRST_VALUE(), show each salesperson’s first sale amount and sale_date.
select salesperson, total_amount, sale_date, first_value(total_amount) over(partition by salesperson order by total_amount) as first_amount
from sales_table 


