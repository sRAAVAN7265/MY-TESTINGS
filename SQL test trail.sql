CREATE DATABASE QUIZ

use QUIZ

CREATE TABLE PLACE ( PLACE_ID INT PRIMARY KEY, City VARCHAR(20) )

INSERT INTO PLACE values
(122,	'New York' ),
(123,	'Dallas' ),
(124,	'Chicago' ),
(167,	'Boston' );


SELECT * FROM PLACE

---------------------------------------

CREATE TABLE Department ( Department_ID INT PRIMARY KEY, DeptName VARCHAR(20), 
DepPlace_ID INT FOREIGN KEY REFERENCES PLACE(PLACE_ID))

INSERT INTO Department values
( 10,'Accounting',122 ),
( 20,'Sales',124  ),
( 30,'Research',123 ),
( 40,'Operations',167);
 
SELECT * FROM Department

---------------------------------------

CREATE TABLE DESIGNATION ( Job_ID INT PRIMARY KEY, Designation VARCHAR(20) )

INSERT INTO DESIGNATION values
( 667,'Clerk' ),
(668,'Staff' ),
(669,'Analyst'),
(670,'Sales Person'),
(671,'Manager' ),
(672,'President');

SELECT * FROM DESIGNATION

---------------------------------------

CREATE TABLE Employee ( Employee_ID INT, Last_Name VARCHAR(20),	First_Name VARCHAR(20),	Middle_Name	VARCHAR(20),
EmpJob_ID INT FOREIGN KEY REFERENCES DESIGNATION(Job_ID), Hire_Date DATE, Salary INT, Comm INT,	
EmpDepartment_ID INT FOREIGN KEY REFERENCES Department(Department_ID) )

INSERT INTO Employee values
(7369, 'SMITH','JOHN','Q',667,'17-Dec-84', 7902,800, 20 ),
(7499, 'ALLEN','KEVIN','J',670, '20-Feb-85',7698,1600, 30 ),
( 7505, 'DOYLE','JEAN','K',671, '4-Apr-85',7839,2850, 30),
(7506, 'DENNIS','LYNN','S',671,'15-May-85', 7839,2750,  30 ),
(7507, 'BAKER','LESLIE','D',671,'10-Jun-85', 7839,2200,  40 ),
(7521, 'WARK','CYNTHIA','D',670,'22-Feb-85', 7698,1250,  30);

SELECT * FROM Employee

SELECT * FROM DESIGNATION

SELECT * FROM Department

SELECT * FROM PLACE

--2) WRITE A QUERY TO DISPLAY details of employee along with ROLES  OF THE EMPLOYEES

select employee.empjob_id,designation.designation from employee inner join designation on employee.empjob_id=designation.job_id

--5) WRITE A QUERY TO DISPLAY EMPLOYEE DETAILS WITH THEIR DEPARTMENT NAMES.
select employee.*,Department.DeptName from Employee inner join Department on employee.EmpDepartment_ID=Department.Department_id


--6) WRITE A QUERY TO DISPLAY THE EMPLOYEES WITH THEIR DEPARTMENT NAMES AND CITY WHICH THEY BELONGS TO.
select employee inner join Department on employee.EmpDepartment_ID=Department.Department_id  join place on
Department.Department_id = place.PLACE_ID


SELECT * FROM Employee INNER JOIN Department ON Employee .EmpDepartment_ID=Department.Department_ID RIGHT JOIN PLACE ON Department.DepPlace_ID=PLACE.PLACE_ID
SELECT * FROM Employee AS E LEFT JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID INNER JOIN PLACE AS P ON D.DepPlace_ID=P.PLACE_ID
SELECT * FROM Employee INNER JOIN Department ON EMPLOYEE.EmpDepartment_ID=DEPARTMENT.Department_ID INNER JOIN PLACE ON DEPARTMENT.DepPlace_ID=PLACE.PLACE_ID
SELECT EMPLOYEE.*,DEPARTMENT.DeptName,PLACE.City FROM Employee INNER JOIN Department ON Employee.EmpDepartment_ID=Department.Department_ID INNER JOIN PLACE ON Department.DepPlace_ID=PLACE.PLACE_ID

--7) WRITE A QUERY TO DISPLAY ,HOW MANY EMPLOYEES WHO ARE WORKING IN DIFFERENT DEPARTMENTS AND DISPLAY WITH THERE WORDKING DEPARTMENT NAMES.


SELECT E.*,DeptName FROM (SELECT EmpDepartment_ID,COUNT(1) AS EMPCNT FROM Employee GROUP BY EmpDepartment_ID )AS E FULL JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID
SELECT E.*,DeptName FROM (SELECT EmpDepartment_ID,COUNT(1) AS EMPCNT FROM Employee GROUP BY EmpDepartment_ID )AS E INNER JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID
SELECT E.*,DeptName FROM (SELECT EmpDepartment_ID,COUNT(1) AS EMPCNT FROM Employee GROUP BY EmpDepartment_ID )AS E INNER JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID
SELECT E.*,DeptName FROM (SELECT EmpDepartment_ID,COUNT(1) AS EMPCNT FROM Employee GROUP BY EmpDepartment_ID )AS E INNER JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID


--8) WRITE A QUERY TO DISPLAY COUNT OF THE EMPLOYEES WHO ARE WORKING IN RESERACH DEPARTMENT.


SELECT E.*,DeptName FROM (SELECT EmpDepartment_ID,COUNT(1) AS EMPCNT FROM Employee GROUP BY EmpDepartment_ID )AS E LEFT JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID WHERE DeptName='RESEARCH'
SELECT E.*,DeptName FROM (SELECT EmpDepartment_ID,COUNT(1) AS EMPCNT FROM Employee GROUP BY EmpDepartment_ID )AS E RIGHT JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID WHERE DeptName='RESEARCH'
SELECT E.*,DeptName FROM (SELECT EmpDepartment_ID,COUNT(1) AS EMPCNT FROM Employee GROUP BY EmpDepartment_ID )AS E INNER JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID WHERE DeptName='RESEARCH'
SELECT E.*,DeptName FROM (SELECT EmpDepartment_ID,COUNT(1) AS EMPCNT FROM Employee GROUP BY EmpDepartment_ID )AS E FULL JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID WHERE DeptName='RESEARCH'


--11) WRITE A QUERY TO DISPLAY THE DEPARTMENT HAVING GREATER THAN OR EQUAL TO 3 EMPLOYEES AND DISPLAY THE DEPARTMENT NAMES

SELECT E.*,DeptName FROM (SELECT EmpDepartment_ID,COUNT(1) AS EMPCNT FROM Employee GROUP BY EmpDepartment_ID )AS E FULL JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID WHERE E.EMPCNT>=3
SELECT E.*,DeptName FROM (SELECT EmpDepartment_ID,COUNT(1) AS EMPCNT FROM Employee GROUP BY EmpDepartment_ID )AS E LEFT JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID WHERE E.EMPCNT>=3
SELECT E.*,DeptName FROM (SELECT EmpDepartment_ID,COUNT(1) AS EMPCNT FROM Employee GROUP BY EmpDepartment_ID )AS E INNER JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID WHERE E.EMPCNT>=3
SELECT E.*,DeptName FROM (SELECT EmpDepartment_ID,COUNT(1) AS EMPCNT FROM Employee GROUP BY EmpDepartment_ID )AS E RIGHT JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID WHERE E.EMPCNT>=3

--12) DISPLAY THE EMPLOYEE DETAILS WITH SALARY GRADES.
SELECT *, SalGrade= CASE WHEN E.Salary<2000 THEN 'C' WHEN E.Salary BETWEEN 2000 AND 5000 THEN 'B' ELSEIF 'A' END FROM Employee AS E
SELECT *, SalGrade= CASE WHEN E.Salary<2000 THEN 'C' WHEN E.Salary BETWEEN 2000 AND 5000 THEN 'B' ELSE 'A' END FROM Employee AS E
SELECT *, SalGrade= CASE WHEN E.Salary=2000 THEN 'C' WHEN E.Salary BETWEEN 2000 AND 5000 THEN 'B' ELSEIF 'A' END FROM Employee AS E
SELECT *, SalGrade= CASE WHEN E.Salary<2000 THEN 'C' WHEN E.Salary BETWEEN 2000 AND 5000 THEN 'B' THEN 'A' END FROM Employee AS E

--14) WRITE A QUERY TO DISPLAY COUNT OF EMPLOYEES ARE WORKING IN "BOSTON"
SELECT E.*,City FROM (SELECT EmpDepartment_ID,COUNT(1) AS EMPCNT FROM Employee GROUP BY EmpDepartment_ID )AS E INNER JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID LEFT JOIN PLACE AS p ON P.PLACE_ID=D.DepPlace_ID WHERE P.City='BOSTON'
SELECT E.*,City FROM (SELECT EmpDepartment_ID,COUNT(1) AS EMPCNT FROM Employee GROUP BY EmpDepartment_ID )AS E LEFT JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID LEFT JOIN PLACE AS p ON P.PLACE_ID=D.DepPlace_ID WHERE P.City='BOSTON'
SELECT E.*,City FROM (SELECT EmpDepartment_ID,COUNT(1) AS EMPCNT FROM Employee GROUP BY EmpDepartment_ID )AS E LEFT JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID LEFT JOIN PLACE AS p ON P.PLACE_ID=D.DepPlace_ID WHERE P.City='BOSTON'
SELECT E.*,City FROM (SELECT EmpDepartment_ID,COUNT(1) AS EMPCNT FROM Employee GROUP BY EmpDepartment_ID )AS E RIGHT JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID LEFT JOIN PLACE AS p ON P.PLACE_ID=D.DepPlace_ID WHERE P.City='BOSTON'













15) WRITE A QUERY TO DISPLAY THE LIST OF THE DISTINCT JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
SELECT DISTINCT EmpJob_ID FROM Employee AS E RIGHT JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID WHERE DeptName IN ('Sales','Accounting')
SELECT DISTINCT EmpJob_ID FROM Employee AS E FULL JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID WHERE DeptName IN ('Sales','Accounting')
SELECT DISTINCT EmpJob_ID FROM Employee AS E LEFT JOIN Department AS D ON E.EmpDepartment_ID=D.Department_ID WHERE DeptName IN ('Sales','Accounting')

--16) WRITE A QUERY TO DISPLAY LIST OF ALL THE JOBS IN SALES AND ACCOUNTING DEPARTMENTS
SELECT EmpJob_ID FROM Employee RIGHT JOIN Department ON EMPLOYEE.EmpDepartment_ID=DEPARTMENT.Department_ID WHERE DeptName IN ('Sales','Accounting')
SELECT EmpJob_ID FROM Employee FULL JOIN Department ON EMPLOYEE.EmpDepartment_ID=DEPARTMENT.Department_ID WHERE DeptName IN ('Sales','Accounting')
SELECT DISTINCT EmpJob_ID FROM Employee INNER JOIN Department ON EMPLOYEE.EmpDepartment_ID=DEPARTMENT.Department_ID WHERE DeptName IN ('Sales','Accounting')
SELECT EmpJob_ID FROM Employee LEFT JOIN Department ON EMPLOYEE.EmpDepartment_ID=DEPARTMENT.Department_ID WHERE DeptName IN ('Sales','Accounting')











