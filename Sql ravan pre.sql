create table ravan(s_id int,s_name varchar(20),s_age int,s_salary int,s_gender varchar(20))

create table prem(p_id int,p_name varchar(20),p_age int,p_salary int,p_gender varchar(20))


insert into ravan values (1,'a',25,50000,'male')
insert into ravan values (2,'b',25,50000,'female')
insert into ravan values (3,'c',25,50000,'female')
insert into ravan values (4,'d',25,50000,'male')
insert into prem values (1,'w',25,50000,'male')
insert into prem values (1,'x',25,50000,'male')
insert into prem values (1,'y',25,50000,'female')
insert into prem values (1,'z',25,50000,'male')


select * from ravan
select * from prem
update prem set p_id=22 where p_name='x'
update prem set p_id=33 where p_name='y'
update prem set p_id=44 where p_name='z'
----****************************************************







