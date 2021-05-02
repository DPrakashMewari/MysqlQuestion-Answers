#1. Write a query to find the third highest salary from the employee
select * from employee order by salary desc limit 2,1;
#Limit function will tell us : if limit 1,1 select one row after first row  ie 2 nd highest;

#2. Write a query to find the N th highest salary from the table without using top/limit keyword?
select salary from employee as e1 where 3-1 = 
(select count(distinct salary) from employee as e2  where e2.salary > e1.salary);

#3. Write a Sql queries to find a duplicate rows in a table ?
select *,count(id) from employee group by id;

# if you apply some condition > 1 or greater then
select *,count(id) from employee group by id having count(id) > 1;

#4. Write a query to calculate even and odd records from a table?
select * from employee where MOD(id,2)=0;
select * from employee where mod(id,2)=1;

#5. Query to find first and last record from the table?
select * from employee where id = (select min(id) from employee);
select * from employee where id = (select max(id) from employee);

#6. How do you copy all rows of a table using sql query ?
create table emp1 as select * from employee;
# if you want to copy only structure 
create table emp2 as select * from employee where 3 = 4; # 3 = 4 conditon is false so it return

#7.Retrive the list of employee working in the same department;
select distinct e.id,e.name,e.dept from employee as e, employee as e1 where e.dept = e1.dept and e.id != e1.id;

#8.Write a Query to retrive last 3 records from the employe table
> select * from( select *from employee
    -> order by id desc limit 3)
    -> temp order by id asc;
+-----+-------+------------+---
#9. Write a query to fetch details from employees whose emplname end with an alphabet 
#'a' and contains five alphabets.
select * from employee where name like "%a";
