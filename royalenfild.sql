use 61r;
create table RoyalEnfield (
BikeID int primary key,
ModelName varchar(50) not null,
EngineCC int not null,
Price decimal(8,2) not null,
Color varchar(20) not null,
Mileage_KMPL varchar(10) not null,
LaunchYear date not null,
ABS varchar(20) not null,
FuelType varchar(20) not null 
);
insert into RoyalEnfield(BikeID, ModelName, EngineCC, Price, Color, Mileage_KMPL, LaunchYear, ABS, FuelType)
values(1,"Classic 350",346,185000.00,"red","35kmpl",2022,"yes","petrol"),
(2,"Meteor 350",349,200000.00,"black","38kmpl",2023,"yes","petrol"),
(3,"Himalayan",411,230000.00,"white","30kmpl",2021,"yes","petrol"),
(4,"Interceptor 650",648,320000.00,"chrome","28kmpl",2022,"yes","petrol"),
(5,"Bullet 350",346,175000.00,"silver","40kmpl",2020,"no","petrol");
select * from RoyalEnfield;
select ModelName, Price, Mileage_KMPL
from RoyalEnfield;
select * from RoyalEnfield
where Price > 190000;
select * from RoyalEnfield
where LaunchYear >2020;
select * from RoyalEnfield
where ABS='no'