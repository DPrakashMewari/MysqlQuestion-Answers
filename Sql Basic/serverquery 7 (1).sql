-- SELECT:IDENTITY WILL AUTO INCREMENT , INSERT UPDATE DELETE 
-- ALTER ,
-- AGGREGATION FUNCTION -MIN,MAX,SUM,AVG
/* STRING FUNCTION :- CHARINDEX,SUBSTRING,LEN,LEFT,RIGHT
DATE FUNCTION,
ORDER BY 0
GROUP BY 
HAVING 
JOIN -- INNER,LEFT,RIGHT,SELF JOIN
SUBQUERY,CORRELATED SUBQUERY

WINDOWS FUNCTION : ROW_NUMBER ,OVER , GROUP BY OR PARTITION BY,RANK,DENSERANK

SET OPERATORS : UNION,UNION ALL,INTERSECT,EXCEPT
SCHEMA MAKING
INDEXING : CLUSTER,NON-CLUSTER INDEX

CTE,recursive 

DISTINCT
TOP
MERGE
COPY ONE TABLE TO ANOTHER 
INSERT ONE TABLE TO ANOTHER
CAST
PIVOT
---
PLSQL 
VARIABLE ASSINGMENT
DECLARE SET ,PRINT 
DECISON MAKING : USING IF ELSE 
LOOPING : WHILE LOOP
TRANSACTION,EXECPTION HANDLING
PROCEDURE : PARAMETERIZED ,NON PARAMETERIZED , YOU CAN CALL IT BY REFERENCE TOO
TRIGGER : ARE SPECIAL KIND OF PROCEDURE IT IS LIKE A DAEMON TYPE , WE CAN PERFORM ALL DDL,DML ; AFTER INSERT, AFTER UPDATE,AFTER DELETE
CURSOR : IT IS A DATABASE OBJECT THAT IS USED TO RETRIVE DATA FROM RESULT SET A ONE ROW AT A TIME, IT IS WHEN WE USED UPDATE THE DATA ROW BY ROW 
FUNCTION : SCALAR FUNCTION , INLINE FUNCTION
*/

--- Date function 
select current_timestamp as 'our current time'
select dateadd(month,1,'2021/11/29') as  'Date add'
select datediff(month,'2021/11/29','2021/12/29')
select datename(dw,current_timestamp) -- give want we want


with cte_month(n,month)
as 
(select 0,dateadd(month,0,'2021/11/29')
union all
select n+1,dateadd(month,n+1,'2021/11/29') from cte_month where n < 12)
select month from cte_month
--- String function 
select char(65) as codetochar
select CHARINDEX('p','Prakash')
select concat('PRAKASH','Y','SH')
SELECT CONCAT_WS('@','ram','sita')
select DATALENGTH('Prakash')
select LEN('Prakash')
select left('Prakash',4)
select right('Prakash',4)
select RTRIM('Prakash    ')
select LTRIM('      Prakash')
select substring('Name from person',3,12)
select substring('Prakash tiwari',charindex(' ','Prakash tiwari')+1,len('Prakash Tiwari'))
---
-- Advanced Function : 
-- CAST FUNCTION 
USE SAMPLE_DB1
SELECT CAST(1.43 AS decimal(2,1)) 
SELECT CAST(datename(w,current_timestamp) as varchar(100)) as 'Current Week'
SELECT COALESCE(NULL, 1, 2, 'Prakas'); -- first non null function 
SELECT CURRENT_USER
select salary,iif(salary > 5000,'GREATER THAN 5000','LESS THAN 5000') as 'salary comparison' FROM emp1
-----
-- Aggregation Function
-- We need to find maximum length of name of people
select max(len(c_name)) as length,city from customer group by city having max(len(c_name)) >= 5 order by length desc
select c_name,min(len(c_name)) as length from customer group by c_name having min(len(c_name)) >= 5 order by length 
select * from customer;
select count(*) as 'count' from customer 
select avg(salary) from emp1

select
	city,
	sum(len(c_name)) as 'sum of length', 
	avg(len(c_name)) as 'avg length',
	count(len(c_name)) as 'count of length',
	min(len(c_name)) as 'min of length',
	max(len(c_name)) as 'max of length'
from customer
group by city
order by city desc
select * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME = 'salary'

SELECT ename,max(len(e.ename)) as 'max len',dname,min(len(d.dname)) as 'min len' FROM EMP e
inner join dept d on e.dno = d.dno group by e.ename,d.dname having max(len(e.ename)) >=6 or min(len(d.dname)) >= 1 order by ename,dname

SELECT ename,max(len(e.ename)) as 'max len',dname,min(len(d.dname)) as 'min len' FROM EMP e
right join dept d on e.dno = d.dno group by e.ename,d.dname having max(len(e.ename)) >=6 or min(len(d.dname)) >= 1 order by ename,dname

SELECT ename,max(len(e.ename)) as 'max len',dname,min(len(d.dname)) as 'min len' FROM EMP e
left join dept d on e.dno = d.dno group by e.ename,d.dname having max(len(e.ename)) >=6 or min(len(d.dname)) >= 1 order by ename,dname


select * from employee

select d1.ename as dept1 ,d2.ename as dept2 from employee d1 join employee d2 on d2.mgrid = d1.eno

select * from customer

select * from customer where city in (select city from customer where city= 'New York')
use sample_db1
select * from employees

select first_name,last_name from employees where  salary > (select employee_id from employees where employee_id = 101)

select * from production.products

select product_name,list_price,category_id 
from 
production.products p1 
where list_price in
(select max(p2.list_price) from production.products p2 where
p2.product_id = p1.category_id group by p2.category_id) 
order by category_id,product_name;

-- window function : using aggregation
select * from production.products;
select *,sum(list_price) over (partition by model_year) as grandprice from production.products
select *,avg(list_price) over (partition by product_name,model_year) as avg_price from production.products
select count(distinct product_name) as 'Number of unique product' from production.products group by product_name
select *,count(product_name) over (partition by model_year) as uniquerecord from production.products 
-- ranking window function 
select product_name,model_year,rank() over (order by model_year) from production.products
select product_name,model_year,dense_rank() over (order by model_year) from production.products
select *,ROW_NUMBER() over (partition by product_name) as rankno from production.products
select *,ROW_NUMBER() over (order by product_name) as rankno from production.products

use sample_db1
select eno,ename,dno from emp
union 
select eno,ename,dno from emp1

select eno,ename,dno from emp
intersect 
select eno,ename,dno from emp1

select eno,ename,dno from emp
except
select eno,ename,dno from emp1

--
use sample_db1
select * from production.products

select * from emp1
create clustered index d_idx on emp1(dno)
select * from emp1 where dno=3

select * from emp1;
select * from dept

with cte_emp (dept,emp1) as 
(
select 
	ename + ' ' + dname,sum(salary) 
	from emp1 e1 
	inner join 
	dept e2 on e2.dno = e1.dno
	group by 
	ename + ' ' +dname
)
select dept as departmentmember,emp1 as salary from cte_emp
--- Recursive CTE 
WITH cte_number(n,weekday)
as 
(select 0,datename(dw,0)
union all
select n+1,datename(dw,n+1) from cte_number where n< 6) 
select weekday from cte_number

use sample_db1

select * from emp1
select * from dept

with rec_cte 
as 
(select ename,salary,dno from emp1 where ename is not null
union all 
select e.ename,e.salary,e.dno from emp1  as e inner join rec_cte as o
on e.eno = o.dno)
select * from rec_cte

----- merge 
select * from sales.category 
select * from sales.category_staging 

merge sales.category t
using sales.category_staging s
on (s.category_id = t.category_id)
WHEN matched
	then update set 
	t.category_name = s.category_name,
	t.amount = s.amount
WHEN not matched 
	then insert (category_id,category_name,amount)
	values(s.category_id,s.category_name,s.amount)
when not matched by source 
	then delete;

SELECT * FROM sales.category_staging

-- DISTINCT TOP
select distinct top(3) category_name from sales.category_staging
-- COPY ONE TABLE TO ANOTHER TABLE
create table orignal(id int,name varchar(100))
insert into orignal values(1,'Prakash')
select * into dummy from orignal
truncate table orignal
insert into orignal select id,name from dummy
-- CAST
SELECT CAST(12.33 AS VARCHAR(100))





