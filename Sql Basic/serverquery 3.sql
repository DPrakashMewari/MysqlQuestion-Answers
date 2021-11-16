/* Subquery :
- A query within another SQL query and embedded with the where clause 
- Subquery must be enclosed within parathesis 
- Subqueries can be used with the select,insert,update and delete statement along 
- comparison operators
- A subquery can have only one column in the select statement.

Syntax : select column_name from table_name where
column_name operator 
(select column_name from table_name [where condition]);

select emp_name,emp_salary from employee
where emp_salary = (select emp_salary from employee where emp_name = 'RAVI');

-- USING DIFFERENT OPERATORS: IN
select emp_name,emp_salary from employee
where emp_salary IN (select emp_salary from employee where emp_name = 'RAVI');
*/

USE SAMPLE_DB;

SELECT * FROM employee_info;

-- Display name and salary of employee whose salary is greater than smith salary 

select empName,empSalary from employee_info where empSalary > (select empSalary from employee_info where empName = 'adam');


-- Display name,salary of employee whose salary is greater than adam salary and deptno same as adam deptno
select empName,empSalary from employee_info where 
empSalary > (select empSalary from employee_info where empName='adam') 
And deptid =(select deptid from employee_info where empName= 'adam');


-- Transaction-SQL is better to know SQL
-- STANDARD SQL : DML,OPERATORS,BUILT IN FUNCTIONS,SINGLE LINE QUERY
-- TSQL- STANDARD SQL ,BATCH SCRIPT,TRIGGERS,
-- WORKING WITH VARIABLE,USER DEFINED FUNCTION,
-- STORED PROCEDURE

-- WORKING WITH VARIABLE" 
/* DECLARE @variable_name datatype(size);
example : DECLARE @name varchar(50),@age int;

Assingn a value to a variable : Variable Assingnment
Both and set and select command can assing the value to a variable.
SET : can only set the value of one variable at a time 
SELECT : Command retriev data from tables and assingn multiple values with single statement
	SET @variable_name = value;
	SELECT @variable_name = value; @variable_name = value
	SET @salary = 30000;
	SELECT @name = 'pRAKAy' @age=21

-- Incrementing variable :
With the increment variable feature we can perform mathematical operations
(Like addition,subraction and multiplication) on the variable
SET @number += 10 

Complete Example : 
DECLARE @number INT = 100;
SET @number += 50;
SELECT @number;
*/
Declare @number int = 120;
SELECT @number *= 20; 
Select @number as 'multiplication';

  
Declare @name varchar(100),@age int,@salary int;
SELECT @name= 'Prakays',@age = 25,@salary = 42000; 
Select @name 'Name',@age 'Age',@salary 'salary';
  
use SAMPLE_DB;
select * from department_info;
---
Declare @id int, @departmentname varchar(100);
SELECT @id = deptID, @departmentname = deptname from department_info
SELECT @id ,@departmentname;
---
/* Script : In File -- > .sql ( extension)
 --- Batch : What is Batch?
A batch of sql statements in group of two or more SQL statements or single SQL statement 
batch statement can have : 
ddl,dml,dcl statement;
1. Explicit Batch : A explicit batch is two or more SQL statement separated by semicolons;
For example,
	2 Inserts commands;
2. Procedure: If a procedure contains more than one SQL statements. It is considered to be a batch.
*/
--
/* Go Command : For batch 
Go is not t sql statement;
it signals the end of the batch to the sql server utilities;
Syntax:
GO [count]
count : will decide how much time it will execute;
*/
-- example : Create two batches
USE SAMPLE_DB;
GO

Declare @name varchar(50);
SELECT @name = 'Apple';
SELECT @name as 'name';
GO

DECLARE @name varchar(10);
Select @name = 'ZYE';
SELECT @NAME as 'val';
GO

/* CONTROL FLOW : 
BEGIN END, IF ELSE ,WHILE
BREAK , CONTINUE , GOTO 
RETURN , TRY.. CATCH, THROW
WAIT FOR....
*/

/* Begin END:BEGIN...END ARE USED TO GROUP MULTIPLE LINES INTO ONE STATEMENT BLOCK.
BEGIN 
{SQL STATEMENT}
END

BEGIN 
	DECLARE @name varchar(40),@deptid varchar(50) ='D4';
	SELECT @name =emp_name from employee 
	where departmentID = @deptid;
	SELECT @name;
END

-- Example of Nesting BEGIN...END
 BEGIN 
	DECLARE @name varchar(40),@deptid varchar(50) ='D4';
	SELECT @name =emp_name from employee 
	where departmentID = @deptid;
	SELECT @name;
	BEGIN 
		PRINT 'DEPARTMENT ID :' + @deptid;
	END
 END
*/
SELECT * FROM employee_info;
GO

BEGIN
	DECLARE @name varchar(100),@salary integer,@deptid integer = 12;
	SELECT @name = empName,@salary = empSalary from employee_info where deptid = @deptid;
	SELECT @name,@salary;
	BEGIN
		PRINT @deptid;
	END
END
GO

/* IF ELSE : IT IS CONTROL FLOW STATEMENT THAT ALLOWS YOU TO EXECUTE OR SKIP A STATEMENT
IF CONDTION
BEGIN 
	{SQL STATEMENT}
END 

-- 1. IF EXAMPLE
EXAMPLE :
BEGIN
	DECLARE @salary Decimal;
	select @salary = avg(emp_salary) from employee;
	select @salary as 'Avg.Salary';
	if @salary > 25000
	BEGIN 
		PRINT "AVERAGE SALARY IS GREATER THAN 25000"
	END
END
-- 2. IF ELSE EXAMPLE
BEGIN 
	DECLARE @salary decimal;
	select @salary = avg(emp_salary) from employee;
	select @salary as 'Avg.salary';
	IF @salary > 25000
		BEGIN 
			PRINT 'SALARY IS GREATER THAN 25000';
		END 
	ELSE 
		BEGIN 
			PRINT 'SALARY IS LESS THAN 25000';
		END
END
*/
BEGIN
	DECLARE @salary Decimal;
	select @salary = avg(empSalary) from employee_info;
	select @salary as 'Avg.Salary';
	IF @salary > 85000
	BEGIN 
		PRINT 'AVERAGE SALARY IS GREATER THAN 25000'
	END
END


select * from employee_info;

-- IFELSE 
BEGIN 
	DECLARE @salary decimal;
	select @salary = avg(empsalary) from employee_info;
	select @salary as 'Avg.salary';
	IF @salary > 85000
		BEGIN 
			PRINT 'SALARY IS GREATER THAN 25000';
		END 
	ELSE 
		BEGIN 
			PRINT 'SALARY IS LESS THAN 25000';
		END
END
----
-- While : can be controlled with break and continue
/* Syntax :  WHILE Condition 
			 BEGIN 
				{}
			 END
EXAMPLE: 
BEGIN:
	WHILE (SELECT MIN(emp_salary) from employee) < 80000
	BEGIN 
		UPDATE employee set emp_salary = emp_salary + 1000;
		PRINT 'SALARY UPDATED';
	    IF (SELECT MIN(emp_salary) from employee) >= 80000
			PRINT 'MIN SALARY IS GREATER OR EQUAL TO 80000';
			BREAK;
    EMD
END
*/
USE sample_db;
GO

SELECT * FROM employee_info;
Go

BEGIN
	WHILE ( SELECT MIN(empSalary) from employee_info) < 90000
	BEGIN 
		UPDATE employee_info set empSalary += 10000;
		PRINT 'SALARY UPDATED'

		SELECT * FROM employee_info;

		IF(SELECT MIN(empSalary) from employee_info) >= 90000
		PRINT 'MIN SALARY IS GREATER OR EQUAL TO 80000';
		BREAK;
	END
END
---
-- TRY CATCH : ERROR HANDLING 
/* SYNTAX :
BEGIN TRY
	{SQL STATEMENT }
END TRY 
BEGIN CATCH 
	{SQL STATEMENT}
END CATCH 

TO RETRIVE THE INFORMATION ABOUT THE ERRROR 
ERROR MESSAGE(),ERROR Number(),ERROR_line(),error_procedure,error_state(),error_severity();

example: 
BEGIN TRY
	SELECT 10/0 AS 'DIVISION'
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS 'ERROR MESSAGE'
END CATCH

*/
BEGIN TRY
	SELECT 10/0 AS 'DIVISION'
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS 'ERROR MESSAGE',ERROR_LINE() AS 'ERROR LINE',
	ERROR_NUMBER() AS 'ERROR NUMBER',ERROR_PROCEDURE() AS 'ERROR PROCEDURE';

END CATCH
--
/* WAITFOR : block the execution of batch for particular time interval.
WAITFOR : Has two argument 
TIME :
DELAY :
Syntax : 
BEGIN
	WAITFOR TIME 'TIME_TO_EXECUTE'
	{SQL Statement or Statement Block}
END

TIME TO EXECUTE IS EITHER A DATETIME data or local variable data.

BEGIN
	WAITFOR TIME 'TIME_TO_PASS'
	{SQL Statement or Statement Block}
END
----
EXAMPLE: 
BEGIN 
	WAITFOR TIME '18:00:00'
	SELECT * FROM employee;
END
----
BEGIN 
	WAITFOR DELAY '00-00:10'
	SELECT * FROM employee;
END
---
*/
SELECT getdate() as 'current time';
go 
begin
	waitfor time '09:47:00'
	select * from Sample_db.dbo.employee_info;
end
go
select GETDATE() as 'current time';
go

---
SELECT getdate() as 'current time';
go 
begin
	waitfor delay '00:00:10'
	select * from Sample_db.dbo.employee_info;
end
go
select GETDATE() as 'current time';
go
---
-- You can also make a script for backup to..
--
/* 
STORED PROCEDURE : GROUP OF ONE OR MORE T-SQL STATEMENTS
IT CAN BE STORED IN THE DATABASE 
STORED PROCEDURE :
Accept input parameter and return multiple values
contain programming statement that perform operation in the data base
return a status value to a calling program to indicate succes or failure.

Benifits : REUSE OF CODE IN ANY ECOMMERCE BUISNESS,EASY TO MAINTAIN.
Types: 
System : Physically stored in the internal resource database.
User-Defined : It can created in a userdefined database.
Temporary: a form of user-defined procedure.temorary procedure are stored in tempdb.
*/

/* Stored Procedure : Two ways to create stored procedure.
1. Stored Procedure without Parameter(Simple Storage procedure)
2. Stored Procedure with Parameter .

1. 
Simple Procedure 
Syntax :
CREATE PROCEDURE procedure_name 
as 
BEGIN 
	{SQL statement}
END

CREATE Procedure pro_employeeDetails
as 
begin
	select * from employee;
end 
*/
use SAMPLE_DB;
go
CREATE PROCEDURE empdetails14
as 
BEGIN 
	SELECT * FROM Sample_db.dbo.employee_info;
END;
GO

execute empdetails14;
/* Parametrized Procedure : 
create procedure procedure_name(parameter list) 
as 
begin 
	{sql statement}
nd
*/
select * from department_info;
exec empdetails14;

CREATE PROCEDURE
proc_employeeDetailWise(@location as varchar(100))
as 
begin
	select * from sample_db.dbo.employee_info e inner join sample_db.dbo.department_info d on
	e.deptid = d.deptId
	WHERE d.deptLocation = @location;
end;
go

exec proc_employeeDetailWise @location = 'Sydney';
-- we can alter procedure 
 /* alter procedure procedure_name 
 as 
BEGIN 
	{}
END
*/
--- Simple procedure : Alter
USE [SAMPLE_DB]
go 

ALTER PROCEDURE [dbo].[empdetails14]
as 
BEGIN 
	SELECT e.empName,e.empSalary,d.deptname FROM Sample_db.dbo.employee_info e inner join SAMPLE_DB.dbo.department_info d on
	e.deptid = d.deptid;
END;

exec dbo.empdetails14;

-- Parameter : Alter

USE [SAMPLE_DB]
GO

GO
ALTER PROCEDURE
[dbo].[proc_employeeDetailWise](@location as varchar(100))
as 
begin
	select e.empName,e.empSalary,d.deptLocation,d.deptname from sample_db.dbo.employee_info e inner join sample_db.dbo.department_info d on
	e.deptid = d.deptId
	WHERE d.deptLocation = @location;
end;
exec proc_employeeDetailWise @location = 'Mumbai';

---
-- 2. System Procedure: 
-- exec sp_renam 'prev procedure renam','new name';
-- But it not worthy to use because of drawback 

/* UDF : USER DEFINE FUNCTION 
ARE ROUTINE OR PARAMETER PERFORM AN ACTION 
AND RETURN THE RESULT OF THAT ACTION AS A VALUE. THE RETURN VALUE CAN BE EITHER SINGLE SCALAR VALUE OR RESULT SET.

BENIFITS: MODULAR PROGRAMMING, FASTER EXECUTION, REDUCE NETWORK TRAFFIC!!
TYPES : 
SYSTEM :: SYSTEM FUNCTION FOR VARIETY OF OPERATION
SCALAR :: SCALAR FUNCTION RETURN A SINGLE DATA VALUE 
TABLE VALUED :: RETURN A TABLE DATA TYPE

SCALAR FUNCTION :
--POINTS TO REMEMBER 

--USER DEFINED FUNCTION ALWAYS RETURNED A VALUE 

--USER DEFINED FUNCTION HAS ONLY INPUT PARAMETER FOR IT 

--ERROR HANDLLING NOT SUPPORTED IN UDF

--SET  NOT ALLOWED IN USER DEFINED FUNCTION 

--USER DEFINED FUNCTION CANNOT CALLED PROCEDURE 
--BUT PROCEDURE CAN CALL FUNCTION

--32 LEVEL IF ELSE OR NESTING 

SCALAR FUNCTION SYNTAX:

CREATE FUNCTION function_name(paramater datatype....)
RETURNS return_datatype
WITH 
AS	
	BEGIN 
		FUNCTION BODY 
		RETURN SCALAR_EXPRESSION
	END;

CREATE A FUNCTION TO GET EMPLOYEE SALARY BY PASSING EMPLOYEE NAME 
CREATE FUNCTION SALARY(@name as varchar(60))
RETURN decimal
BEGIN 
	DECLARE @sal decimal;
	select @sal = emp_salary from employee
	where emp_name = @name 
	RETURN @sal 
END 
*/
USE SAMPLE_DB;
GO 

select * from employee_info;

CREATE FUNCTION salary(@name as varchar(60))
RETURNS decimal
BEGIN 
	DECLARE @sal decimal;
	select @sal = empSalary from sample_db.dbo.employee_info
	where empName = @name;
	RETURN @sal 
END;

select dbo.salary('Smith') as 'Salary of Person';

--- Table valued functions:
/* 
1. INLINE TABLE-VALUED FUNCTION 
THERE IS NO FUNCTION BODY (IF THERE IS NO NEED FOR BEGIN END BLOCK IN AN INLINE FUNCTION ) 
THE TABLE IS THE RESULT SET OF A SINGLE SELECT STATEMENT 
SYNTAX : 
CREATE FUNCTION functio_name(param,datatype)
RETURNS return_datatype 
AS 
RETURN STATEMENT
	QUERY 
	
CREATE FUNCTION TO GET EMPLOYEE INFORMATION BY PASSING EMPLOYEE SALARY 
CREATE FUNCTION getAllEmployees(@salary decimal) 
RETURNS TABLE // TABLE VALUED 
AS 
RETURN 
	SELECT * FROM EMPLOYEE WHERE emp_salary = @salary;
*/
USE SAMPLE_DB;
GO

CREATE FUNCTION getAllEmployees(@salary decimal)
RETURNS TABLE 
AS 
RETURN	
	SELECT * FROM Sample_db.dbo.employee_info 
	where empSalary = @salary;

SELECT * from dbo.getAllEmployees(92000);

/* 2. Multi-Statement table valued function 
It contain multiple SQL statement
enlosed in BEGIN-END blocks
The return variable is declared as
a table variable .
The return statement is without a value 
and the declared table.

Syntax : 
CREATE FUNCTION function_name(parameter datatype..)
RETURNS @table_variable Table
(column_1 datatype...)
AS
	BEGIN 
		SQL-statement 
		RETURN 
	END;

CREATE A FUNCTION TO GET LIST OF EMPLOYEE BY PASSSING THE DEPARTMENT ID ;
CREATE FUNCTION getallemp(@id varchar(40))
return @table Table 
(id int,Name varchar(50),Salary decimal,deptid varchar(50))
AS
BEGIN 
	INSERT INTO @table 
	SELECT * FROM EMPLOYEE WHERE emp_deptid = @id;
	RETURN 
END
*/

use SAMPLE_DB;
go
select * from employee_info;

CREATE FUNCTION informatiomemp(@id varchar(50))
returns @rslt Table 
(id int,Name varchar(50),Salary decimal,job varchar(40),phone varchar(100),depid varchar(50))
AS
BEGIN 
	INSERT INTO @rslt 
	SELECT * FROM employee_info WHERE deptid = @id;
	RETURN 
END

select  from informatiomemp('10');

---
use SAMPLE_DB;
select * from dbo.[getAllEmployees](92000)
--
/* 
A Trigger is a
type of stored procedure
that automatically run 
when an event occurs 
in the data base server.

Here, Events are DML operations(INSERT,UPDATE,DELETE)

1. DDL TRIGGER:
DDL TRIGGER IS FIRED WHEN DDL STATEMENT LIKE DROP TABLE ,CREATE TABLE ,OR ALTER TABLE OCCURS ,DDL ARE ALWAYS AFTER TRIGGERS.
2. DML : 
WE CAN CREATE TRIGGGER ON DML STATEMENT LIKE (INSERT UPDATE DELETE) AND stored procedure .
DML trigger are of three types:

1. after trigger:
these trigger executes after the action of the insert,update,merge or delete

2. instead of trigger:
these trigger overrides the standard action of triggering statement
IT can be used to perform error or value checking on one or more columns
these trigger perform additional action before insert updating or deleting the row or rows.


1. DML :
   1. AFTER TRIGGERS : 
   2. INSTEAD OF TRIGGERS
   3. CLR TRIGGERS

SYNTAX : 
CREATE TRIGGER trigger_name 
ON {table|view}
[with DML_triger_option]
{FOR|AFTER|INSTEAD OF}
{INSERT,UPDATE,DELETE}
AS
BEGIN 
	{SQL STATEMENT}
END

--- BEFORE CREATING 
MAGIC TABLE : 
INSERTED TABLE : BOTH TABLE WILL AFFECT OUR AND TRIGGER TABLE
DELETE TABLE : STORE THE COPIES OF AFFECT OUR AND TRIGGER TABLES

CREATE A TRIGGER WHEN NEW EMPLOYEE ADDED TO EMPLOYEE TABLLE;

CREATE TRIGGER tr_message 
on employee
after insert
as
BEGIN
	PRINT 'NEW EMPLOYEE ADDED TO THE EMPLOYEE TABLE'
END;
*/
USE SAMPLE_DB;
CREATE TRIGGER tr_message 
on employee_info
after insert
as
BEGIN
	PRINT 'NEW EMPLOYEE ADDED TO THE EMPLOYEE TABLE'
END;

select * from employee_info;
-- 2. Example 
create table employeeLogs
(id int,name varchar(255),salary decimal,deptid int,modifiedBy varchar(243),modifiedOn date);

use SAMPLE_DB;

create Trigger tr_employee_after_insert
on employee_info 
after insert 
as 
	BEGIN 
		INSERT INTO employeeLogs
		SELECT empID,empName,empSalary,deptid,'prakash',getdate()
		from inserted;
	END;

insert into employee_info values(6,'Neeraj',12000,'Support Associate',982731821,15);
select * from employeeLogs;

create Trigger tr_employee_after_update
on employee_info 
after update
as 
	BEGIN 
		INSERT INTO employeeLogs
		SELECT empID,empName,empSalary,deptid,'prakash',getdate()
		from inserted;
		PRINT 'UPDATED'
	END;


UPDATE employee_info set empSalary = 93000 where empID = 6;

select * from employee_info;
select * from employeeLogs;

--

create Trigger tr_employee_after_delete
on employee_info 
after DELETE
as 
	BEGIN 
		INSERT INTO employeeLogs
		SELECT empID,empName,empSalary,deptid,'prakash',getdate()
		from deleted;
	END;

delete from employee_info where empName='Smith';
--
create trigger tr_employee_allDMLOperations
on employee_info
AFTER INSERT,DELETE,UPDATE
AS
BEGIN 
    
	if exists(select * from inserted) and not exists(select * from deleted)
	-- Insert
	INSERT INTO employeeLogs
	select empID,empName,empSalary,deptid,'Prakash',GETDATE() from inserted
	
	else if exists(select * from inserted) and exists(select * from deleted)
	-- update
	INSERT INTO employeeLogs
	select empID,empName,empSalary,deptid,'Prakash',GETDATE() from deleted
	
	else if exists(select * from deleted) and not exists(select * from inserted)
	-- delete
	INSERT INTO employeeLogs
	select empID,empName,empSalary,deptid,'Prakash',GETDATE() from deleted
	else
		begin
			print 'NOTHING CHANGED'
			return
		end
END

---
select * from employee_info;
select * from employeeLogs;
insert into employee_info values(3,'Smith',23090,'fresher',927327327,11);

update employee_info set empSalary = 18500 where empName = 'smith';

delete from employee_info where empName = 'smith';
