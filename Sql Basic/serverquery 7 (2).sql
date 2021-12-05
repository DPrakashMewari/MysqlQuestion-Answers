--- Variable Declaration 
DECLARE @a int,@b int 
set @a = 12 
set @b = 1200
print @a * @b
print @b / @a
print @a - @b
print @a % @b

-- IF ELSE 
DECLARE @marks int 
SET @marks = 29
if @marks > 85
	BEGIN
		PRINT 'Excellent'
	END
ELSE IF @marks >= 75
	BEGIN 
		PRINT 'Good'
	END
ELSE	
	BEGIN 
		PRINT 'POOR'
	END
-- While loop 
Declare @stud_value int 
set @stud_value = 1
while @stud_value <= 6
begin 
	print 'Prakash'
	set @stud_value += 1
end
print 'mewari'

-- Inserting record using while loop 
CREATE TABLE bikeshop  
(  
 Id INT PRIMARY KEY IDENTITY,  
 bike_name VARCHAR (50) NOT NULL,  
 price FLOAT  
)  

declare @count int 
set @count = 1
while @count <= 6
begin 
	insert into bikeshop values('BIKE- '+cast(@count as varchar(100)) , @count*1200)
	set @count += 1
end
print 'Successfully r'
SELECT * FROM bikeshop

declare @num int,@count int 
set @num = 12
set @count = 1
while @count <= 10 
begin
	print cast(@num as varchar) + '*' + cast(@count as varchar) + '=' + cast(@num*@count as varchar)
	set @count += 1
end
-- try catch and transaction
use prakash
drop table trasaction
create table trasaction(id int,name varchar(100))
insert into trasaction values(1,'Item 1 Saled')
insert into trasaction values(2,'Item 2 Saled')
select * from trasaction

begin try 
	begin transaction 
	insert into trasaction values(3,'Item 4 saled')
	update trasaction set name= 'No sale' where id = 'sdsd'
	commit transaction
end try 
begin catch 
	rollback transaction 
end catch
-- Procedure 
use prakash
create table student(student_id int primary key,
					student_name varchar(100),
					marks int)
create table teacher(teacher_id int primary key,
					 teacher_name varchar(100),
					 student_id int
					 foreign key (student_id) 
					 references student(student_id))

create procedure student_teacher_insert(
								@student_id int = 0, 
								@student_name varchar(100) = null,
								@marks int = 0, 
								@teacher_id int = 0,
								@teacher_name varchar(100) =null)
as
insert into dbo.student values(@student_id,@student_name,@marks)
insert into dbo.teacher values(@teacher_id,@teacher_name,@student_id)

exec student_teacher_insert @student_id=11,@student_name='Prakash',@marks=100,@teacher_id=101,@teacher_name='Rekha'
---
-- Trigger : 
/* 
A trigger is a special 
kind of stored procedure-one
that cannot be executed
explicitly, instead 
of attached to an event. 
Whenever the event takes place,
the trigger fires
and the trigger's code runs. 

1. DML Trigger 
2. DDL Trigger 

DML : 
 AFTER TRIGGER
 INSTEAD OF TRIGGER 
*/
use prakash

select * from prakash.INFORMATION_SCHEMA.TABLES

select * from emp_details

create trigger trg_emp_not_delete
on emp_details
INSTEAD OF DELETE 
AS 
BEGIN
print 'Dont have right to delete'
END

delete from emp_details where emp_id =1
---  Creating a Trigger for dropping the table 

CREATE TABLE [dbo].[test_table]
(
 [ID] [int] NULL,
 [Name] [varchar](50) NULL
) 

create TRIGGER trg_create
ON 
DATABASE
FOR DROP_TABLE
AS
BEGIN
Print 'Table dropped from test_database'
END
drop table test_table

--- AFTER INSERT
CREATE TRIGGER trigger_insert
ON emp_details
AFTER INSERT
AS
BEGIN 
SELECT * from inserted
END

select * from emp_details
insert into emp_details values('Aysh',3,4999,372894738,4,3,4,5)
--- Update
CREATE TRIGGER trigger_update
ON emp_details
FOR UPDATE
AS
BEGIN 
SELECT * from inserted
SELECT * from deleted
END
select * from emp_details
update emp_details set revenue=33 where emp_id = 2
-- Cursor : 
/* allows us to retrive each rows at a time and manipulate its data.
1. DECLARE CURSOR 
2. OPEN CURSOR 
3. FETCH CURSOR
   FETCH NEXT FROM CURSOR INTO variable_list
   While condition 
	FETCH FROM CURSOR NAME
4. CLOSE CURSOR 
5. DEALLOCATE CURSOR 
*/ 
USE sample_db1
select * from customer

declare @id int
,@c_name varchar(100),@email varchar(20),@city varchar(40)

declare @counter int = 1 

declare printcustomer1 cursor
for 
select id,c_name,email,city from customer

open printcustomer1

fetch next from printcustomer1 into 
@id,@c_name,@email,@city


while @@FETCH_STATUS = 0
BEGIN 
	IF @COUNTER = 1
	BEGIN
		print 'ID ' + ' c_name ' + ' email ' + ' city '
		print ' -------- '
	END
	print cast(@id as nvarchar(10)) + ' ' + @c_name + ' ' + @email + ' ' + @city
	set @counter +=1 
	
	fetch next from printcustomer1 into
	@id,@c_name,@email,@city 

close printcustomer1

deallocate printcustomer1



------
-- SCALAR FUNCTION
create function sum_addition(@num1 int,@num2 int)
returns dec(10,2)
as
begin 
return @num1 + @num2
end

select dbo.sum_addition(1,2) as net_sum;


CREATE FUNCTION fud_customer()
returns table
as 
return (select * from customer)
-----


