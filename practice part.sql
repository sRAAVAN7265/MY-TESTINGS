------transactions

select * from dbo.prema
update prema set p_dept='police' where p_name='ram'
begin transaction
update prema set p_age=24 where p_id=10
rollback transaction

commit transaction

rollback transaction



begin try
begin transaction
update prema set p_salary=33 where p_id=3
commit transaction
print 'transaction commited'
end try

begin catch
rollback transaction
print'transaction rollback'
end catch


--user defined functions

scalar-----------

create function p_age(@p_age as int)
returns int
as
begin 
return(
@p_age+5
)
end

select dbo.p_age(10)

table valued function----------------

create function p_gender(@p_gender varchar(20))
returns table
as
return(
select * from prema where p_gender='@gender'
)
select * from prema where p_gender='female'


---stored procedure

create procedure prema_p_age
as
select p_age from prema
go
exec prema_p_age

create procedure premap_gender @gender varchar(20)
as
select * from prema
where p_gender='@gender'
go

exec premap_gender @gender='female'


---view

create view female 
as
select * from prema 
where p_gender='female'

select * from female
----exception handling

declare @val1 int;
declare @val2 int;
begin try
set @val1=10;
set @val2=2;
end try

begin catch
print 'error message()'
end catch

begin try
select  p_id+p_age from prema
end try
begin catch
print'it is error'
end catch
go


----CONCAT

select *,concat(p_name,p_age,p_dept) as result from prema 


--date and time function
 select getdate()

 --date add

 select dateadd(year,90,getdate())
 
 select dateadd(month,90,getdate())

 select dateadd(day,90,getdate())

 ---date part
  select datepart(year,getdate())
  
  select datepart(month,getdate())
  
  select datepart(day,getdate())

 ---datediff
 select from one table***
 select datediff(year,1,datediff())


------ date name

select datename(dw,getdate())
select datename(month,getdate())
select datename(year,getdate())

 --end of month

 select eomonth(getdate())

 ----triggers----

 create trigger sravan
 on database
 for create_table
 as
 begin
 print 'create new table'
 end

 create table srav(id int)

 -----------NTILE---
 SELECT * FROM PREMA
SELECT NTILE(2) OVER(ORDER BY P_NAME ) FROM PREMA

 SELECT P_NAME,P_AGE,P_GENDER,P_DEPT, NTILE(2) OVER (ORDER BY P_DEPT) AS NTILE FROM PREMA












