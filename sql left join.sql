use 61r;
CREATE TABLE Dealers (
    dealer_id INT PRIMARY KEY,
    dealer_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);

INSERT INTO Dealers (dealer_id, dealer_name, location) VALUES
(1, 'Elite Motors', 'Mumbai'),
(2, 'Speed Wheels', 'Delhi'),
(3, 'Auto Hub', 'Bangalore'),
(4, 'City Cars', 'Chennai'),
(5, 'Luxury Drive', 'Hyderabad');

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    car_model VARCHAR(100) NOT NULL,
    dealer_id INT,
    sale_amount DECIMAL(12,2) NOT NULL,
    sale_date DATE NOT NULL,
    FOREIGN KEY (dealer_id) REFERENCES Dealers(dealer_id)
);

INSERT INTO Sales (sale_id, car_model, dealer_id, sale_amount, sale_date) VALUES
(101, 'BMW X1', 1, 4200000, '2025-06-12'),
(102, 'BMW X5', 2, 8500000, '2025-06-18'),
(103, 'BMW 3 Series', 1, 5200000, '2025-07-02'),
(104, 'BMW X3', 4, 6400000, '2025-07-10'),
(105, 'BMW 7 Series', 2, 12000000, '2025-08-01'),
(106, 'BMW X6', 3, 9800000, '2025-08-12');

show tables;
--  Display all dealers and the cars they sold  
select Dealers.dealer_id, Dealers.dealer_name, Dealers.location,  count(Sales.dealer_id) as cars_sold
from Dealers
left join Sales
on Dealers.dealer_id=Sales.dealer_id
group by  Dealers.dealer_id, Dealers.dealer_name, Dealers.location
order by Dealers.dealer_id;

--  Show all dealers, even if they didn’t sell any cars (replace NULL with ‘No Sale’).
select Dealers.dealer_name, ifnull(Sales.dealer_id, "no sale") as seles_count
from Dealers
left join Sales
on Dealers.dealer_id=Sales.dealer_id
order by  Dealers.dealer_name;

-- Display car models along with their dealer names and locations. 
select Dealers.dealer_name, Dealers.location, Sales.car_model
from Dealers
left join Sales
on Dealers.dealer_id=Sales.dealer_id;

--  Find all dealers who haven’t made any sales yet.
select Dealers.dealer_id, Dealers.dealer_name, Dealers.location
from Dealers
left join Sales
on Dealers.dealer_id = Sales.dealer_id  
where Sales.dealer_id is null;

--  List each dealer’s name and total sales amount. 
select  Dealers.dealer_id, Dealers.dealer_name, Dealers.location,ifnull(sum(Sales.sale_amount), "0") as total_amount
from Dealers
left join Sales
on Dealers.dealer_id = Sales.dealer_id 
group by Dealers.dealer_id, Dealers.dealer_name, Dealers.location;

--  Display all cars sold by 'Speed Wheels'. 
select  Dealers.dealer_name,Sales.car_model
from Dealers
left join Sales
on Dealers.dealer_id = Sales.dealer_id 
where Dealers.dealer_name = "Speed Wheels"
group by Sales.sale_id,Sales.car_model;

--  Show dealer names with car models and sale dates (sorted by sale_date).
select Dealers.dealer_name, Sales.car_model, Sales.sale_date
from Dealers
left join Sales
on Dealers.dealer_id = Sales.dealer_id 
group by Dealers.dealer_name, Sales.car_model, Sales.sale_date
order by Sales.sale_date asc;

-- Find dealers and their average sale amount. 
select  Dealers.dealer_id, Dealers.dealer_name, Dealers.location, 
	ifnull(sum(Sales.sale_amount), "0") as average_amount
from Dealers
left join Sales
on Dealers.dealer_id = Sales.dealer_id 
group by Dealers.dealer_id, Dealers.dealer_name, Dealers.location
order by average_amount desc;

--  Show dealer names with the count of cars sold. 
select Dealers.dealer_name, count(Sales.dealer_id) as car_sold_count
from Dealers
left join Sales
using(dealer_id)
group by Dealers.dealer_name;

--  Display dealer name, car model, and sale amount for sales above ₹8,000,000.
select Dealers.dealer_name,Sales.car_model,Sales.sale_amount
from Dealers
left join Sales
using(dealer_id)
where Sales.sale_amount > 8000000
group by Dealers.dealer_name, Sales.car_model, Sales.sale_amount;

--  List all car models and replace dealer name with 'Not Assigned' if NULL.
select Dealers.dealer_name,  ifnull(Sales.car_model, "not assigned") as seller
from Dealers
left join Sales
using(dealer_id);

--  Show dealer names and cars sold in July 2025. 
select Dealers.dealer_name, Sales.sale_date 
from Sales
left join Dealers
using(dealer_id)
where Sales.sale_date between '2025-07-01' and '2025-07-31';

--  Find dealers who sold more than one car.
select Dealers.dealer_name, count(Sales.dealer_id) as sale_car_count
from Dealers
left join Sales
using(dealer_id) 
group by Dealers.dealer_name
having sale_car_count >=1;

--  Display all dealers with their total and average sales using LEFT JOIN and GROUP BY.
select  Dealers.dealer_name, ifnull(avg(Sales.sale_amount), "0") as average_sale_from_dealer ,(select avg(Sales.sale_amount) from Sales) as average_sale_count
from Dealers
left join Sales
using(dealer_id) 
group by Dealers.dealer_name;

--  Show all dealers along with their latest sale date (or ‘No Sales Yet’ if none).

select Dealers.dealer_name, ifnull(Sales.sale_date, "No sales yet") as sale_ate
from Dealers
left join Sales
using(dealer_id)
group by Dealers.dealer_name, Sales.sale_date
order by Sales.sale_date;







 