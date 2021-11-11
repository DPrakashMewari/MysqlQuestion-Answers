create table user_login(user_id int primary key identity,
						username varchar(50) not null unique,
						email varchar(100) not null unique,
						password varchar(50) not null);

insert into user_login(username,email,password) values
('prakashmew','xyz@gmail.com','tony123'),
('captain','steve@captain.com','steve124'),
('ays','ays@xyz.com','ays123'),
('wonder','wonder@woman.com','wonder123');


select * from master.dbo.user_login;

-- Boolean Operators :  will help in login 
select * from user_login where email = 'xyz@gmail.com' and password = 'tony123';
-- Simple thing first TRUE == TRUE = TRUE ELSE FALSE 
select * from user_login where username = 'captain' or email = 'xyz@gmail.com';

select * from user_login where not username = 'wonder';
select * from user_login where username != 'wonder';


-- Date and Time function :
-- GETDATE(),current_timestamp,sysdatetime()
-- datename(),
-- datediff()
-- dateadd()

SELECT GETDATE() AS TODAYDATE;
SELECT SYSDATETIME() AS TODAY_DATE;
SELECT CURRENT_TIMESTAMP AS TODAY_DATE;

SELECT DATENAME(MONTH,CURRENT_TIMESTAMP) AS 'month';
SELECT DATENAME(YEAR,CURRENT_TIMESTAMP) AS 'year';
SELECT DATENAME(week,CURRENT_TIMESTAMP) AS 'week';
SELECT DATENAME(day,CURRENT_TIMESTAMP) AS 'day';

-- To get age
SELECT DATEDIFF(YEAR,'28 SEPTEMBER 1995',CURRENT_TIMESTAMP) AS 'AGE IN YEARS';
-- ADD YEAR MONTH ,WEEK  
SELECT DATEADD(YEAR,100,CURRENT_TIMESTAMP) AS '100 YEAR FROM NOW';


-- GROUP BY : ANY GROUP WHICH HAS SAME VALUES FOR THAT COLUMNS
-- SELECT COLOUMN NAME(S),AGGREGATE FUNCTION() FROM TABLE_NAME GROUP BY COLUMN NAME;
-- GROUP BY USE WITH AGGREGATE FUNCTION 
-- WHEN YOU USE SAME COLOUM FOR SHOWING GROUP BY RESULT NO NEED AGGREGATE FUNTION 
-- Ex: select deptid from employee group by deptid;   --- :)
-- EX: select deptid,max(salary) from employee group by dept_id;  ---:)

select * from SAMPLE_DB.dbo.employee_info;

SELECT DEPTID FROM SAMPLE_DB.DBO.EMPLOYEE_INFO GROUP BY DEPTID;

SELECT deptid,sum(empSalary) as 'TOTAL SALARY' FROM SAMPLE_DB.DBO.employee_info GROUP BY deptid;
SELECT deptid,MIN(empSalary) as 'min SALARY' FROM SAMPLE_DB.DBO.employee_info GROUP BY deptid;
SELECT deptid,avg(empSalary) as 'avg SALARY' FROM SAMPLE_DB.DBO.employee_info GROUP BY deptid;
SELECT deptid,round(avg(empSalary),2) as 'avg SALARY' FROM SAMPLE_DB.DBO.employee_info GROUP BY deptid;

--- Having clause : define the condition
-- only used  with select,grouby
/* SELECT COLUMNN NAME,AGGREAGATE_FUNC FROM TABLE_NAME GROUP BY COLUMN_NAME HAVING CONDITION;
*/

SELECT deptid,sum(empsalary) as 'total salary' from sample_db.dbo.employee_info group by deptid  having deptid = 12;
-- using where but order first before group by
SELECT deptid,sum(empsalary) as 'total salary' from sample_db.dbo.employee_info where deptid = 12 group by deptid ;
-- TOP CLAUSE SPECIFIES THE FIRST n rows of the query result are to be retrieved 
-- TOP CLAUSE ALWAYS BE USED WITH ORDER BY CLAUSE 

/* Sytanx : select top(n) columnname from table_name order by column_name desc;
 */
select top(3) empsalary from sample_db.dbo.employee_info order by empsalary asc;





/*  HOW TO CREATE COPY OF THE TABLE DATA TO DIFFERENT TABLE 
SELECT COLUMN_NAME/* INTO TABLE_NAME FROM DATABASE_NAME.TABLE_NAME;
  */ */

SELECT * from sample_db.dbo.employee_info;
CREATE DATABASE SAMPLE_EMP_DB;
USE SAMPLE_EMP_DB;
-- SELECT * INTO EMP_DETAILS FROM SAMPLE_DB.dbo.employee_info;

-- Alter statement : ADDING,ALTERING, DROPPING AND CONSTRAINT
-- ALSO REASSINGN AND REBUILDS PARTION OR DISABLE AND ENABLE CONSTRAINT AND TRIGGERS

-- ADDING A COLUMNS
 -- ADD A COLUMN WITH CONSTRAINT THAT ALLOWS NULL VALUES;
-- SYNTAX : ALTER TABLE table_name add column_name datatype(size) [null];
-- alter table emp_info add salary deimal;
-- alter table emp_info add phone varchar(10) null;

use Prakash;
create table emp_details(name varchar(40) unique); 
select * from emp_details;

-- ADD A COLUMN WITHOUT CONSTRAINT 
alter table emp_details add emp_id int,salary int;

insert into emp_details values('Prakash',1,2000);

alter table emp_details add phone int null;
-- ADD A COLUMN WITH CONSTRAINT 
alter table emp_details add project_completed int not null default 5;
select * from emp_details;
alter table emp_details add projectId integer null constraint pid_unique_key unique;

insert into emp_details values('steve',2,5000,959898223,default,2);
-- adding several column with constraint 
alter table emp_details add revenue decimal(10,2) null,sev_no integer constraint projId_pk null;

-- Dropping a column or columns 
alter table table_name drop columns column_name;
-- BACK UP OF TABLE 
select * into emp_details_bckp from SAMPLE_EMP_DB.dbo.emp_details;
select * from emp_details;

-- Alter table drop 
alter table emp_details drop column job,phone;
-- Dropping columns and constraint : 
alter table emp_details drop constraint pid_unique_key;

--create table info(id int,name varchar(50));
--alter table info drop column id;
--alter table info add id int constraint p_id_primary primary key;
--insert into info values('Prakash',1);
---alter table info add address varchar(19);
--update info set address = 'XYTZ' where id =1;
-- alter table info drop constraint p_id_primary ,column id ; 

-- Changing the data type of columns
alter table info alter column name char(100);
select * from info;
-- yOU CAN CHANGE THE SIZE TOO
-- BUT REMEBER WE CAN ONLY INCREASED DATA IF IT THAT THERE IS ANY STORE DATA
----alter table info alter column address varchar(50);
----alter table info alter column address varchar(60);
/*     ----- */
-- Aliasing :: Can be used to create a temporary name for column or tables
-- Column aliases , Table aliases
-- Column aliases : Are used to make column heading in query output easier to read 
-- Table aliases: Are used to shorten you SQL to make it easier to read 
select empSalary AS 'EMPLOYEE SALARY' from emp_details;
select * from emp_details;


-- Joins : USED TO RETREIVE DATA FROM MULTIPLE TABLE
-- Most 4 , common : 2 
-- Type : 
-- Inner Join
-- Outer Join
	-- Left outer join
	-- right outer join 
	-- full outer join
-- Cross Join

-- 1.
-- Inner join :: Common Information it will take rather left . It works as Intersection 
-- Syntax : Select column_name from tabl1_name inner join table2_name 
-- on table1_name.column_name = tabl2_name.column_name;
use sample_db;
select * from employee_info;
select * from department_info;
insert into department_info values (10,'Developement','California'),(11,'Marketing','New york'),(12,'Management','Sydney');
-- inner join
select empID,empName,empsalary,deptname,deptLocation from employee_info inner join department_info on employee_info.deptid = department_info.deptId;

-- Table alias with inner join
select e.empID,e.empName,e.empsalary,d.deptname,d.deptLocation from employee_info e inner join department_info d on e.deptid = d.deptId;


-- Left Outer Join : Return all records from left table and matching records from right table 
/* select column_name(s) 
from tabl1_name left outer join table2_name 
on table1_name.column_name = table2_name.column_name; */
select * from department_info;
select * from employee_info;
select e.empId,e.empName,e.job,e.empSalary,d.deptName,d.deptLocation
from employee_info e left join department_info d
on e.deptid = d.deptId order by e.empSalary desc;
use SAMPLE_DB
--- Right outer join : Matching records from left table else all records of right table  
select empId,empName,empSalary,deptname,deptLocation from employee_info right outer join department_info 
on employee_info.deptid = department_info.deptid 

-- Full Outer : both left and right join but return also those record which are null too
select empId,empName,empSalary,deptname,deptLocation from department_info full outer join employee_info 
on employee_info.deptid = department_info.deptid 

