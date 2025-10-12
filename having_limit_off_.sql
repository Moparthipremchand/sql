use 61r;
show tables;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    food_item VARCHAR(50),
    category VARCHAR(30),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE,
    restaurant VARCHAR(100)
);

INSERT INTO orders (order_id, customer_name, food_item, category, quantity, price, order_date, restaurant)
VALUES
(1, 'Arjun', 'Pizza', 'Fast Food', 2, 500, '2025-01-05', 'Domino’s'),
(2, 'Sneha', 'Burger', 'Fast Food', 3, 450, '2025-01-06', 'McDonald’s'),
(3, 'Rahul', 'Biryani', 'Main Course', 1, 250, '2025-01-07', 'Paradise'),
(4, 'Priya', 'Dosa', 'South Indian', 2, 200, '2025-01-08', 'Saravana Bh.'),
(5, 'Kiran', 'Pasta', 'Italian', 1, 300, '2025-01-09', 'Olive Garden'),
(6, 'Aditi', 'Sandwich', 'Snacks', 2, 220, '2025-01-10', 'Subway'),
(7, 'Ramesh', 'Salad', 'Healthy', 1, 150, '2025-01-11', 'Fresh Bowl'),
(8, 'Kavya', 'Ice Cream', 'Dessert', 3, 180, '2025-01-12', 'Cream Stone'),
(9, 'Manoj', 'Noodles', 'Chinese', 2, 240, '2025-01-13', 'Mainland Ch.'),
(10, 'Meera', 'Paneer Curry', 'Main Course', 1, 280, '2025-01-14', 'Bikanervala');
select * 
from orders;

--  GROUP BY & Aggregates 
-- Find the total sales amount for each restaurant. 
select restaurant,price
from orders
group by restaurant, price;


select * from orders;
--  Show the average price of food items per category. 
select category,  avg(price) as average_price
from orders
group by category;


select * from orders;
--  Count how many orders were placed for each food category. 
select category, sum(quantity) as num_order
from orders
group by category;

--  Find the maximum quantity ordered for each food item.
 select category, max(quantity) as max_order
from orders
group by category;


select * from orders;
--  Show the total amount spent by each customer.
select customer_name, sum(price) as t_amoun_customer
from orders
group by customer_name;


select * from orders;
-- HAVING 
--   Find restaurants with total sales greater than 800. 
select restaurant, sum(price) as t_price
from orders
group by restaurant
having t_price > 300;


-- Show customers who spent more than 500 in total. 
select customer_name,price, sum(price) as c_price
from orders
group by customer_name, price
having c_price >=500;

--   Find food categories where the average item price > 250. 
select category, avg(price) as average_price
from orders
group by category
having average_price > 250;


select * from orders;
--   Get restaurants with more than 2 orders. 
select restaurant, quantity
from orders
group by restaurant, quantity
having quantity > 2;


--  Show categories where the total quantity ordered > 4. 
select category, sum(quantity) as total_quantaty
from orders
group by category
having total_quantaty > 4;


select * from orders;
--  ORDER BY 
-- List all orders by price descending. 
select * from orders
order by price desc;

--  Show customers ordered by their total spending. 
 select customer_name, price 
from orders
group by customer_name, price
order by price desc;

select * from orders;
--  Display restaurants ordered by total quantity sold. 
select restaurant, sum(quantity) as sum_quantity
from  orders
group by restaurant
order by sum_quantity ;


--  Show the top 3 highest-priced food items. 
select  food_item, price
from orders
group by food_item, price
order by price desc
limit 3;

--   List orders sorted by order_date (latest first). 
select * 
from orders
order by order_date desc;


select * from orders;
--  LIMIT & OFFSET 
-- Show the first 5 orders from the table.  
select * 
from orders
limit 5;

--  Get the top 3 most expensive orders. 
select food_item, price
from orders
order by price desc
limit 3;

--  Skip the first 3 rows and show the next 4 orders. 
select *
from orders
limit 4 offset 3;

--  Find the second highest-priced food item using LIMIT + OFFSET. 
select *
from orders
having price > 300
order by price desc
limit 1 offset 1;


select * from orders;
--  Show the top 2 customers by total spending. 
select  customer_name, sum(price) as total_sepnd_customer
from orders
group by customer_name
order by total_sepnd_customer desc
limit 2;


select * from orders;
--  Combined Questions (on FoodOrders table) 
--  Find the total spending by each customer, but show only those who spent more than ₹500, 
-- ordered by spending descending. 
select customer_name, sum(price) as t_price
from orders
group by customer_name
having t_price >=500
order by t_price desc;

select * from orders;
--  Show the top 3 food categories with the highest total sales amount. 
select category, sum(price) as high_sale
from orders
group by category
limit 3;

--   Find the restaurants where average price > 250, ordered by average price descending. 
select restaurant, price, avg(price) as avg_price
from orders
where price > 250
group by restaurant, price;

select * from orders;
-- Show the top 2 customers who placed the highest quantity of food items (using GROUP BY + 
-- ORDER BY + LIMIT). 
select customer_name, sum(quantity) as item_quantity
from orders
group by customer_name
order by item_quantity desc
limit 5;

select * from orders;
--  Find the restaurant with the maximum total sales, but skip the top 1 and show the second 
-- highest restaurant (using LIMIT + OFFSET). 
select restaurant, price, max(price) as maximum_sale
from orders
group by restaurant, price
order by maximum_sale desc
limit 1 offset 1;


--   List the categories with more than 2 total orders, ordered by total quantity sold. 
select category, sum(quantity) as total_orders
from orders
group by category
having total_orders > 2
order by total_orders desc;

select * from orders;
--   Find the top 3 food items by total sales amount, grouped by food_item, ordered 
-- descending.
select food_item, sum(price) as total_sale_amount
from orders
group by food_item 
order by total_sale_amount desc
limit 3;

select * from orders;
-- Show customers who ordered more than 2 different categories, ordered by the count of 
-- categories descending.
select customer_name, count(category) as order_categry_count
from orders
group by customer_name
having order_categry_count > 2
order by order_categry_count desc;



















 
