# Question 1 :
# Finding Highest salary through our emp Datasets;
# 3 Function to find
# MAX 
# LIMIT 
# TOP

# Using max only
select max(sal) from emp where sal < (select max(sal) from emp);

# using limit
select sal from (select sal from emp order by sal desc limit 2) as emp order by sal limit 1;

# Top  ! top is not working in mysql 
#select Top 1 sal from ( select top 2 sal from emp order by salary desc) as emp order by asc;


# Question 2 :
# Keys in DBMS ( In Short )
#1
# Super key : Super set of cadidate key 
# It is set of attribute that can uniquely identify each record 
# Super key contain -- Stud-id ,name
# Note : { It may contain extrac attributes }

#2.
# Candidate key : Minimal set of super key
# example : {Studid , phone}
# There can be more than one candidate key 
# Candidate key can never be be null or empty and its value should be unique

# 3.
# Primary key : Most appropriate Candidate Key
# Not null , unique
# pk = studid

# 4.
# Foreign key : Primary key in another table

# 5. 
# Composite keys : 2 or more attributes that uniquely identify any record 
# in a table 
#  {studid,subjid}
# Both will together form the primary key 
# The attributes which together form the composite key are not a key independently

# 6.
# Secondary / Alternate keys:
# Keys not selected as pk are secondary keys..





