create database dec24

use dec24


CREATE TABLE EMP
       (EMPNO NUMERIC(4) NOT NULL,
        ENAME VARCHAR(10),
        JOB VARCHAR(9),
        MGR NUMERIC(4),
        HIREDATE DATE,
        SAL NUMERIC(7, 2),
        COMM NUMERIC(7, 2),
        DEPTNO NUMERIC(2));

INSERT INTO EMP VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        '17-DEC-1980',  800, NULL, 20);
INSERT INTO EMP VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        '20-FEB-1981', 1600,  300, 30);
INSERT INTO EMP VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        '22-FEB-1981', 1250,  500, 30);
INSERT INTO EMP VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        '2-APR-1981',  2975, NULL, 20);
INSERT INTO EMP VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        '28-SEP-1981', 1250, 1400, 30);
INSERT INTO EMP VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        '1-MAY-1981',  2850, NULL, 30);
INSERT INTO EMP VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        '9-JUN-1981',  2450, NULL, 10);
INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        '09-DEC-1982', 3000, NULL, 20);
INSERT INTO EMP VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        '17-NOV-1981', 5000, NULL, 10);
INSERT INTO EMP VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        '8-SEP-1981',  1500,    0, 30);
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        '12-JAN-1983', 1100, NULL, 20);
INSERT INTO EMP VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        '3-DEC-1981',   950, NULL, 30);
INSERT INTO EMP VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        '3-DEC-1981',  3000, NULL, 20);
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        '23-JAN-1982', 1300, NULL, 10);


		CREATE TABLE DEPT
       (DEPTNO NUMERIC(2),
        DNAME VARCHAR(14),
        LOC VARCHAR(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');
--group by

--rollup

--cube

select deptno,job,sum(sal) as 'total sal'from emp group by cube(job,deptno) order by job

--rank

select*,rank()over(order by sal) as 'rank 01' from emp

select*,rank()over(partition by deptno order by sal) as'rank 01' from emp

--dense rank
select*, dense_rank()over(order by sal) as 'rank 01' from emp

select*,dense_rank()over(partition by deptno order by sal) as'rank 01' from emp

--row number
select*,row_number()over(order by deptno) as 'row_no_01' from emp


select*,row_number()over(partition by deptno order by empno) as 'row_no_01' from emp

---ntile
select*,ntile(2) over (order by sal) from emp

select*,ntile(5) over (partition by job order by sal) from emp

--view

create view view_1 as select * from emp

select *from view_1

drop view view_1 --for delete view

-- sub queries
select deptno from emp where ename like 'scott'

select *from emp where deptno='20'

select * from emp where deptno=(select deptno from emp where ename like 'scott')

--CTE


--transactions

begin transaction


--grouping sets








