-- Views : 
use Prakash;

select * from emp_details;
select * from Person;

create OR alter view details
as 
select p.name,e.project_completed,p.Gender,p.Age,p.Marks from 
emp_details as e inner join Person as p on e.emp_id = p.ID;

select * from details;

--- Union all: All records include duplicates too
--- Union : Only unique records
use Prakash;

select name from emp_details
union all
select name from person;

-- Intersect : TAKE ONLY COMMON DATA 
select name from emp_details
intersect
select name from Person;

-- Like operators :
select * from emp_details where name like 'Pr[ae]k%';

use SAMPLE_DB;
select * from employee_info;
select * from employeeLogs;

-- Exist : 
select * from employee_info
Where exists
(select * from employeeLogs 
where employeeLogs.salary = employee_info.empSalary 
or employee_info.empName = employeeLogs.name);

-- Distinct: 
select Distinct name from employeeLogs;

--- CTE : Common table expression 

with productdetails 
as (select * from ProductQty where Product = 'Computer')
select region,product,year,quantity from productdetails;

--- SERVER ROW NUMBER 
select * from ProductQty;

select *,ROW_NUMBER() over (order by quantity) as 'Row num' from ProductQty;