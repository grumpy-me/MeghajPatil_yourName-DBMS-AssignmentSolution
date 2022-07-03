create table PASSENGER

(Passenger_name varchar(20),

Category varchar(20),

Gender varchar(20),

Boarding_City varchar(20),

Destination_City varchar(20),

Distance int,

Bus_Type varchar(20)

);

create table PRICE

(

Bus_Type varchar(20),

Distance int,

Price int

);

insert into passenger values('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');

insert into passenger values('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');

insert into passenger values('Pallavi','AC','F','panaji','Bengaluru',600,'Sleeper');

insert into passenger values('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');

insert into passenger values('Udit','Non-AC','M','Trivandrum','panaji',1000,'Sleeper');

insert into passenger values('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');

insert into passenger values('Hemant','Non-AC','M','panaji','Mumbai',700,'Sleeper');

insert into passenger values('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');

insert into passenger values('Piyush','AC','M','Pune','Nagpur',700,'Sitting');

select * from passenger;

insert into price values('Sleeper',350,770);

insert into price values('Sleeper',500,1100);

insert into price values('Sleeper',600,1320);

insert into price values('Sleeper',700,1540);

insert into price values('Sleeper',1000,2200);

insert into price values('Sleeper',1200,2640);

insert into price values('Sleeper',1500,2700);

insert into price values('Sitting',500,620);

insert into price values('Sitting',600,744);

insert into price values('Sitting',700,868);

insert into price values('Sitting',1000,1240);

insert into price values('Sitting',1200,1488);

insert into price values('Sitting',1500,1860);

select * from price;

____________________________________________________________

3)

select Gender, count(Gender) FROM Passenger where Distance>=600 group by Gender ;

Gender count(Gender)

M 4

F 2

______________________________________________________________

4)

select min(Price) from Price where Bus_Type = 'Sleeper';

min(Price)

'770'

_________________________________________________________________

5)

select Passenger_Name FROM Passenger where Passenger_Name like 'S%' order by Passenger_Name;

Passenger_Name

Sejal

_________________________________________________________________

6)

select a.Passenger_name,a.Boarding_City,a.Destination_City,a.Bus_type,b.Price from Passenger a , Price b where (a.Bus_Type = b.Bus_Type and a.Distance = b.Distance);

# Passenger_name Boarding_City Destination_City Bus_type Price

Sejal Bengaluru Chennai Sleeper 770

Pallavi panaji Bengaluru Sleeper 1320

Hemant panaji Mumbai Sleeper 1540

Udit Trivandrum panaji Sleeper 2200

Khusboo Chennai Mumbai Sleeper 2700

Ankur Nagpur Hyderabad Sitting 620

Manish Hyderabad Bengaluru Sitting 620

Anmol Mumbai Hyderabad Sitting 868

Piyush Pune Nagpur Sitting 868

________________________________________________________________________

7) select a.Passenger_name,b.Price from Passenger a ,Price b where (a.Bus_Type = "Sitting" and b.Bus_Type = "Sitting" and a.Distance = 700 and b.Distance=700);

Passenger_name Price

Anmol 868

Piyush 868

_________________________________________________________________________

8)

SELECT Price FROM Price where distance=(SELECT Distance FROM Passenger where passenger_name = "Pallavi");

Price

1320

744

________________________________________________________________

9)

SELECT distinct(Distance) FROM Passenger order by distance desc;

Distance

1500

1000

700

600

500

350

_________________________________________________________________

10)

with total as ( select sum(distance) as total from Passenger)

select passenger_Name,(distance / total.total)*100 as percentage_travel from Passenger,total ;

passenger_Name percentage_travel

Sejal 5.3435

Anmol 10.6870

Pallavi 9.1603

Khusboo 22.9008

Udit 15.2672

Ankur 7.6336

Hemant 10.6870

Manish 7.6336

Piyush 10.6870

_________________________________________________________________

11

SELECT Distance, Price,

CASE

WHEN

Price > 1000 THEN "Expensive"

WHEN Price <1000 and Price > 500 THEN "Average Cost"

ELSE "cheap" END as Cost FROM price;

Distance Price Cost

350 770 Average Cost

500 1100 Expensive

600 1320 Expensive

700 1540 Expensive

1000 2200 Expensive

1200

1500 2640 2700 Expensive Expensive

500 620 Average Cost

600 744 Average Cost

700 868 Average Cost

1000 1240 Expensive

1200 1488 Expensive

1500 1860 Expensive