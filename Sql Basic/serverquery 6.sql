-- PLSQL 
-- VARIABLE ASSINGMENT 

DECLARE @a int,@b int,@c int
set @a = 12 
set @b = 2
set @c = @a + @b
print @c

DECLARE @marks int 
set @marks = 32
if @marks < 33
begin 
	print 'Fail'
end
else if @marks >= 35 and @marks < 50
begin
	print 'pass'
end
else if @marks >= 50 and @marks < 60
begin 
print '2nd class'
end
else if @marks >= 60 and @marks < 75
begin
print '1st class'
end
else 
begin
print 'Distinction'
end

--- Loop : 
Declare @i int = 1
while @i <= 100
begin 
	print @i
	set @i += 1
end
---
Declare @n int,@b int  
set @n = 1
set @b = 5
while @n <= 10 
begin 
	print cast(@b  as varchar(4)) + '*'+cast(@n as varchar(4)) + '=' + cast(@b *@n as varchar(2)) 
	set @n += 1
end
--- Even odd
declare @a int,@b int 
set @a = 2
set @b = 0 
while @a <= 100
begin 
	if @a%2=0
	begin 
		print @a
	end 
	set @a = @a+1
end 
--
Declare @a int = 0,@b int = 1,@c int 
print @a 
print @b 
while @a < 100
begin 
	set @c = @a + @b
	print @c 
	set @a = @b
	set @b = @c
end

--- Transaction 
-- TRY AND EXCEPT

CREATE TABLE ACCOUNT(ID INT ,AMT INT)
INSERT INTO ACCOUNT VALUES(11,2000),(12,3000)
GO
SELECT * FROM ACCOUNT 

BEGIN TRY 
	BEGIN TRANSACTION 
	UPDATE ACCOUNT SET AMT = AMT - 500 WHERE ID = 11
	UPDATE ACCOUNT SET AMT = AMT + 500 WHERE ID = 12
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION 
END CATCH

use sample_db1;

CREATE PROCEDURE usp_employee
as begin 
	select * from emp
end

usp_employee 

use sample_db1
go

use sample_db1

create or alter proc usp_retrieve_data1(@tablename varchar(49),@coloum1 varchar(100),@colum2 varchar(100))
as begin 
	declare @sql varchar(100) 
	set @sql = 'select ' + @coloum1 + ','+ @colum2 + ' from ' + @tablename 
	exec (@sql)
end
go 

exec usp_retrieve_data1'emp1','ename','salary'


create proc usp_insert_emp(
@eno int,
@ename varchar(50),
@sal int)
as  
begin 
	declare @cnt int = 0
	select @cnt=count(*) from emp6 where eno=@eno
	if @cnt >0
	begin
		update emp6 set ename=@ename,sal=@sal where eno = @eno
	end 
	else 
		insert into emp6 values(@eno,@ename,@sal)

end
select * from emp6
use sample_db1
-- create table emp6(eno int,ename varchar(50),sal int)

exec usp_insert_emp 1,'Prakash',2999
exec usp_insert_emp 2,'Ramesh',4400

-- Procedure 2 : 
create proc usp_sal
(@eno int,@sal int out)
as begin
	select @sal=sal from emp6 where eno=@eno
end

declare @rsal int
exec usp_sal 1,@sal=@rsal out
print @rsal
-- out call by reference

select * from emp
select * from dept

create or alter proc usp_employeelist(@dno int) 
as begin 
	select e.ename,d.dname from emp e inner join dept d on e.dno = d.dno where d.dno = @dno
end

exec usp_employeelist 1
-- It is not mandatory to return values in procedure 
-- Parameter in ,out
-------------------------------------------
--------------------------------------------
--- Triggers : Special kind of procedure or daemon which will fire automatically when ddl,dml
-- ddl   
-- dml
-- clr 
-- After 
--- After insert 
---  After update
--- After delete
---/ instead of trigger 

create table employee_test 
(
emp_id int identity,
emp_name varchar(100),
emp_sal int,
)
insert into employee_test values('Prakash',10000)
insert into employee_test values('Ays',15000)
insert into employee_test values('Krishna',14000)
insert into employee_test values('Radha',10500)
insert into employee_test values('Lakshmi',20400)
-- Audit table record to save data 
create table employee_test_audit
(
emp_id int,
emp_name varchar(100),
emp_sal decimal(10,2),
audit_action varchar(100),
audit_time datetime
)

create trigger trg_delete on employee_test
after delete 
as begin 
	declare @eno int,@ename varchar(50),@sal decimal(10,2)
	select @eno=emp_id,@ename=emp_name,@sal=emp_sal from deleted
	insert into employee_test_audit values(@eno,@ename,@sal,'deleted',getdate())
end

delete from employee_test where emp_id = 1

select * from employee_test
select * from employee_test_audit

create trigger trg_update on employee_test
after update
as begin 
	declare @eno int,@ename varchar(50),@sal decimal(10,2)
	select @eno=emp_id,@ename=emp_name,@sal=emp_sal from inserted
	insert into employee_test_audit values(@eno,@ename,@sal,'updated',getdate())
end
update employee_test set emp_sal = 20000 where emp_id = 2

select * from employee_test
select * from employee_test_audit

-- cursor 
use sample_db1;


DECLARE @name varchar(50) 
DECLARE @path varchar(255)
DECLARE @filename varchar(223)
DECLARE @filedate varchar(20)

set @path = 'C:\Processes\'

SELECT @filedate = CONVERT(VARCHAR(20),GETDATE(),112)
-- Declare cursor for query
DECLARE db_cursor CURSOR FOR 
SELECT NAME
from master.dbo.sysdatabases
where name not in ('master','model','msdb','tempdb')
-- Open cursor 
open db_cursor 
-- Fetching cursor 
FETCH NEXT FROM db_cursor into @name 

-- looping & fetching
while @@FETCH_STATUS = 0 
begin 
	set @filename = @path + @name + '_' + @filedate + '.bak'
	backup database @name to disk = @filename

	fetch next from db_cursor into @name
end

close db_cursor;
deallocate db_cursor;


select name,row_number() over (order by name) as rno into #temp2
from master.dbo.sysdatabases
where name not in ('master','model','msdb','tempdb')

select * from #temp2 where rno =1

---cursor example 1
use sample_db1
go

DECLARE @name varchar(50) 
DECLARE @path varchar(255)
DECLARE @filename varchar(223)
DECLARE @filedate varchar(20)
DECLARE @i int 

set @path = 'C:\Processes\'

SELECT @filedate = CONVERT(VARCHAR(20),GETDATE(),112)
 
SELECT NAME,ROW_NUMBER() over (order by name) as rno into #temp2
from master.dbo.sysdatabases
where name not in ('master','model','msdb','tempdb')
select @i = count(rno) from #temp2

while(@i >0 )
begin 
	select @name=name from #temp2 where rno=@i
	set @filename = @path + @name + '_' + @filedate + '.bak'
	backup database @name to disk = @filename
	set @i = @i-1 
end

drop table #temp2
select * from #temp2

--- UDF 
/*  USER DEFINED FUNCTION IS SIMILAR TO A STORED PROCEDURE

SCALAR FUNCTION
*/
create or alter function hra_sal(@sal int)
returns int 
as begin 
	declare @hr int
	if @sal > 25000
	begin
		set @hr =@sal*0.3
	end
	else 
	begin 
		set @hr = @sal*.2
	end
	return @hr
end

use sample_db1;

select dbo.hra_sal(salary) as hr_a from employee2


select * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME='salary'

select * from employee2

--- Procedure 
create or alter procedure sum_sal
as 
begin
select sum(salary) as 'salary',dno from emp1 group by dno having sum(salary) > 5000
end

exec sum_sal
-- Inline function
create or alter function get_departmentname(@dno int)
returns table as 
	return select ename,dname from emp e inner join dept d 
	on e.dno = d.dno where e.dno = @dno

select * from dbo.get_departmentname(3)

--- LIFE CYCLE MODEL - WATER LIFE
/* REQUIREMENT 
-- ANALYIS +
-- DESIGN
-- DEVELOPEMENT
-- TESTING
-- UAT
-- PROD
-- Maintainance
*/

create table employee3(eno int,ename varchar(50),termination_date datetime)

insert into employee3 values (111,'alex',null),(222,'prala',null)

select * into employee3_log from employee where 1=2

select * from employee3_log

insert into employee3_log select * from employee3 where termination_date is not null
delete employee3 where termination_date is not null

-- 
use sample_db1
create table emp8(eno int , ename varchar(20))
insert into emp8 values(2,'alex'),(1,'kamal'),(5,'rah')

create clustered index idx_eno on emp8(eno)
select * from emp8
--- Physicall order sortd
--- but not in non clustered

-- Dynamic  process

alter proc sp_retrive_data(@tablename varchar(60),@c1 varchar(50) , @c2 varchar(50))
as begin
	DECLARE @sql varchar(5000)
	SET @sql = 'SELECT ' + @c1 + ','+ @c2 + ' from ' + @tablename
	exec (@sql)
end

exec sp_retrive_data 'emp3','eno','ename'

select * from leaves

end

--



