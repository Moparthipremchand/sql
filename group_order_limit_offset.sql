use 61r;
show tables;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2),
    rating DECIMAL(2,1),
    stock INT,
    brand VARCHAR(30),
    sold_quantity INT
);
INSERT INTO products (product_id, product_name, category, price, rating, stock, brand, sold_quantity) VALUES
(1, 'Echo Dot', 'Electronics', 3499, 4.6, 120, 'Amazon', 500),
(2, 'Kindle Paperwhite', 'Electronics', 9999, 4.8, 80, 'Amazon', 300),
(3, 'Fire TV Stick', 'Electronics', 3999, 4.5, 50, 'Amazon', 450),
(4, 'Instant Pot Duo', 'Kitchen', 7999, 4.7, 30, 'InstantPot', 200),
(5, 'Air Fryer', 'Kitchen', 5999, 4.6, 40, 'Philips', 150),
(6, 'Samsung Galaxy S23', 'Mobiles', 69999, 4.8, 25, 'Samsung', 100),
(7, 'OnePlus 11', 'Mobiles', 49999, 4.7, 20, 'OnePlus', 90),
(8, 'Bose Headphones', 'Electronics', 19999, 4.5, 15, 'Bose', 80),
(9, 'Logitech Mouse', 'Electronics', 1299, 4.4, 200, 'Logitech', 600),
(10, 'Amazon Basics Bag', 'Accessories', 999, 4.3, 300, 'Amazon', 400);

select * from products;

--  group by
--  Find the total sold_quantity of products for each category.  
select category, sum(sold_quantity) as sold_quantity
from products
group by category;

select * from products;
--  Find the average price of products for each brand. 
select product_name, avg(price) as average_priice
from products
group by product_name;

select * from products;
--  Count how many products are available in each category.
select category, count(product_name) as products_in
from products
group by category;

select * from products;
--  Find the maximum rating of products for each category.
select category ,max(rating) as maximum_rating
from products
group by category;

select * from products;
--  Find the minimum price of products for each brand.
select product_name, min(price) as minimum_price
from products
group by product_name;


select * from products;
--   HAVING
--  Find all categories where the total sold_quantity is greater than 1000.
select category, sum(price) as total_p
from products
group by category
having total_p > 1000;

select * from products;
--  Find brands where the average price of products is more than 10000.
select product_name, avg(price) as avg_p
from products
group by product_name
having avg_p > 10000;

select * from products;
--  Find categories where the maximum rating is greater than 4.7.
select category, max(rating) as max_rat
from products
group by category
having max_rat > 4.7;

select * from products;
--  Find brands where the count of products is more than 2.
select brand , count(brand) as brand_count
from products
group by brand
having brand_count >2;

select * from products;
--  Find categories where the sum of stock is less than 200.
select  category, sum(stock) as total_stock
from products
group by category
having total_stock <200;

select * from products;
--  ORDER BY 
-- List all products ordered by price ascending. 
select * 
from products
order by price asc;
 
-- Show all products ordered by sold_quantity descending.
select * 
from products
order by sold_quantity desc;

-- Display products ordered by rating descending and then price ascending.
select * 
from products
order by rating desc, price asc;

--  List all products ordered by category ascending and sold_quantity descending.
select * 
from products
order by category asc, sold_quantity desc;

--  Show all products ordered by brand alphabetically.
select * 
from products
order by brand asc;

--  LIMIT
-- Show the first 5 products in the table. 
select * 
from products
limit 5;


select * from products;
--  Show the top 3 highest-priced products. 
select product_name , max(price) as max_price
from products
group by product_name
limit 3;

-- Show the first 5 products when ordered by rating descending. 
select *
from products
order by rating desc
limit 5 ;

--  Show 2 products after skipping the first 5 rows.
select *
from products
limit 2 offset 5;

-- Display the top 10 products with highest sold_quantity. 
select * 
from products
order by sold_quantity desc 
limit 10;

-- ASC / DESC 
--   Show all products sorted by price ascending.
select * 
from products
order by price asc;

--  Show all products sorted by rating descending.
select * 
from products
order by rating desc;

--  Display products sorted by sold_quantity descending, then price ascending.
select * 
from products
order by  sold_quantity desc, price asc;

-- List products sorted by category ascending, then sold_quantity descending.
select * 
from products
order by  category asc, sold_quantity desc;

--  Show all products sorted by brand descending.
select * 
from products
order by  brand desc;

