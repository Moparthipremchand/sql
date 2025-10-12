use 61r;
create table dairymilk (
ProductID int primary key,
ProductName varchar(60) not null,
Weight_grams varchar(5) not null,
Price decimal(10,2) not null,
Flavour varchar(30) not null,
MfgDate date,
ExpDate date
);
show tables;
select * 
from dairymilk;
insert into dairymilk (ProductID, ProductName, Weight_grams, Price, Flavour, MfgDate, ExpDate)
values (1,"Cadbury Silk Small Chocolates Combo","150g",230.00,"chocklet bar",'2025-07-27','2026-07-27'),
(2,"Cadbury Dairy Milk Silk Fruit Nut Chocolate","230g",230.00,"Fruit Nut",'2025-02-27','2026-07-30'),
(3,"Cadbury Dairy Milk Silk Bubbly Chocolate","130g",230.00,"Silk Bubbly",'2024-01-15','2026-01-15'),
(4,"Cadbury Dairy Milk Mocha Almond Chocolate Ba",'150g',230.00,"Mocha Almond",'2025-07-27','2026-07-27'),
(5,"Cadbury Chocolate Bar Plum Cake Flavor","70g",99.00,"Plum Cake Flavor",'2025-08-26','2026-08-27');

drop tables dairymilk;
create table dairymilk(
ProductID int primary key,
ProductName varchar(60) not null,
Weight_grams varchar(5) not null,
Price decimal(10,2) not null,
Flavour varchar(30) not null,
MfgDate date,
ExpDate date
);
insert into dairymilk(ProductID, ProductName, Weight_grams, Price, Flavour, MfgDate, ExpDate)
values(1,"Cadbury Silk Small Chocolates Combo","150g",230.00,"chocklet bar",'2025-07-27','2026-07-27'),
(2,"Cadbury Dairy Milk Silk Fruit Nut Chocolate","230g",230.00,"Fruit Nut",'2025-02-27','2026-07-30'),
(3,"Cadbury Dairy Milk Silk Bubbly Chocolate","130g",230.00,"Silk Bubbly",'2024-01-15','2026-01-15'),
(4,"Cadbury Dairy Milk Mocha Almond Chocolate Ba",'150g',230.00,"Mocha Almond",'2025-07-27','2026-07-27'),
(5,"Cadbury Chocolate Bar Plum Cake Flavor","70g",99.00,"Plum Cake Flavor",'2025-08-26','2026-08-27');
select ProductName, Price, Flavour
from dairymilk;
select * from dairymilk
where Price > 100;
select * from dairymilk
where Flavour='Fruit Nut'

