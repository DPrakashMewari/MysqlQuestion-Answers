#25 SQL Query Questions and Answers for Practice.!

#1.Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select FIRST_NAME AS Worker_Name from Worker;

#2.Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select Upper(FIRST_NAME) AS Worker_Name from Worker;

#3.Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select Distinct(Department) from Worker;


#Q-4. Write an SQL query to print the first 4 characters of  FIRST_NAME from Worker table.
select substring(First_name,1,4) from Worker;

# Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
SELECT INSTR(FIRST_NAME,BINARY"a") from Worker where First_name = 'Amitabh';

#  Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
Select RSTRIM(FIRST_NAME) from Worker;

#  Write an SQL query to print the Department from Worker table after removing white spaces from the left side.
Select LSTRIM(Department) from Worker;

# Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
Select Replace(FIRST_NAME,'a','A') from Worker;

# Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
select concat(FIRST_NAME,Last_Name) from Worker;

# Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from Worker Order by First_name asc;

# Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from Worker order by First_name asc , Department desc;

# Write an SQL query to print
# details for Workers with the 
#first name as “Vipul” and “Satish” 
#from Worker table.
select * from Worker where First_name in ("Vipul","Satish");

# Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from Worker where First_name not in ("Vipul","Satish");

# Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
Select * from Worker where Department like "Admin%";

# Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
Select * from Worker where FIRST_NAME like '%a%';

# Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
Select * from Worker where FIRST_NAME like '%a';

# Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
Select * from Worker where FIRST_NAME like '_____h';

# Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from Worker Where SALARY  between 100000 and 500000;

# Write an SQL query to print details of the Workers who have joined in Feb’2014.
Select * from Worker where year(joining_date) = 2014 and month(joining_date) = 2;

# Write an SQL query to fetch the count of employees working in the department ‘Admin’.
Select count(*) from Worker where Department = 'Admin';

# Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select concat(First_name," ",Last_name) as Worker_Name,Salary from Worker where Salary >= 50000 

# Write an SQL query to fetch the no. of workers for each department in the descending order.
 Select count(Worker_ID),Department from Worker group by Department order by Department desc;

# Write an SQL query to print details of the Workers who are also Managers.
select First_name,Worker_Title from Worker inner join Title on Worker.Worker_ID = Title.Worker_REF_ID and Title.Worker_Title in ("Manager");

# Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select Worker_Title, AFFECTED_FROM ,COUNT(*) FROM Title GROUP BY WORKER_TITLE,AFFECTED_FROM HAVING COUNT(*) > 1;


# Concat
# count
# Distinct
# Wildcards
# Having 
# order by 
# group by 
# in 
# between
# Simple - inner join
# Replace 
# lstrim
# rstrim 
# Upper case
# Instr  : Find a position