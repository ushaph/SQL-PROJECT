create database script2;
use script2;
create table Dept(
deptno tinyint not null ,
dname varchar(15) ,
loc varchar (14) ,
constraint pk_deptno primary key (deptno)
);
insert into Dept (deptno,dname,loc)
values (10,'accounting' , 'new york'),
(20, 'research', 'dallas'),
(30,'sales','chicago'),
(40,'operators','boston');

create table Emp(
emp_no smallint not null ,
ename varchar(20) ,
job varchar(10) ,
mgr smallint ,
hiredate date ,
sal decimal(7,2),
commision decimal(7,2) ,
deptno tinyint ,
constraint pk_emp primary key(emp_no) ,
constraint fk_deptno foreign key(deptno) references dept (deptno)
);
insert into Emp(emp_no,ename,job,mgr,hiredate,sal,commision,deptno)
values
(7839,'king','president',null,'1981-11-17',5000,null ,10);
select*from emp;
insert into Emp(emp_no,ename,job,mgr,hiredate,sal,commision,deptno)
values
(7698,'blake','manager',7839,'1981-05-01',2850,null,30),
(7782,'clerk','manager',7839,'1981-06-09',2450,null,10),
(7566,'jones','manager',7839,'1981-04-02',2975,null,20),
(7788,'scott','analyst',7566,'1987-07-13',3000,null,20),
(7902,'ford','analyst',7566,'1981-12-03',3000,null,20),
(7369,'smith','clerk',7902,'1980-12-17',800,null,20),
(7499,'allen','salesman',7698,'1981-02-20',1600,300,30),
(7521,'ward','salesman',7698,'1981-02-22',1250,500,30),
(7654,'martin','salesman',7698,'1981-09-28',1250,1400,30),
(7844,'turner','salesman',7698,'1981-09-08',1500,0,30),
(7876,'adams','clerk',7788,'1987-07-13',1100,null,20),
(7900,'james','clerk',7698,'1981-12-03',950,null,30),
(7934,'miller','clerk',7782,'1982-01-23',1300,null,10);

select sal 
from emp
where ename="smith";
-- 2. waqtd name of the employess working as clerk--
select ename,job
from emp
where job="clerk";
-- 3.waqtd salary of the employees who are working as salesman
select sal,ename 
from emp
where job="salesman";
-- 4.waqtd details of the emp who earns more than 2000
select * 
from emp
where sal>2000;
-- 5.waqtd details of the emp whos name is jones
select *
from emp
where ename="jones";
-- 6.waqtd details of the employees who has hired after 01-jan-81
select *
from emp
where hiredate>"1981-01-01"
order by  hiredate asc;
-- 7.waqtd name and sal along with his annual salary if the annual salary is more than 12000
select ename as "employee_name",sal as "salary",sal*12
from emp
where sal*12>12000;
-- 8.waqtd name of the employees whos commision more than 1000
select ename,commision 
from emp
where commision>1000;
-- 9.waqtd ename and hiredate if they are hired before 1981
select ename,hiredate
from emp
where hiredate<="1981-01-01";
-- 10.waqtd details of the employees working as manager
select *
from emp
where job="manager";
-- 11. waqtd name and salary given to an employee if employee earns a commision of rupees 1400
select ename,sal,commision
from emp
where commision=1400;
-- 12.waqtd details of employee having commision more than salary
select *
from emp
where commision>sal;
-- 13.waqtd emo_no of employees hired before the year 87
select emp_no,ename,hiredate
from emp
where hiredate <="1987-01-01";
-- 14.waqtd details of employees working as an analyst
select *
from emp
where job="analyst";
-- 15.waqtd details of emps earning more than 2000 rupees per month
select *
from emp
where sal*1 > 2000;

-- assignment on logical operators--
-- 1. waqtd details of the employees working as clerk and earning less than 1500
select * 
from emp
where job="clerk" and sal<1500; 
-- 2.waqtd name and hiredate of the employees working as manager or clerk
select ename ,hiredate,job
from emp
where job="manager" or job="clerk";
-- 3.waqtd details of emp along with annual salary if they are working as manager
select  ename,sal,sal*12 
from emp
where job="manager";

-- 4. waqtd all the details of the emp working in clerk or as analyst-- 

select * 
from emp
where job="analyst";





 