# 3.
# Difference Between 
# 1. Where vs Having
# 2. Union vs union all
# 3.  In vs Exist

# 1. Where & Having 
# where  : Works for filtered data 
#  Not an aggregated data 
select * from emp where empno = 7369;

# 2. Having 
# Works on aggregated data 
# Aggregation functions : used to perform calculation on multiple rows 
# of a single columns
# It return a single values
# It is to summarise data 
# Count,Min,Max
# AVG,SUM,MAX,MIN,COUNT
# Having use with group by
select max(sal) from emp group by empno having empno > 7000;

# 2. UNION VS UNION ALL 
# Union - removes duplicates records 
# Union all - Does not removes duplicates records
# Let suppose we have two data data 
# Customers data which contains Custid,Address,Contact;
# Suppliers data which contains Suppid,SupAddress,Contact;
# Query 
Select * from Customers union select * from suppliers;
select * from Customers union all select * from suppliers;
# Some Condition before applying it?
# Each select statement must have 
# Columns must have similar data type
# Columns must be in same order;

# 3. IN VS EXISTS
# IN 
# Multiple or 
Select * from Customers where city = "Mumbai" or City ="Banglore" or City = "Chennai";
# we can replace it with by 
Select * from Customers where city in (Mumbai,Banglaru, Chennai);
# Exists 
# Return Eithere  True or False 
select * from Customers where 
exists 
(select city from table2 where table2.id = Customers.id);
# NOTE : 
# In : Big outer query and small inner query here.
# Exists : Small outer query and big inner query .
# In : Compare one value to sevral value
# Exist : Tells you whethere a query returned any results.

