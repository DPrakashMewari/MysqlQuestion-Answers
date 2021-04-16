# 3. 
# Difference Between 
# Group by vs Order by
# Join vs Subquery
# Join vs Union

# Order by : Sorting  
# asc or desc 
select * from  emp order by empno ,deptno desc;
# Group by :
# USED with aggregate function
select job,count(*) from emp group by job;
# It will group them
# NOTE:
# Group by follows where clause in select statements.
# Where cannot be used after group by
# Having is used after group by 



# Join vs Subquery:
# Both are used to combine data from differenct tables into single result 
# Subquery    ------  # Join
# Subquery : 
Select phase,cust_name from customers where custid in(select custid from orders);
# Can select only from first table 
# It is slower 
# Join :
Select phone,address,orderid from customers as c join orders as o on c.custid  = o.custid;
# Can select from either of the table means any of column you can select from both tables
# It is faster


# Join vs Union:
# Union 
# Combine rows : 
# Not Neccasary to have same column name 
# But no. of columns & data type of columns should be same 
# It will increase vertically
select city from table1 union select name from table2;
# Join
# Merges columns
# Combines rows from 2 or more tables based on a related common columns btw them
select a.city,b.name from table1 as a join table2 as b  on a.id = b.custid;
# it will increase horiontally