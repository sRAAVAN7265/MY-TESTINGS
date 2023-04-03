
create database dec17
use dec17
----***********************************************************
---module =2------------

--1. Create a customer table which comprises of these columns – ‘customer_id’, ‘first_name’, 
--‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’
--2. Insert 5 new records into the table


create table customer(
c_id int,f_name varchar (20),l_name varchar(20),email varchar(40),
address varchar(50),city varchar(30),state varchar(30),zip int)

insert into customer values(
1,'srav','kumar','aaa12@gmail.com','kphb,
hydrebad','hydrabad','telangana',500001)

insert into customer (c_id ,f_name,l_name,email,
address,city,state,zip) values(
2,'prem','c','bbbbb@gmail.com','amerpet','hyd','telangana',9866),
(3,'bala','b','sp@gmail.com','tika','tirupati','ap',1234),
(4,'siva','t','ss@gmail.com','piler','piler','ap',3456),
(5,'baby','s','bb@gmail.com','baglr','mpl','ap',6677);

select * from customer
--3. Select only the ‘first_name’ & ‘last_name’ columns from the customer table
select distinct f_name,l_name from customer


--4. Select those records where ‘first_name’ starts with “G” and city is ‘San Jose’
select * from customer where  f_name like'g%' and city='san jose'

=----============================================================================================================================

----module =3

--1. Create an ‘Orders’ table which comprises of these columns – ‘order_id’, ‘order_date’, ‘amount’, 
--‘customer_id’



create table orders(
o_id int,o_date date,amount money,c_id int)
select *from orders


insert into orders  (o_id,o_date,amount,c_id)
values(101,'01-01-2000',10000,1),
      (102,'02-02-2001',20000,3),
      (103,'03-03-2003',30000,4),
      (104,'04-04-2004',40000,6),
      (105,'05-05-2005',50000,7);

------*******inner join***************
--2. Make an inner join on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column 

		select * from customer
		inner join
		orders on
		customer.c_id=orders.c_id

		-----****left and right********
--3. Make left and right joins on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column

select * from customer
		left join
		orders on
		customer.c_id=orders.c_id
---+-***********
		select * from customer
		right join
		orders on
		customer.c_id=orders.c_id

	--********	update***********

--4. Update the ‘Orders’ table, set the amount to be 100 where ‘customer_id’ is 3

	update orders set amount=100 where c_id=3 ---for row
	alter is --- for column

	========================================================================================================================================


--****module 4******************
--1. Use the inbuilt functions and find the minimum, maximum and average amount from the orders 
--table



select *from orders
select min(amount) from orders
select max(amount) from orders
select avg(amount) from orders
--or

select min(amount)as minimum_amount,max(amount) as maximum_amount, avg(amount) as avarage_amount
from orders

---====***user defined******
--2. Create a user-defined function, which will multiply the given number with 10

create function multiply (@val int)
returns int
as
begin
return @val * 10
end
select dbo.multiply(101) as multiplication_by_10
select dbo.multiply(amount) from orders

create function addition (@val int)
returns int
as
begin
return @val + 10
end
select dbo.addition(100) as add_by_10
-----***case statement*************

--3. Use the case statement to check if 100 is less than 200, greater than 200 or equal to 200 and 
--print the corresponding values

select case
when 100<200 then '100 is less than 200'
when 100>200 then '100 is greater than 200'
when 100=200 then '100 is equal to 200'
end as result

---****iif statement************

select iif (100<200,'100 is less than 200','true condition') as result


create function algebra (@a int,@b int)
returns int
as
begin
return (@a+@b)(@a-@b) 
end
select * from orders

--***table valued functions with parameter*************
create function prem(@amount int)
returns table
as 
return
select * from orders where amount=@amount
select *from dbo.prem(100)

create function prema()
returns table
as 
return
select * from orders where c_id<=3

select* from dbo.prema()


--******** module - 5 **************
--2. Create a table with name ‘Employee_details1’ and comprising of these columns – ‘Emp_id’, 
--‘Emp_name’, ‘Emp_salary’. Create another table with name ‘Employee_details2’, which 
--comprises of same columns as first table.


create table Employee_details1(emp_id int,emp_name varchar(20),emp_salary int)
insert into Employee_details1(emp_id,emp_name,emp_salary)
values(1,'kumar',50000),
(2,'ram',70000),
(3,'jessi',20000),
(4,'raj',90000),
(5,'sow',100000);

select * from Employee_details1

create table Employee_details2(emp_id int,emp_name varchar(20),emp_salary int)
insert into Employee_details2(emp_id,emp_name,emp_salary)
values(1,'raji',10000),
(2,'niki',22222),
(3,'sera',3333),
(4,'rock',4444),
(5,'jan',5555);

--1. Arrange the ‘Orders’ dataset in decreasing order of amount
select * from Employee_details1 order by emp_salary  desc
--3. Apply the union operator on these two tables
select * from Employee_details1
union
select * from Employee_details2

--4. Apply the intersect operator on these two tables
select * from Employee_details1
intersect
select * from Employee_details2
--5. Apply the except operator on these two tables
select * from Employee_details1
except
select * from Employee_details2
