use 61r;
 show tables;
CREATE TABLE mobiles (
  mobile_id INT PRIMARY KEY AUTO_INCREMENT,
  brand VARCHAR(50) NOT NULL,
  model VARCHAR(50) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  ram INT NOT NULL,           -- in GB
  storage INT NOT NULL,       -- in GB
  rating DECIMAL(3,1),        -- avg customer rating
  year INT NOT NULL
);
select * from mobiles;

INSERT INTO mobiles (brand, model, price, ram, storage, rating, year) VALUES
('Samsung', 'Galaxy S21', 69999, 8, 128, 4.5, 2021),
('Samsung', 'Galaxy S22', 84999, 12, 256, 4.7, 2022),
('Samsung', 'Galaxy A54', 35999, 6, 128, 4.3, 2023),
('Apple', 'iPhone 13', 79999, 4, 128, 4.8, 2021),
('Apple', 'iPhone 14', 89999, 6, 256, 4.9, 2022),
('Apple', 'iPhone 15', 99999, 6, 256, 5.0, 2023),
('OnePlus', 'Nord CE 3', 24999, 8, 128, 4.2, 2023),
('OnePlus', '11R', 49999, 16, 256, 4.6, 2023),
('OnePlus', '10 Pro', 61999, 12, 256, 4.5, 2022),
('Xiaomi', 'Redmi Note 12', 19999, 6, 128, 4.1, 2023),
('Xiaomi', 'Mi 11 Ultra', 69999, 12, 256, 4.4, 2021),
('Xiaomi', 'Poco X5', 22999, 8, 256, 4.3, 2023),
('Realme', 'GT Neo 3', 29999, 8, 128, 4.4, 2022),
('Realme', 'Narzo 60', 17999, 6, 128, 4.0, 2023),
('Realme', '11 Pro+', 24999, 8, 256, 4.3, 2023),
('Google', 'Pixel 6', 59999, 8, 128, 4.5, 2021),
('Google', 'Pixel 7', 64999, 8, 128, 4.7, 2022),
('Google', 'Pixel 8', 79999, 12, 256, 4.9, 2023),
('Vivo', 'V27', 32999, 8, 128, 4.2, 2023),
('Vivo', 'X90', 57999, 12, 256, 4.6, 2023),
('Vivo', 'Y100', 21999, 8, 128, 4.1, 2022),
('Oppo', 'Reno 8', 38999, 8, 256, 4.3, 2022),
('Oppo', 'Reno 10', 49999, 12, 256, 4.5, 2023),
('Oppo', 'A78', 19999, 6, 128, 4.0, 2023),
('Motorola', 'Edge 40', 29999, 8, 256, 4.4, 2023),
('Motorola', 'G84', 18999, 8, 128, 4.2, 2023),
('Motorola', 'Razr 40', 79999, 12, 256, 4.6, 2023),
('Nokia', 'G60', 19999, 6, 128, 3.9, 2022),
('Nokia', 'X30', 29999, 8, 256, 4.1, 2023),
('Infinix', 'Zero 5G', 17999, 8, 128, 4.0, 2022),
('Infinix', 'GT 10 Pro', 23999, 8, 256, 4.3, 2023),
('Tecno', 'Camon 20', 15999, 8, 256, 4.1, 2023),
('Tecno', 'Phantom X2', 36999, 8, 256, 4.4, 2023),
('Asus', 'ROG Phone 6', 71999, 16, 512, 4.7, 2022),
('Asus', 'Zenfone 9', 58999, 8, 256, 4.6, 2023),
('Sony', 'Xperia 5 IV', 99999, 12, 256, 4.8, 2022),
('Sony', 'Xperia 1 V', 124999, 16, 512, 4.9, 2023),
('Honor', 'Magic 5 Pro', 79999, 12, 256, 4.7, 2023),
('Honor', 'X9a', 24999, 8, 256, 4.3, 2023),
('Huawei', 'P60 Pro', 89999, 12, 256, 4.8, 2023),
('Huawei', 'Mate 50', 99999, 12, 512, 4.9, 2022),
('LG', 'Velvet', 39999, 8, 128, 4.2, 2021),
('LG', 'Wing', 54999, 8, 256, 4.4, 2021),
('Micromax', 'In Note 2', 13999, 6, 128, 3.8, 2022),
('Lava', 'Agni 2', 21999, 8, 256, 4.2, 2023),
('Lava', 'Blaze 5G', 13999, 6, 128, 4.0, 2023),
('Itel', 'Vision 3', 8999, 4, 64, 3.7, 2022),
('Itel', 'P55', 10999, 6, 128, 3.9, 2023),
('ZTE', 'Axon 40', 35999, 8, 256, 4.3, 2022),
('ZTE', 'Blade V50', 19999, 6, 128, 4.0, 2023);

-- Find top 3 brands with the highest average price.
select brand, avg(price) as averageprice
from mobiles
group by brand 
order by averageprice desc
limit 3;

-- Show brands that have more than 5 models launched after 2021.
select year, count(model) as mobile_models
from mobiles
group by year
having mobile_models >=5 and year >2021;

--  Display top 5 brands with the highest average rating above 4.5.
select brand, max(rating) as averagerating
from mobiles
group by brand
having  averagerating >4.5
limit 5;

-- List brands along with their total mobile count, ordered by total count descending.
select brand, count(model) as mobcount
from mobiles
group by brand
order by mobcount desc;

--  Find brands whose total storage capacity exceeds 1000 GB, ordered by total storage descending.
select brand, sum(storage) as total_storage
from mobiles
group by brand
having total_storage >700
order by total_storage desc;

-- Show the 5 cheapest average-priced brands, skipping the first 2 results.
select brand, avg(mobile_id) as averageprice
from mobiles
group by brand
limit 5 offset 2;

-- Display top 5 brands with the most models rated above 4.5.
select * 
from mobiles 
where rating >4.5
order by rating desc
limit 5;

--   Find top 3 brands whose average price is above ₹50,000 and order by their average rating.
select brand, max(price) as maximum_price, avg(rating) as average_rating_of_mobile
from mobiles
group by brand
having maximum_price >50000
order by average_rating_of_mobile desc
limit 3;

-- List brands released after 2020 that have an average rating greater than 4.3, show top 5 only.
select brand, model, avg(rating) as aveg_rate
from mobiles
where year > 2020
group by brand, model
having aveg_rate > 4.3
order by aveg_rate desc
limit 5;


--   Show brands that launched more than 3 mobiles in 2023 and sort them by average price descending.
select brand, count(brand) as mobile_brand, avg(price) as avage_price
from mobiles
where year =2023
group by brand
having mobile_brand >=3
order by avage_price desc;

-- Display top 10 models (by price) for brands with an average rating above 4.5, skipping first 5.
select brand,price, avg(rating) as average_rating
from mobiles
group by brand,price
having average_rating >4.5
order by price desc
limit 10 offset 5;

--  Show top 5 brands that have the highest average RAM size and an average rating above 4.4.
select brand, ram, rating, price, max(ram) as maximum_ram
from mobiles
where rating >4.4
group by brand, ram, rating, price
order by price desc 
limit 5;

--    List 3 most recent brands (by latest year) whose average price is below ₹30,000.
select brand,model,price, max(year) as max_year,avg(price) as average_price
from mobiles
group by brand, model, price
having average_price <30000
order by max_year desc, average_price desc
limit 3;

--  Show all brands having average rating > 4.5 and total models between 2 and 5, sorted by rating descending.
select brand, count(model) as total_mobiles,avg(rating) as average_rating
from mobiles
group by brand
having average_rating > 4.5 and total_mobiles between 2 and 5
order by average_rating desc, total_mobiles desc;

--  Display top 5 brands with highest total RAM capacity, skipping the top 2.
select brand, sum(ram) as total_ram
from mobiles
group by brand
order by total_ram desc
limit 5 offset 2;

-- Find the top 3 years having the most mobile launches, ordered by total mobiles descending.
select year, count(model) as count_mobile
from mobiles
group by year
order by count_mobile desc
limit 3;

-- Show 5 brands with maximum storage combinations, only if average rating > 4.3.
select brand, model, ram, storage,rating 
from mobiles
where rating >4.3
group by brand, model, ram, storage,rating
order by storage desc
limit 5;

-- Display brands having average RAM ≥ 8GB and order them by average price descending (top 5 only).
select brand, model, price, ram,avg(ram) as average_ram, avg(price) as average_price
from mobiles
group by brand, model, price, ram
having average_ram >=8
order by average_price desc
limit 5;

-- Show brands with highest number of models (more than 4), sorted by their total storage, skip first 2.
select brand, count(model) as mobiles_in_each_brand
from mobiles
group by brand
having mobiles_in_each_brand >=3
order by  mobiles_in_each_brand desc
limit 50 offset 2;







 


