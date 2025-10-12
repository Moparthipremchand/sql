use 61r;
show tables;

create table amazon_products (
sr_no INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
brand VARCHAR(50),
price DECIMAL(10,2),
discount DECIMAL(5,2),
rating DECIMAL(2,1),
stock INT,
sold INT,
seller VARCHAR(50),
sale_date DATE
);

show tables;

insert into amazon_products (sr_no, product_name, category, brand, price, discount, rating, stock, sold, seller, sale_date) VALUES
(1, 'Echo Dot 5th Gen', 'Electronics', 'Amazon', 4499.00, 10.0, 4.5, 200, 150, 'Amazon Retail', '2025-10-01'),
(2, 'Fire TV Stick', 'Electronics', 'Amazon', 3999.00, 15.0, 4.4, 300, 210, 'Amazon Retail', '2025-09-28'),
(3, 'Samsung Galaxy S24', 'Mobiles', 'Samsung', 84999.00, 5.0, 4.7, 50, 40, 'Samsung Store', '2025-09-30'),
(4, 'iPhone 15', 'Mobiles', 'Apple', 129999.00, 3.0, 4.8, 40, 35, 'Apple Store', '2025-10-02'),
(5, 'OnePlus 12', 'Mobiles', 'OnePlus', 69999.00, 8.0, 4.6, 60, 55, 'OnePlus India', '2025-09-29'),
(6, 'Sony WH-1000XM5', 'Headphones', 'Sony', 29990.00, 12.0, 4.8, 120, 90, 'Sony Official', '2025-09-25'),
(7, 'Boat Airdopes 441', 'Headphones', 'Boat', 2499.00, 20.0, 4.3, 500, 400, 'Boat Retail', '2025-09-27'),
(8, 'HP Pavilion 15', 'Laptops', 'HP', 67999.00, 10.0, 4.4, 80, 65, 'HP World', '2025-09-20'),
(9, 'Dell Inspiron 14', 'Laptops', 'Dell', 61999.00, 12.0, 4.5, 75, 68, 'Dell Store', '2025-09-22'),
(10, 'MacBook Air M3', 'Laptops', 'Apple', 124999.00, 5.0, 4.9, 35, 32, 'Apple Store', '2025-09-18'),
(11, 'Asus TUF Gaming F15', 'Laptops', 'Asus', 89999.00, 10.0, 4.6, 45, 40, 'Asus Hub', '2025-09-19'),
(12, 'Canon EOS 200D', 'Cameras', 'Canon', 55999.00, 8.0, 4.7, 25, 20, 'Canon India', '2025-09-15'),
(13, 'Nikon D3500', 'Cameras', 'Nikon', 49999.00, 7.0, 4.5, 30, 28, 'Nikon Outlet', '2025-09-13'),
(14, 'GoPro Hero 12', 'Cameras', 'GoPro', 45999.00, 9.0, 4.8, 40, 35, 'GoPro India', '2025-09-17'),
(15, 'Apple Watch 9', 'Wearables', 'Apple', 45999.00, 6.0, 4.7, 70, 55, 'Apple Store', '2025-09-29'),
(16, 'Noise ColorFit Ultra 3', 'Wearables', 'Noise', 5499.00, 15.0, 4.2, 200, 180, 'Noise Retail', '2025-09-26'),
(17, 'Samsung Galaxy Watch 6', 'Wearables', 'Samsung', 28999.00, 8.0, 4.6, 90, 75, 'Samsung Store', '2025-09-24'),
(18, 'Mi Band 8', 'Wearables', 'Xiaomi', 2999.00, 10.0, 4.3, 250, 220, 'Xiaomi Store', '2025-09-28'),
(19, 'Lenovo Legion 7', 'Laptops', 'Lenovo', 139999.00, 10.0, 4.8, 30, 25, 'Lenovo Hub', '2025-09-23'),
(20, 'JBL Flip 6', 'Speakers', 'JBL', 10999.00, 12.0, 4.5, 150, 130, 'JBL India', '2025-09-21'),
(21, 'Zebronics Mouse', 'Accessories', 'Zebronics', 499.00, 5.0, 4.1, 1000, 850, 'Zebronics Store', '2025-09-22'),
(22, 'Logitech Keyboard K380', 'Accessories', 'Logitech', 3499.00, 10.0, 4.5, 400, 350, 'Logitech India', '2025-09-20'),
(23, 'Apple Magic Mouse', 'Accessories', 'Apple', 9499.00, 5.0, 4.7, 150, 120, 'Apple Store', '2025-09-25'),
(24, 'Samsung 4K TV 55inch', 'Electronics', 'Samsung', 54999.00, 7.0, 4.6, 40, 30, 'Samsung Store', '2025-09-18'),
(25, 'LG 4K OLED TV', 'Electronics', 'LG', 99999.00, 10.0, 4.8, 35, 28, 'LG India', '2025-09-14'),
(26, 'Philips Trimmer', 'Personal Care', 'Philips', 1899.00, 15.0, 4.3, 300, 280, 'Philips India', '2025-09-26'),
(27, 'Havells Hair Dryer', 'Personal Care', 'Havells', 1599.00, 12.0, 4.2, 250, 230, 'Havells Store', '2025-09-25'),
(28, 'Prestige Mixer Grinder', 'Home Appliances', 'Prestige', 4999.00, 10.0, 4.4, 150, 130, 'Prestige Store', '2025-09-28'),
(29, 'LG Refrigerator 260L', 'Home Appliances', 'LG', 25999.00, 8.0, 4.6, 60, 50, 'LG India', '2025-09-29'),
(30, 'Whirlpool Washing Machine', 'Home Appliances', 'Whirlpool', 18999.00, 10.0, 4.5, 55, 40, 'Whirlpool India', '2025-09-23'),
(31, 'Bajaj Electric Kettle', 'Home Appliances', 'Bajaj', 1499.00, 12.0, 4.3, 400, 350, 'Bajaj Retail', '2025-09-24'),
(32, 'Sony Bravia 65inch', 'Electronics', 'Sony', 129999.00, 10.0, 4.9, 25, 22, 'Sony Official', '2025-09-19'),
(33, 'Panasonic AC 1.5T', 'Home Appliances', 'Panasonic', 42999.00, 8.0, 4.5, 45, 38, 'Panasonic India', '2025-09-21'),
(34, 'Dyson Vacuum Cleaner', 'Home Appliances', 'Dyson', 52999.00, 5.0, 4.8, 30, 25, 'Dyson India', '2025-09-27'),
(35, 'Realme 12 Pro', 'Mobiles', 'Realme', 27999.00, 10.0, 4.4, 100, 80, 'Realme Store', '2025-09-28'),
(36, 'Vivo V30', 'Mobiles', 'Vivo', 31999.00, 9.0, 4.3, 90, 70, 'Vivo Store', '2025-09-26'),
(37, 'Oppo Reno 12', 'Mobiles', 'Oppo', 32999.00, 8.0, 4.4, 80, 60, 'Oppo India', '2025-09-25'),
(38, 'Redmi Note 13', 'Mobiles', 'Xiaomi', 18999.00, 10.0, 4.2, 120, 110, 'Xiaomi Store', '2025-09-29'),
(39, 'Motorola Edge 50', 'Mobiles', 'Motorola', 36999.00, 9.0, 4.3, 70, 60, 'Motorola India', '2025-09-24'),
(40, 'POCO X6 Pro', 'Mobiles', 'POCO', 25999.00, 11.0, 4.4, 85, 70, 'POCO India', '2025-09-26');

select * from amazon_products;

-- ading new column
alter table amazon_products
add column manfacturing_date date; 

-- deleting column
alter table amazon_products
drop column manfacturing_date;

-- default values n column
alter table amazon_products
add column country varchar(30) not null default 'india';

select * from amazon_products;

-- changing values
alter table amazon_products
change column country  country_code varchar(10)not null default '+91';

update amazon_products
set country_code = '+91' where sr_no >0;

-- rename 
alter table amazon_products
change column price product_price int not null;

-- delete coloum
alter table amazon_products
drop country_code;

select * from amazon_products;
-- products price less than 2000
select * from amazon_products
where product_price < 2000
order by stock asc;

-- 

