/* Microsoft sql server learning  - 1
-- CREATE DATABASE SAMPLE_DB;
-- USE SAMPLE_DB
/*--CREATE TABLE employee_info
(    empID integer primary key, 
	 empName varchar(20) not null,
	 empSalary  Decimal(10,2) not null,
	 job varchar(20),
	 phone int unique,
	 deptid integer not null
)*/

/*create table department_info 
(
	deptId integer not null,
	deptname varchar(20) not null,
	deptLocation varchar(50)
)
*/

-- exec sp_columns department_info;


-- Insert into dbo.employee_info values (01,'adam',25000,'developer','956656568',10)
-- select TOP(100) empid,empName,empSalary,job,phone,deptId from SAMPLE_DB.dbo.employee_info;
-- INSERT INTO SAMPLE_DB.dbo.employee_info (empId,empName,empSalary,deptID) values (02,'Smith',38000,11);


/* DML : Select [Used to retrieve data or information from the table]
Select * /columnname,functionname from table_name 
where condition
grouby condition 
having condition 
order by column_name;

select * from employee_info;
-- for see particular column 
select empName,empSalary from employee_info;*/
--select * from dbo.employee_info;
--select empName,empSalary from employee_info;

/* UPDATE : USED TO UPDATE/MODIFY EXISTING TABLE DATA/INFORMATION
UPDATE table_name 
set column_name = column_value 
where condition 
ex:
Update employee_info SET empSalary = empSalary + 1000;
Update employee_info SET job = 'Fresher' where empName = "Smith"*/
-- update dbo.employee_info set job = 'Fresher' where empName = 'Smith';

--update dbo.employee_info set empsalary  = empsalary + 100;
/*UPDATE employee_info
set phone = 958953268
where deptid = 11;*/
-- DELETE : USED TO DELTE ON OR MORE RECORD
-- DELETE FROM EMPLOYEE_INFO;
-- Delete FROM EMPLOYEE_INFO WHERE DEPT = 1 

-- ORDER BY : USED TO SORT // ARRANGE
--INSERT INTO SAMPLE_DB.dbo.employee_info values (03,'Smith',38000,'architecture',956565651,12),(04,'Ays',42000,'Data Specialist',958982321,13);
-- select * from SAMPLE_DB.dbo.employee_info order by empSalary desc;

-- select empName,empSalary from employee_info where job = 'Data Specialist';

/* Aggregate function 
sum(),avg(),min(),max()*/
-- select avg(empSalary) as  empsalay from SAMPLE_DB.dbo.employee_info;
-- select count(*) from SAMPLE_DB.dbo.Employee_info;

/* Numeric Function :  ABS() : Postive value consider,ceiling,floor,sign: return postive,negative value*/
--  square,sqrt,pi,cos,sin,tan,exp: Exp

-- Select len(empName) from SAMPLE_DB.dbo.employee_info;
--select upper('this is ');
--select lower('THIS ');

/*SELECT LTRIM('    anystring'),RTRIM('anystring 2');

SELECT SUBSTRING('Prakash',2,5);
SELECT REPLACE('MICROSOFT','SOFT','LOFT');
SELECT REPLICATE('Dummy',5);
*/








