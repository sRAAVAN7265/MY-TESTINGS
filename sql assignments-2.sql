create database dec18 
use dec18

 Studies Table
CREATE TABLE Studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )
-- Insertion
INSERT INTO Studies
SELECT 'ANAND','SABHARI','PGDCA',4500 UNION ALL
SELECT 'ALTAF','COIT','DCA',7200 UNION ALL
SELECT 'JULIANA','BDPS','MCA',22000 UNION ALL
SELECT 'KAMALA','PRAGATHI','DCA',5000 UNION ALL
SELECT 'MARY','SABHARI','PGDCA ',4500 UNION ALL
SELECT 'NELSON','PRAGATHI','DAP',6200 UNION ALL
SELECT 'PATRICK','PRAGATHI','DCAP',5200 UNION ALL
SELECT 'QADIR','APPLE','HDCA',14000 UNION ALL
SELECT 'RAMESH','SABHARI','PGDCA',4500 UNION ALL
SELECT 'REBECCA','BRILLIANT','DCAP',11000 UNION ALL
SELECT 'REMITHA','BDPS','DCS',6000 UNION ALL
SELECT 'REVATHI','SABHARI','DAP',5000 UNION ALL
SELECT 'VIJAYA','BDPS','DCA',48000
-- View
select* from Studies
-- Software Table
CREATE TABLE Software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)

-- Insertion
INSERT INTO Software (PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD) Values
 ('MARY','README','CPP',300, 1200, 84),
 ('ANAND','PARACHUTES','BASIC',399.95, 6000, 43),
 ('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9),
 ('JULIANA','INVENTORY','COBOL',3000, 3500, 0),
 ('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
 ( 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4),
 ('MARY','CODE GENERATOR','C',4500, 20000, 23 ),
 ('PATTRICK','README','CPP',300, 1200, 84),
 ('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11),
 ('QADIR','VACCINES','C',1900, 3100, 21 ),
 ('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 ),
 ('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
 ('REMITHA','PC UTILITIES','C',725, 5000, 51),
 ('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
 ('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
 ('VIJAYA','TSR EDITOR','C',900, 700, 6);

 -- View
 select * from Software

 -- Programmer Table
 CREATE TABLE Programmer (PNAME varchar(20), DOB date, DOJ date, 
 GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)
 -- Insert
INSERT INTO Programmer
SELECT 'ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 UNION ALL
SELECT 'ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 UNION ALL
SELECT 'JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 UNION ALL
SELECT 'KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 UNION ALL
SELECT 'MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 UNION ALL
SELECT 'NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 UNION ALL
SELECT 'PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 UNION ALL
SELECT 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 UNION ALL
SELECT 'RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 UNION ALL
SELECT 'REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 UNION ALL
SELECT 'REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 UNION ALL
SELECT 'REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 UNION ALL
SELECT 'VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500
-- View


-- View
--1. Find out the selling cost AVG for packages developed in Pascal. 
select AVG(scost)as
avarage from software where DEVELOPIN ='PASCAL'

--2. Display Names, Ages of all Programmers. 
select PNAME as nanes,DATEDIFF(YYYY,DOB,GETDATE()) as ages from Programmer

--3 Display the Names of those who have done the DAP Course. 
select pname as names from studies where course='dap'

--4. Display the Names and Date of Births of all Programmers Born in January.
select pname as names, dob, month(dob) as january from programmer where month(dob)=1

--5 what is the Highest Number of copies sold by a Package?
select max(sold) from software

select * from software
select pname,sold from software where sold =
(select max(sold) from software)

--6. Display lowest course Fee. 
select distinct course,course_fee from studies where course_fee in
(select MIN(course_fee) from studies)

--7  How many programmers done the PGDCA Course?
select count(pname) from studies where course='pgdca'

---8 How much revenue has been earned thru sales of Packages Developed in C.
select pname,(scost*sold) as revenue ,developin from software where developin ='c'

--9 display the Details of the Software Developed by Ramesh.
select * from software where pname='ramesh'

--10 How many Programmers Studied at Sabhari? 
select count(pname) as no_of_programmers from Studies where INSTITUTE='sabhari'

--11 Display details of Packages whose sales crossed the 2000 Mark.
select *,scost*sold as sales from software where sold*scost>2000 order by sales

--12 . Display the Details of Packages for which Development Cost have been recovered.
select*,sold*scost as sales from software where sold*scost>dcost

----not recovered-----------------
select*,sold*scost as sales from software where sold*scost<dcost

---using iif condition----------------
select*,iif(scost*sold>dcost,'received','not received') as software_status from software

--13 What is the cost of the costliest software development in Basic? 
select max(dcost) as costliest_software from software where developin='basic'

--14 How many Packages Developed in DBASE
select count(title) as no_of_package from software where developin='dbase'

--15 How many programmers studied in Pragathi? 
select count(pname) as no_of_package from studies where institute='pragathi'

-- 16. How many Programmers Paid 5000 to 10000 for their course? 
select count(pname) from studies where course_fee between 5000 and 10000

--17. What is AVG Course Fee 
 select avg(course_fee) from studies

--18. Display the details of the Programmers Knowing C

select * from programmer where prof1='c' or prof2='c'
--19 How many Programmers know either COBOL or PASCAL.

select count(pname) from programmer
where prof1 in ('cobal','pascal') or prof2 in ('cobal','pascal')


---20--. How many Programmers Don’t know PASCAL and C
select count(pname) from programmer
where prof1 not in ('c','pascal') or prof2 not in ('c','pascal')

---21--How old is the Oldest Male Programmer
select * from programmer
select max(dob) from programmer where gender ='m'
  select min(dob) from programmer where gender ='m'  

---22 What is the AVG age of Female Programmers
select avg(DATEDIFF(yyyy,dob,getdate()))as age from Programmer where gender='f'

----23 Calculate the Experience in Years for each Programmer and Display with their 
 -- names in Descending order 
		select pname as names, datediff(yyyy,doj,getdate())as experience from programmer order by names desc

---24 Who are the Programmers who celebrate their Birthday’s During the Current Month? 
select pname as name,dob,month(dob) from programmer where month(dob)=12

---25 How many Female Programmers are there
select count(pname) as f_programmers from programmer
where gender='f'

---26 What are the Languages studied by Male Programmers. 
select distinct prof1 languages from programmer where gender='m'
union  select distinct prof2 languages from programmer where gender='m'

----27 What is the AVG Salary? 
select avg(salary) from programmer

----28 How many people draw salary 2000 to 4000
select count(pname) from programmer where salary between 2000 and 4000

---29 Display the details of those who don’t know Clipper, COBOL or PASCAL
select *from programmer where prof1 not in ('clipper','cobol', 'pascal') and
prof2 not in ('clipper','cobol', 'pascal')

---30 Display the Cost of Package Developed By each Programmer
select developin,sum(scost) as cost_of_package,sum(dcost) as cost_of_package from software group by developin;

--31 Display the sales values of the Packages Developed by the each Programmer.
select pname, developin,(scost) as sales_values from software order by developin


---32  Display the Number of Packages sold by Each Programmer
select pname,sold from software order by sold

--33 ---33 Display the sales cost of the packages Developed by each Programmer Language wise. 
select * from software
select developin,(scost) from software order by title

--34 . Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
select developin,avg(dcost)as avgdcost,avg(scost) as avgscost,avg(scost*sold)avg_price_percopy from software
group by developin


--35 . Display each programmer’s name, costliest and cheapest Packages Developed by him or her. 
select developin,max(scost*sold) as costliest from software group by developin order by max(scost*sold)

select developin,min(scost*sold) as cheapest from software group by developin order by max(scost*sold)


--36  Display each institute name with number of Courses, Average Cost per Course. 
select * from studies
select institute ,count(course) no_of_courses ,avg(course_fee) as avg_cost from studies group by institute

--37 Display each institute Name with Number of Students. 
select institute,count(pname) as no_of_students from studies group by institute

--38 Display Names of Male and Female Programmers. Gender also.
select pname as names,gender from programmer where gender ='m' or gender='f' 

--39 Display the Name of Programmers and Their Packages
select pname,salary from programmer

--40  Display the Number of Packages in Each Language Except C and C++. 
select salary  from programmer where prof1 not in ('c','c++') and prof2 not in('c', 'c++')

--41 Display the Number of Packages in Each Language for which Development Cost is
 -- less than 1000.
	select * from software
	select count(title) ,dcost from software where dcost<1000 group by  dcost

--42  Display AVG Difference between SCOST, DCOST for Each Package
select title, avg(scost)as scost,avg(dcost) as dcost ,avg(dcost)-avg(scost) as diffbtw_scost_dcost 
from software group by title

--43 Display the total SCOST, DCOST and amount to Be Recovered for each 
--Programmer for Those Whose Cost has not yet been Recovered. 
select *,(scost*sold)-dcost as amount from software where (scost*sold)-dcost<dcost

--44 Display Highest, Lowest and Average Salaries for those earning more than 2000. 
select pname,max (salary),min(salary),avg(salary) from programmer where salary>2000 group by pname

select pname,max (salary),min(salary),avg(salary) from programmer where salary>2000 group by pname order by 
max (salary),min(salary),avg(salary) desc

--45 Who is the HighEst Paid C Programmer
select *from programmer where salary=(select max(salary) from programmer
where prof1 like 'c' or prof2 like 'c')

--46 Who is the Highest Paid Female COBOL Programmer?
select *from programmer where salary=(select max(salary) from programmer
where prof1 like 'cobol' or prof2 like 'cobol') and gender='f'

--47 . Display the names of the highest paid programmers for each Languages
select distinct pname,salary,prof1 from programmer where salary  in (select max(salary) from programmer group by pname,prof1)

select distinct pname,salary,prof2 from programmer where salary in (select max(salary) from programmer group by pname,prof2)


--48 Who is the least experienced Programmer.
select top 1 pname, min(datediff(yyyy,doj,getdate())) as age from programmer group by pname order by age asc

--49 Who is the most experienced male programmer knowing PASCAL
select top 1 pname,max(datediff(yyyy,doj,getdate())) as age from programmer 
where (gender ='m' and prof1='pascal' ) group by pname order by age asc

--50 Which Language is known by only one Programmer
select prof1 from programmer group by prof1 having prof1 not in (select prof2 from programmer) and  count(prof1)=1

--51 Who is the Above Programmer Referred in 50?

--52 Who is the Youngest Programmer knowing DBASE? 
select top 1 pname,min(datediff(yyyy,doj,getdate())) as age from programmer
where ( prof1='DBASE' or prof2='DBASE') group by pname order by age asc

--53 . Which Female Programmer earning more than 3000 does not know C, C++, 
--ORACLE or DBASE?
select * from programmer where gender='f' and salary>3000 and (prof1 not in('c','c++','oracle','dbase')
or  prof2 not in('c','c++','oracle','dbase'))

--54 Which Institute has most number of Students?
select distinct top 1 institute from
  (select distinct top 1 institute from studies order by institute desc)
  result
  order by  institute

--55 What is the Costliest course?
select  course from studies where course_fee=(select max(course_fee) from studies)

--56 Which course has been done by the most of the Students?
select distinct course,pname from Studies where course=(select max(course) from studies)  

--57 Which Institute conducts costliest course.
select institute from studies where course_fee=(select max(course_fee) from studies)

--58 Display the name of the Institute and Course, which has below AVG course fee
select institute,course from studies where course_fee<(select avg(course_fee) from Studies)

--59  Display the names of the courses whose fees are within 1000 (+ or -) of the 
  -- Average Fee, 
   select course,course_fee from Studies where 
   course_fee<(select avg(course_fee)+1000 from studies)
   and 
   course_fee> (select avg(course_fee)-1000 from studies)


--60  Which package has the Highest Development cost?
select * from software
select title,dcost from software where dcost=(select max(dcost)from software)

--61 Which course has below AVG number of Students?
select * from studies
select course from studies group by course having count(pname)<(select avg (count(pname)) from studies group by course)

--62 Which Package has the lowest selling cost?
select title,scost from software where scost=(select min(scost) from software)

--63 Who Developed the Package that has sold the least number of copies? 
select pname,sold from software where sold=(select min(sold) from software)

--64 Which language has used to develop the package, which has the highest 
   --sales amount?
   select  developin from Software where scost=(select max(scost)from software)

--65 How many copies of package that has the least difference between 
    --development and selling cost where sold. 
	select sold,title from software where title = (select title from software where(dcost-scost)
	=(select min(dcost-scost)from software))

--66 Which is the costliest package developed in PASCAL
select *from software
select max(dcost) from software where developin like 'pascal'

--67 Which language was used to develop the most number of Packages. 
select developin from software where sold=(select max(sold) from software) group by developin

--68 Which programmer has developed the highest number of Packages
select pname from software where sold=(select max(sold) from software) group by pname

--69 Who is the Author of the Costliest Package
select pname from software where scost=(select max(scost) from software) 

--70 Display the names of the packages, which have sold less than the AVG number of copies.
select title from software where sold<(select avg(sold) from Software)

--71 Who are the authors of the Packages, which have recovered more than double the 
  Development cost?
  select pname from software where sold*scost>2*dcost
  --or
  select pname from software where 2*dcost<sold*scost

  --72 . Display the programmer Name and the cheapest packages developed by them in each language.
   
	select pname,title,developin from software where scost in(select min(scost) from software group by developin )

	select pname,developin from software where dcost in (select min(dcost) from software group by developin )
	

--73 . Display the language used by each programmer to develop the Highest 
      Selling and Lowest-selling package.

	select pname,developin from software where sold in(select max(sold)from software group by pname) union
	select pname,developin from software where sold in(select min(sold)from software group by pname) 

--74 Who is the youngest male Programmer born in 1965? 
select top 1 pname,dob,datediff(day,dob,getdate()) from programmer where year( dob)='1965' order by dob



--75 Who is the oldest Female Programmer who joined in 1992?
select top 2 pname,doj,datediff(day,doj,getdate()) from programmer where year( doj)='1992' and gender='f' order by doj 

select top 1 pname,doj,datediff(day,doj,getdate()) from programmer where year( doj)='1992' and gender='f' order by doj 


--76 In which year was the most number of Programmers born.
select year(dob) "Year",count(year(dob)) "No. of Programmers Born"
from programmer group by year(dob)
having count(year(dob)) >= ALL (select count(year(dob))
from programmer
group by year(dob))

--77 In which month did most number of programmers join? 
select MONTH(doJ) "MONTH",count(MONTH(doJ)) "No. of Programmers JOIN"
from programmer
group by MONTH(doJ)
having count(MONTH(doJ)) >= ALL (select count(MONTH(doJ))
from programmer
group by MONTH(doJ))

--78 In which language are most of the programmer’s proficient. 
select a.pname,a.prof2 from programmer a,programmer b where a.prof2=b.prof2 and a.pname<>b.pname


--79 Who are the male programmers earning below the AVG salary of
    -- Female Programmers?
SELECT PNAME FROM PROGRAMMER WHERE gender = 'M' AND SALARY < (SELECT(AVG(SALARY))FROM PROGRAMMER WHERE GENDER = 'F');


--80  Who are the Female Programmers earning more than the Highest Paid?
select pname from programmer where gender='f' and salary>(select max(salary) from programmer where gender ='m' )

--81 Which language has been stated as the proficiency by most of the Programmers?
select prof1 from programmer group by prof1 having prof1=(select max(prof1) from programmer)

--82 . Display the details of those who are drawing the same salary. 
select pname,salary from programmer where salary in (select salary from programmer group by salary having count (*)>1 )order by salary

--83 Display the details of the Software Developed by the Male Programmers Earning 
--More than 3000/-
select * from programmer where salary>3000 and gender ='m' 

--84 Display the details of the packages developed in Pascal by the Female 
  --Programmers
	select * from programmer where prof1='pascal' and gender ='f'
	
--85 Display the details of the Programmers who joined before 1990.
select * from Studies programmer where year(doj) <1990

--86 Display the details of the Software Developed in C By female programmers of Pragathi.
select programmer.pname,prof1 from programmer inner join studies on 
programmer.pname=studies.pname where gender='f' and( prof1 like'c')  and institute ='pragathi' 

--87 Display the number of packages, No. of Copies Sold and sales value of
--each programmer institute wise.
Select studies.INSTITUTE, count(software.developin), count(software.sold), sum(software.sold*software.scost) 
from software,studies where software.pname=studies.pname group by studies.INSTITUTE; 


--88 Display the details of the software developed in DBASE by Male Programmers, who 
     --belong to the institute in which most number of Programmers studied. 
 select software.* from programmer,software,studies where programmer.pname=software.pname and 
	 software.pname=studies.pname and programmer.pname=studies.pname and GENDER='m'
	 and developin='dbase'


--89 Display the details of the software Developed by the male programmers Born 
 --before 1965 and female programmers born after 1975. 
 select * from programmer where year(dob)<1965 and gender='m'
select * from programmer where year(dob)>1975 and gender='f'

--90 . Display the details of the software that has developed in the language which is
--neither the first nor the second proficiency of the programmers. 
select s.*from programmer p,Software s where s.pname = p.pname and (developin<>prof1 
and developin<>prof2)

--91 Display the details of the software developed by the male students of Sabhari. 
select *from studies
inner join programmer
on studies.pname=programmer.pname
where gender='m'and institute='sabhari'


--92 92. Display the names of the programmers who have not developed any packages. 
select pname from programmer where pname not in (select pname from software)


--93. What is the total cost of the Software developed by the programmers of Apple? 
select sum(scost*sold) as total_cost from software ,studies  where software.pname=studies.pname group by institute
having institute='apple'

--94. Who are the programmers who joined on the same day? 
select a.pname,a.doj from programmer a,programmer b
where a.doj=b.doj and a.pname<>b.pname

--95. Who are the programmers who have the same Prof2? 
select a.pname,a.prof2 from programmer a,programmer b where a.prof2=b.prof2 and a.pname<>b.pname

--96. Display the total sales value of the software, institute wise. 
select Studies.institute,sum(software.sold*software.scost) as totalsalesvalue from software,studies 
where studies.pname=software.pname group by studies.institute
--or
select institute,sum(sold*scost) as total from software,studies where studies.pname=software.pname group by institute

--97. In which institute does the person who developed the costliest package studied. 
select institute from studies,software where software.pname=studies.pname group by institute,dcost 
having max(dcost)=(select max(dcost) from software)


--98. Which language listed in prof1, prof2 has not been used to develop any package.

select prof1 from programmer where prof1 not in (select developin from software) union
select prof2 from programmer where prof2 not in (select developin from software)

--99. How much does the person who developed the highest selling package earn and
--what course did HE/SHE undergo

select software.pname,scost,course from software,studies where software.pname=studies.pname and 
scost=(select max(scost) from software) 

--100. What is the AVG salary for those whose software sales is more than 50,000/-. 
select avg(salary) as avgsalary from programmer,software where (scost*sold)>50000

--101. How many packages were developed by students, who studied in institute that 
--charge the lowest course fee? 
select studies.pname, count(title) from software,studies where software.pname=studies.pname group by studies.pname,course_fee 
having min(course_fee)=(select min(course_fee) from studies)

--102. How many packages were developed by the person who developed the 
--cheapest package, where did HE/SHE study? 
select count(*) from programmer,software where programmer.pname=software.pname group by developin 
having min(dcost)=(select min(dcost) from software)

--103. How many packages were developed by the female programmers earning more 
--than the highest paid male programmer? 
select count(developin) from programmer,software where programmer.pname=software.pname and gender='f' and
salary>(select max(salary)from programmer,software where programmer.pname=software.pname and gender='m')

--104. How many packages are developed by the most experienced programmer form BDPS. 
 select count(*) from software s,programmer p
where p.pname=s.pname group by doj having max(doj)=(select max(doj)
from studies st,programmer p, software s
where p.pname=s.pname and st.pname=p.pname and (institute='bdps'));

--105. List the programmers (form the software table) and the institutes they studied.
select software.pname,institute from software,studies where software.pname=studies.pname group by software.pname,institute

--106. List each PROF with the number of Programmers having that PROF and the 
--number of the packages in that PROF. 
select count(*),sum(scost*sold-dcost) from software where developin in (select prof1 from programmer) group by developin

--107. List the programmer names (from the programmer table) and No. Of Packages 
--each has developed.
select programmer.pname,count(developin) as no_of_packages from programmer,software
where programmer.pname=software.pname group by programmer.pname






