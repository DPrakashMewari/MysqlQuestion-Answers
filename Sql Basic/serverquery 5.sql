use sample_db1;

create table users(id int identity(1,1),name varchar(100))
insert into users values('Prakash'),('Ays'),('Neeraj'),('Ravi');


create table course(id int identity(1,1),course_name varchar(100),course_rank int); 
insert into course values('Data Science',100),('AI',200),('Machine learning',300),('SQL',400)
select * from course;
select * from users;

--- Update:
update course set course_name = 'Full Stack Data Science',course_rank=101 where id = 1;

select * from course  order by course_rank desc;

select count(*) from course;
select min(course_rank) from course;
select max(course_rank) from course;
select avg(course_rank) from course;
select sum(course_rank) from course;
-- String function
select len(course_name) from course;

--- 
select * from course where course_name = 'Machine learning' or course_rank = 101;


select GETDATE();
---
select * from course;
select id,max(course_name) from course group by id;
---
select id,sum(course_rank) from course group by id having id = 2;

select id,sum(course_rank) from course where id = 2 group by id;

select top(3) *  from users order by name desc;

alter table users add designation varchar(100);

update users set designation = 'student' where id = 4;

select * from users;
select * from course;

-- Joins : 
create table t1(c1 int);
create table t2(c2 int);

insert into t1 values(2),(1),(4);
insert into t2 values(1),(4),(2);

select t1.c1,t2.c2 from t1 inner join t2 on t1.c1 = t2.c2;

create table dept(dno int,dname varchar(50))
create table emp(eno int,ename varchar(50),dno int)
insert into dept values(1,'HR'),(2,'IT'),(3,'admin')
insert into emp1 values(1,'alex',4000,1),(2,'preethi',5000,2),(3,'preshe',3999,3)

select ename from emp e inner join dept d on e.dno = d.dno where d.dname = 'HR'

select ename from emp where dno in (select dno from dept where dname = 'HR')

-- EVERY REQUIREMENT OF JOIN FULL FILL BY SUBQUERY BUT NOT VICE VERSA
-- correlated subquery :
create table emp1(eno int,ename varchar(50),salary int,dno int);
select * from emp1
select e1.salary from emp1 as e1 where 2 in (select count(*) from emp1 as e2 where e1.salary<e2.salary)
--
-- String Function : 

use sample_db1; 
create table employee2(e_no int,e_name varchar(50),salary int)
insert into employee2 values(1,'Vijay Kumar',20000),(2,'ravi',24410),(3,'zde',21323),(4,'trive',35000);

select * from employee2;
select ASCII('a')

select char(73)


select e_name,CHARINDEX('r',e_name) from employee2; -- fin index of our argument

select 'Prakas' + 'm'; 

select CONCAT('prakash','m');

select e_name,left(e_name,4) from employee2

select e_name,left(e_name,charindex(' ',e_name)) from employee2;

select e_name,len(e_name) as 'length of name' from employee2;

select upper(e_name) from employee2;

select lower(e_name) from employee2;

select ltrim('  kamal ')
select RTRIM('prakash    ')
select replace('How prakash ','prakash','vimal')
select reverse('Prakash')

/* Finding last name */       ---      THIS THING WILL FIND SPACE 
select e_name,right(e_name,charindex(' ',REVERSE(e_name))) from employee2;

/* date */
select GETDATE();
select dateadd(MM,5,getdate())
select datediff(YYYY,GETDATE(),2018)
select day(getdate())
select month(getdate())

/* Aggregation */
select * from emp1;
select sum(salary) from emp1;
select * from emp1;
select max(salary),dno from emp1 group by dno;
select dno,sum(salary) from emp1 group by dno having sum(salary)>3000;
select dno,sum(salary),ename from emp1 where salary>3000 group by dno;

use sample_db1;
--- converting specific data type in this case 
select ename+cast(eno as varchar(2)) from emp1;
select ename+convert(varchar(2),eno) from emp1;

-- 
-- Windows function : 
select *,ROW_NUMBER() over (order by eno) as 'row num' from emp1

select *,ROW_NUMBER() over (partition by dno order by eno) as 'row num' from emp1;

create table marks(sno int, marks int,branch varchar(50));
insert into marks values(1,75,'MCA'),(2,75,'MBA'),(3,100,'MSC'),(4,33,'MSC')

SELECT * FROM MARKS;

-- Rank method : RANK will then skip the next available ranking value whereas DENSE_RANK would still use the next chronological ranking value.
SELECT *,rank() over(order by marks desc) as 'RNK' from marks;

SELECT *,dense_rank() over(partition by branch order by marks desc) as 'RNK' from marks;

/* Difference bw rank and dense ranks */

--- SET OPERATORS : 
-- UNION,UNION ALL , INTERSECT , EXCEPT 

SELECT * INTO emp3  from emp1 where 1 = 3;
select * from emp1;
select * from emp3;
insert into emp3 values(1,'alex',56000,1);
insert into emp3 values(2,'preethi',5000,2),(3,'sysh',29999,3)

-- vertical column should be same datype,columnsize 
drop table emp3;


select * from emp1
UNION 
select * from emp3;

select * from emp1
UNION ALL
select * from emp3;


select * from emp1
intersect
select * from emp3;

-- Except return only those rows that are not return in 2 row
select * from emp1
except
select * from emp3;
-- We can create our schema by default there is dbo.table_name 
-- We can create like this create schema Prakash
-- After that : schema.table_name  : Prakash.table_name also : We can do with select * from DEKSTOP.DATABASE_NAME.SCHEMANAME.TABLE_NAME;

create view emp1andemp2
as select ename,dname from emp1 inner join dept on emp1.eno=dept.dno;


select * from emp1andemp2;

-- Index is technique which we can retrive data easily very fast
--Non cluster and cluster
-- N no of non cluster we can creaye
-- but cluster only 1 
-- Pyshical order of column in the table will be sorted

drop table emp5
create table emp5(eno int,ename varchar(40));
insert into emp5 values(1,'Prakash'),(2,'arya'),(3,'vi'),(4,'les');


create clustered index idx_eno on emp5(eno);
select * from emp5;
-- You cannot create another index 
-- create clustered index idx_ename on emp5(ename);

-- coloumn store
drop table emp_source;
drop table emp_target;
create table emp_source(eno int,ename varchar(50));
insert into emp_source values(3,'Kamal'),(2,'vijay')
create table emp_target(eno int,ename varchar(50));
insert into emp_target values(1,'alex')

select * from emp_source;

merge emp_target as t 
using emp_source as s
on t.eno = s.eno
when matched then 
update set t.ename = s.ename
when not matched then
insert (eno,ename) values (s.eno,s.ename);


--
/* CTE */
with emp_dup
as (select eno,ename,ROW_NUMBER() over (partition by eno order by eno) as rno
from emp_source)
select distinct * from emp_source;
--delete from emp_dup where rno > 1;

-- Raw way : To find distinct and drop duplicates
select distinct * into #emp from emp_source
truncate table emp_source
insert into emp_source select * from #emp

select * from emp_source;

-- top 
select top(2) * from  emp_source;

-- self join 
create table employee(eno int,ename varchar(40),mgrid int) 
insert into employee values(1,'preethi',null),(2,'alex',1),(3,'yatish',1),(4,'Arya',2)

select e.ename,m.ename from employee e join employee m on e.mgrid =m.eno
union
select ename,Null from employee where mgrid is null

create table t3(c1 varchar(50));
insert into t3 values('IND'),('PAK'),('AUS');

select t1.c1 +'*' + t2.c1 from t3 as t1 join t3 as t2 on t1.c1>t2.c1;
-- salary top 2
select * from emp3;
select top 1 * from emp3 where salary not in (select max(salary) from emp3) order by salary desc;

-- with cte
with emp_sal
as 
(select*,rank() over (order by salary desc) as r from emp3)
select * from emp_sal where r = 2;

-- correlated sub query 
select * from emp3 as e1 where 1 =
(select  count(*) from emp3 as e2 where e1.salary<e2.salary)


---
/*
CREATE
INSERT 
UPDATE 
DELETE
DROP 
OPERATORS 
VIEWS
JOINS
ORDER BY 
HAVING 
TOP 
DISTINCT
SUBQUERY,CORRELATED SUBQUERY 
CTE
RANK,DENSE 
CAST
STRING FUNCTION
DATE FUNCTION
AGGREGATION FUNCTION
MERGE
ROWNUMBER(),OVER,PARTIONBY
INDEX()
COPY ONE TABLE TO ANOTHER 
*/

-- Practise :
use sample_db1;
-- Create
create table Person(id int identity,name varchar(50),salary decimal);
-- Drop table
drop table if exists dbo.Person;
---Insert 
Create table dbo.student(id int identity primary key, name varchar(45),gender varchar(20),age int ,marks int);
insert into dbo.student values('Prakash','Male',32,450);
-- Copy one table to another
select * into student1 from student; -- COPY 
Truncate table student
insert into student select name,gender,age,marks from student1;
------------------ 
-- DDL 
-- CREATE ,TRUNCATE,DROP ALTER

-- DML 
-- INSERT UPDATE DELET

-- DQL
-- SELECT 

-- TQL 
-- ROLLBACK COMMIT SAVEPOINT 

-- DCL 
-- GRANT REVOKE 
-----------------------------
-- DML 
-- UPDATE 
update student set marks = 35  where name = 'Prakash';
--------------
-- DDL : ALTER 
alter table student add address varchar(100);
select * from student;
update student set address = 'xyz' where name = 'Prakash';
--
create view studentview
as 
select * from student;

select * from studentview;
---
-- Aggregation : 
INSERT INTO student values('Aysh','Female',33,100,'yzs'),('Rini','Female',44,100,'adf');
select name,min(marks) as 'Min marks' from student group by name order by min(marks);
select name,max(marks) as 'Max marks' from student group by name;
select name,sum(marks) as 'Marks sum' from student group by name;
select name,avg(marks) as 'Average Marks' from student group by name order by avg(marks);
-- Corelated subquery 
select * from student s1 where 1 = (select count(*) from student s2 where s1.marks > s2.marks)
select * from student;
-- Subquery using max function 
select name,gender,age,marks from student where marks = (select max(marks) from student);
-- Having with max
select name,max(marks) as 'Marks' from student group by name  having max(marks) > 50;
select name,max(marks) over(partition by marks) as 'Highest marks' from student;
--
use sample_db1;
-- 
-- List out all table in particular db 
select * from information_schema.tables;
select * from marks;

select branch,sum(marks) as 'sum of marks' from marks group by branch;

select branch,sum( distinct marks) as 'sum of marks' from marks group by branch order by sum(marks)
select branch,sum(marks) as 'sum of marks' from marks
group by
branch having sum(marks) > 60 order by sum(marks);

select distinct branch,sum(marks) over (partition by marks) as 'total marks'
from marks

select * from emp1
union
select * from emp
select * from emp1

select ename from emp1
union
select ename from emp
---
select * into #emp1 from emp1
select * from #emp1
union 
select * from emp1
-- 
-- BASED ON IN OPER
select * from emp1 where eno in (1,3)
select * from emp1 where eno NOT in (1,3)
select * from emp1 where eno <> 1 and eno <> 3

insert into emp1 values(null,null,null,null)
insert into emp1 values(null,null,null,null)
insert into emp1 values(null,null,null,null)

select * from emp1 where eno is not null;

select * from emp1 where not exists (select * from #emp1 where emp1.ename = #emp1.ename or emp1.salary = #emp1.salary);

delete emp1 where eno is null;
use sample_db1
select * from emp1 where eno between 1 and 3 
--- is null
select * from emp1 where ename is null;
insert into emp1 (eno,ename,salary,dno) select eno,ename,salary,dno
from emp1 where ename is null

select * into #emp1 from emp1

select * from emp1 where exists (select * from #emp1 where emp1.ename = #emp1.ename and emp1.salary = #emp1.salary);

select distinct salary from #emp1;
select sum(distinct salary) as 'salary' from #emp1 group by salary;
select * from emp1 order by len(ename) desc 
--- Getting record  of middle data by order and off set condition
select * from emp1 order by ename offset 1 rows
fetch next 1 rows only;

use sample_db1

select * from emp1 order by eno offset 1 rows fetch next 1 rows only

select grouping(ename) as 'is_grouped' from emp1 group by grouping sets(ename);

select * from emp1;

--- 
CREATE TABLE cricketer(first_name varchar(30),
last_name varchar(30),salary money,
constraint crick_pk primary key(first_name,last_name));

alter table cricketer drop constraint crick_pk;

select * from sample_db1.INFORMATION_SCHEMA.tables;

select * from studentview;
create view empview as 
select * from emp1 e1 where exists (select * from empnew e2 where e2.ename = e1.ename)

select * into empnew from emp1;

select * from empnew;
-- Substrig function 
select substring('Name from person',3,12)

select substring('Prakash Tiwari',charindex(' ','Prakash Tiwari')+1,len('Prakash Tiwari'))

select substring('Prakash',3,len('Prakash')-2)

use sample_db1
-- CTE NAME
with emp_name
as (select eno,ename,salary from emp1 where salary != 7999),
emp_salary_greater
as (select eno,ename,salary from emp1 where salary >= 5000)
select * from emp_name
intersect
select * from emp_salary_greater

use sample_db1;

CREATE TABLE customer (      
  id int PRIMARY KEY,      
  c_name nvarchar(45) NOT NULL,      
  email nvarchar(45) NOT NULL,      
  city nvarchar(25) NOT NULL      
);    
SELECT * FROM customer;  

--- CURSOR 
DECLARE @id int,@c_name varchar(50),@city varchar(50)

DECLARE @COUNTER int 
SET @COUNTER = 1
DECLARE printcustomers cursor
for 
select id,c_name,city from customer
open printcustomers
fetch next from printcustomers into 
@id,@c_name,@city 
while @@FETCH_STATUS=0
begin 
	if @COUNTER = 1
	begin 
		print 'id' + char(9) + 'c_name' + char(10) + char(10) + 'city'
		print '---------------'
	end
	PRINT CAST(@id AS NVARCHAR(10)) + CHAR(9) + @c_name + CHAR(9) + CHAR(9) + @city  
	set @COUNTER += 1
	FETCH NEXT FROM printcustomers into 
	@id,@c_name,@city 
end
close printcustomers
deallocate printcustomers 

create or alter procedure last_name_procedure(@name varchar(30))
as
DECLARE @query varchar(400)
if len(@name) >= 6
begin
	set @query = substring(@name,charindex(' ',@name)+1,len(@name))
	print (@query)
end
else
begin
	print 'Please write your surname and space'
end

exec last_name_procedure 'Praka'


--- Transaction 
use Prakash
go 


-- SCALAR FUNCTION 
CREATE FUNCTION new_salescal(@quantity int,@price dec(10,2),@discount dec(3,2))
returns decimal(10,2)
as 
begin 
	return @quantity * @price * (1 - @discount)
end

select dbo.new_salescal(2,3499,2.3) as netsales;
use prakash

select * from INFORMATION_SCHEMA.TABLES

select * from details

use sample_db1
go
select * from leaves

--- 1 . cursor 
-- 2.. following way
select *,ROW_NUMBER() over (order by eno) as rno into #temp from leaves
DECLARE @tot_count int,@cnt int= 1,@from_date datetime,@end_date datetime,@eno int
create table result(eno int,leave_date datetime)
select @tot_count = count(*) from #temp
while @cnt <= @tot_count
begin 
    select @eno =eno ,@from_date =leave_from,@end_date = leave_to from #temp where rno=@cnt
	while DATEDIFF(d,@from_date,@end_date) >0 
		begin
			insert into result values(@eno,@from_date)
			set @from_date = Dateadd(d,1,@from_date)
		end
	set @cnt += 1
end

select count(eno) as 'employee holidaye' from result group by eno having count(eno) > 1
use sample_db1

SELECT DATEDIFF(d, '2017/08/25', '2011/08/25') AS DateDiff;

-- recursive cte
with cte_number(n,weekday) 
as 
(select 0,datename(dw,0) 
union all
select n+1 ,datename(dw,n+1) from cte_number where n < 6)
select weekday from cte_number


select 0,datename(dw,1)

-- system backup
-- Developer additon jobs
-- global function 


















