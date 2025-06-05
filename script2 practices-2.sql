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

select * from Dept;

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

select* from emp;
select count(*) from emp;

-- 1.  waqtd the annual salary of the employee whos name is smith--
select ename,sal ,sal*12
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

-- 8. waaqtd empno of the employees who are working in deptno 30--
select emp_no,ename
from emp
where deptno=30;
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
select ename,sal
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
where sal*1> 2000;

-- assignment on logical operators--
-- 1. waqtd details of the employees working as clerk and earning less than 1500
select * 
from emp
where job="clerk" and sal<1500; 
-- 2.waqtd name and hiredate of the employees working as manager or clerk
select ename ,hiredate,job ,deptno
from emp
where job="manager" and deptno=30;
-- 3.waqtd details of emp along with annual salary if they are working in dept 30 as salesman and their annual salary has to be greater than 14000

select   * ,sal*12 
from emp
where job="salesman" and deptno=30 and sal*12>14000;

-- 4. waqtd all the details of the emp working in deptno 30 or as analyst 

select * 
from emp
where deptno=30 or job="analyst";
 
 -- 5.NAMES OF EMPLOYEES WHOS SALAry is less than 1100 and their designation is clerk--
 select ename,job,sal
 from emp
 where sal<1100 and job="clerk";
 
 -- 6.name & sal ,annual sal and deptno if deptno is 20 earning more than 1100 and annual salary
 -- excedes 12000
 select ename,sal,sal*12,deptno 
 from emp
 where (deptno=20 and sal>1100) and sal*12>12000;
 
 -- 7. empno & name of the employees working as manager in deptno 20
 select emp_no ,ename
 from emp
 where job="manager" and deptno=20;
 
-- 8.details of employees working in dept 20 or 30
select *
from emp
where deptno=20 or deptno=30;

-- 9. details of employees working as analyst in dept 10
select *
from emp
where job="analyst" and deptno=10;

-- 10.details of employees working as president with salary of rupees 4000
select *
from emp
where job="president" and sal>4000;

-- 11.names & deptno ,job of employees working as clerk in dept 10 or 20
select ename,deptno,job
from emp
where job="clerk" and (deptno=10 or deptno=20);

-- 12. details of emp working as clerk or manager in dept 10
select *
from emp
where (job="clerk" or job="manager") and deptno=10;

-- 13.names  of emp working in dept 10,20,30,40
select ename
from emp
where deptno in(10,20,30,40);

-- 14.details of employee with emp_no 7902,7839

select *
from emp
where emp_no in (7902 , 7839);

-- 15.details of emp working as manager or salesman or clerk
select *
from emp
where job in ("manager" ,"salesman","clerk");

-- 16. names of emp hired after 81 and before 87
select ename,hiredate
from emp
where hiredate>"1981-12-31" and hiredate<"1987-01-01";

-- 17. details of emp earning more than 1250 but less than 3000
select *
from emp
-- where sal between 1250 and 3000;
where sal>1250 and sal<3000;

-- 18. names of emp hired after 81 into dept 10 or 30
select ename
from emp
where hiredate>"1981-01-01" and deptno in(10,30);

-- 19. names of emp along with annual sal for the employees working as manager or clerk into dept 10 or 30
select ename ,sal*12,job,deptno
from emp
where (job ="manager" or job= "clerk") and deptno in (10,30);

-- 20. all the details along with annual sal if sal is between 1000 and 4000 anuual sal more than 15000
select *, sal*12
from emp
where (sal between 1000 and 4000) and sal* 12>15000;

-- SPECIAL OPERATORS----------------
-- is --operator deal with null,not null
-- 1. list all the emp whose commission is null
select *
from emp
where commision is  null;

-- 2.list all the employee who dont have a reporting manager
select *
from emp
where mgr is  null;

-- 3.list all the salesman in dept 30
select *
from emp
where job="salesman" and deptno=30;

-- 4.list all the salesman in dept 30 and having salary greater than 1500
select *
from emp
where (job ="salesman" and deptno =30) and sal>1500;

-- 5.list all the employee whose name starts with "s" or "a"

select ename
from emp
where ename like 'a%'or ename like  's%';

-- 6.list all the emp except those who are working in dept 10 & 20
select *
from emp
where deptno NOT IN( 10 ,20 );

-- 7. list the emp whose name does not start with 's'
SELECT * 
from emp
where ename not like 's%';

-- 8. list all the emp who are having reporting managers in dept 10
select *
from emp
where deptno=10 and mgr is not null;

-- 9. list all the emp whose commission is null and working as clerk
select ename,commision ,job
from emp
where commision is null and job="clerk";

-- 10. list all the emp who dont have a reporting manager in deptno 10 or 30
select * 
from emp 
where mgr is null and deptno in (10,30);

-- 11.list all the salesman in dept 30 with sal more than 2450
select *
from emp
where job="salesman" and deptno=30 and sal>2450;

-- 12. list all the analyst in dept number 20 and having sal greater than 2500
select * 
from emp
where job="analyst" and deptno=20 and sal>2500;

 -- 13. list all the emp whose name starts with 'm' or 'j'
 select ename
 from emp
 where ename like 'j%' or ename like 'm%';
 -- where ename like ('j%' , 'm%');
 
 -- 14. list the emp with annual sal except those who are working in dept 30
 select * ,sal*12
 from emp
 where deptno not in (30);
 
 -- 15. list the emp whose name does not end with 'th' or 'n'
 select *
 from emp
 where (ename not like '%es') and (ename not like '%r');
 
 -- 16.list all the emp who are having reporting managers in dept 10 along with 10% hike in sal
 select *,(10/100)*sal,(10/100)*sal+sal
 from emp
 where deptno=10 and mgr is not null;
 
 
 
 -- 17.display all the emp who are 'salesman' having 'e' as the last but one character in 
 -- ename but sal having exactly 4 character
 select *
 from emp
 where job="clerk" and ename like '%th' and sal like '---';
 -- 18.display all the emp who are joined after year 81
 select *
 from emp 
 where hiredate>'1981-12-31';
 
 -- 19. dispaly all the emp who are joined in feb
 select *
 from emp
 where hiredate between '1981-02-01' and '1981-02-31';
 -- 20.list the emp who are not working as managers and clerks in dept 10 AND 20 
 
 -- WITH A SALARY IN THE RANGE OF 1000 TO 3000.
 select * from emp;
 select * 
 from emp
 where (job!='manager' and job!='clerk') and  deptno not in(10,20) and  ename like 'a%';

-- assignment on MRF--
-- 1.number of emp getting sal less than 2000 in deptno 10
select count(*)
from emp
where sal<2000 and deptno=10;

-- 2.total sal needed to pay emp working as manager
select sum(sal)
from emp
where job='manager';
select sal,job
from emp
where job='manager';

-- 3.avg sal needed to pay all emp
select avg(sal)
from emp;

-- 4.no of emp having 'a' as their 1st character
select count(*)
from emp
where ename like 'a%';

-- 5.no of emp working as a clerk or manager--
select count(*)
from emp 
where job='manager' or job='clerk';
select count(*) from emp where job='clerk';
select count(*) from emp where job='manager';

-- 6.total needed salary to pay emp hired in feb
select sum(sal)
from emp
where hiredate between'1981-02-01' and '1981-02-28';

-- 7.no of emp reporting to 7839 mgr
select count(*)
from emp
where mgr=7839;

-- 8.no of emp getting commision in deptno 30
select count(*)
from emp 
where commision is not null and deptno in(30);

-- 9.avg sal,total sal number of emps and max sal given to emp working as president
select sum(sal),avg(sal),max(sal),count(*)
from emp
where job='president';

-- 10.waqtd no of emp having 'a' in their names
select count(*)
from emp
where ename like '%a%' ;

-- 11.waqtd no of emp and total sal needed
select count(*),sum(sal)
from emp;


select count(distinct deptno)
from emp;



-- 13.waqtd no of emp having character 'z' in their name
select count(*)
from emp
where ename like '%z%';

-- 14.waqtd no of emp having '$' in their names 
select count(*)
from emp 
where ename like '%$%';

select count(*)
from emp 
where ename like '%th%';

-- 15.waqtd total sal given to emp working as clerk in dep 30
select sum(sal) 
from emp
where job='clerk' and deptno=30;

-- 16.waqtd max sal given to the emp working as analyst
select max(sal)
from emp
where job='analyst';

select *
from emp
where job='president';

-- 17.waqtd no of distinct sal present in emp table
select distinct(sal)
from emp;

select count(distinct sal)
from emp;

-- 18.waqtd no of jobs  present in emp table
select distinct(job)
from emp;
select count(distinct job)
from emp;
select count(*),job
from emp
group by job;

-- 19.waqtd avg sal given to the clerk
select avg(sal)
from emp
where job='clerk';

-- 20.waqtd min sal given to the emp who working in dept 10 as manager or a clerk
select min(sal),job,deptno 
from emp
where deptno=10 and  job in('manager' ,'clerk')
group by deptno,job;

select min(sal)
from emp
where deptno=10 and  job in('manager' ,'clerk');
-- group by---
-- 1. 
select count(*),deptno 
from emp
where job !='president'
group by deptno;

-- 2.
select sum(sal),job
from emp
group by job;
-- 3.
select count(*),deptno
from emp
where job='manager'
group by deptno;
-- 4.
select avg(sal) ,deptno
from emp
where deptno!= 20
group by deptno;

-- 5.
select count(*),job
from emp
where ename like '%a%'
group by job;

-- 6.
select count(*) ,avg(sal),deptno
from emp
where sal>2000
group by deptno;

-- 7.
select sum(sal) , count(*),deptno,job
from emp
where job='salesman'
group by deptno,job;
select*from emp;

-- 8. 
select count(*),max(sal) ,job
from emp
group by job;

-- 9.
select max(sal), deptno
from emp
group by deptno;

-- 10.
select count(sal)
from emp;
-- assignment case1-----
-- 1.
select ename,sal
from emp
where sal>(select sal from emp where ename='adams');
-- 2.
select ename ,sal
from emp
where sal<(select sal from emp where ename='king');
-- 3.
select ename,deptno
from emp 
where deptno=(select deptno from emp where ename='jones');
-- 4.
select ename,job
from emp
where job=(select job from emp where ename='james');
-- 5.
select ename,emp_no,sal,sal*12
from emp
where sal*12>(select sal*12 from emp where ename='ward');
-- 6. 
select ename,hiredate
from emp
where hiredate<(select hiredate from emp where ename='scott');
-- 7.
select ename,hiredate
from emp
where hiredate>(select hiredate from emp where job='president');
-- select hiredate from emp where job='president';
-- 8.
select ename,sal
from emp
where sal<(select sal from emp where emp_no=7839);
-- 9. 
select *
from emp
where hiredate <(select hiredate from emp where ename='miller');
-- 10. 
select ename,emp_no,sal
from emp
where sal>(select sal from emp where ename='allen');
-- 11. 
select ename,sal
from emp
where sal >(select sal from emp where ename='miller')and 
sal<(select sal from emp where ename='allen');

select sal from emp where ename='allen';-- 1600
select sal from emp where ename='miller';-- 1300
-- 12. 
select *
from emp
where deptno=20 and job=(select job from emp where ename='smith');
-- 13. 
select * 
from emp 
where job='manager'and deptno=(select deptno from emp where ename='turner');
-- 14. 
select ename,sal,sal*12
from emp
where sal<(select sal from emp where ename='blake') and sal>3500;
-- 16. 
select sal ,ename from emp where ename='scott';-- 3000
select sal ,ename from emp where ename='king';-- 5000
select * 
from emp
where sal>=(select sal from emp where ename='scott')and
 sal<=(select sal  from emp where ename='king');
 -- 17. 
 select ename 
 from emp 
 where ename like 'a%'and deptno=(select deptno from emp where ename='blake');
 -- 18. 
 select ename ,commision,job
 from emp
 where commision is not null and 
 job=(select job from emp where ename='smith');
 
 -- 19. 
 select * 
 from emp
 where job='clerk' and deptno=(select deptno from emp where ename='turner');
-- 20. 
select sal,ename from emp where ename='smith';-- 800
select sal,ename from emp where ename='king';-- 5000

select ename,sal,sal*12,job
from emp
where sal*12>(select sal*12 from emp where ename='smith') and
sal*12<(select sal*12 from emp where ename='king');

-- subquery--
-- 1. 
select ename,sal ,job
from emp
 where sal> all(select sal from emp where job='salesman');
 -- 2. 
 select * 
 from emp
 where hiredate >all (select hiredate  from emp where job='clerk');
 select hiredate  from emp where job='salesman';
 -- 3. 
 select sal ,ename from emp where job='manager';
 select ename,sal
 from emp
 where sal< any(select sal  from emp where job='manager');
 -- 4. 
 select ename ,hiredate 
 from emp
 where hiredate< all(select hiredate from emp where job='manager');
 -- 5. 
 select ename,hiredate,sal
 from emp
 where hiredate >all(select hiredate from emp where job='manager')and
 sal> all (select sal from emp where job='clerk');
 select sal from emp where job='clerk';
-- 6. 
select *
from emp
where hiredate<any (select hiredate from emp where job='salesman')
and job='clerk';
desc dept;
select *
 from emp
 where deptno =(select deptno from dept where dname='accounting') or
 deptno=( select deptno from dept where dname='sales');
 select *from dept;
 
 select dname 
 from dept
 where deptno in (select deptno from emp where ename in('smith','king','miller'));
 
 select * 
 from emp
 where deptno=(select deptno from dept where loc='new york') or
 deptno=(select deptno from dept where loc='chicago');
 
select ename 
from emp
where hiredate>all(select hiredate from emp where deptno=10) ;
-- self join----------------------------------------------------------------
-- 1. 
select e1.ename as empname, e2.ename as manager
from emp e1 join emp e2
on e1.mgr =e2.emp_no where e1.job="clerk";

select e1.ename as empname ,e2.ename as manager
from emp e1 join emp e2
on e1.mgr=e2.emp_no where e1.job='clerk';








