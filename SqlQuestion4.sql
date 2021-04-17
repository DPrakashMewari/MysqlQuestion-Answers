# What is Case Expression ?
#My sql case expression is a type of control flow expression it is same as if else elif logic to query.
# Query   
    select job,ename,
    -> CASE job
    -> WHEN 'CLERK' THEN 'clerk'
    -> WHEN 'SALESMAN' THEN 'Salesperson'
    -> WHEN 'ANALYST' THEN 'ANALYSIS'
    -> ELSE 'OTHER'
    -> END AS jobtype from emp;

# How to create Stored Procedure in Mysql ?

# A stored procedure is group of sql statement that we save in the data bases
# It stores in the data dictionery

DELIMITER &&
Create Procedure get_student_info()
Begin
select * from student table;
End &&
DELIMITER;

# For executing 
CALL get_student_info();



