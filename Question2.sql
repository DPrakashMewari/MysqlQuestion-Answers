# What are the differences
# bw char and varchar data types?

# Char is used to store small data whereas varchar is used to store large data
create table customers(id int , name varchar(49) ,gender char(1));

# What is the purpose of using the timestamp data type ?
# A timestamp data type is used to store the combination of date and time value which is 19 character long.
## YYYY-MM-DD HH:MM: SS


# How can you filter the duplicate data while retrieving records from the table?
# Distinct key word is used to filter the duplicate data from the table.
select distinct model from items;

# What is Difference between Now / Current date?
select now()
# 19 character long op
select current_date();
# current date


# Which statement is used in a select query for partial matching ?

# Regex an like statement can be used in a select query for partial matching.

select * from clients where name Regex "^S";

select * from client where name like "A%";

# Which sql function is used to concatenate string ?
#concat() function is used to combine two or more string data. 
mysql> select concat(Bonus_Amount," $ ",Bonus_Date) from Bonus;


#How can you change the name of any existing table by using the SQL statement?

RENAME table Bonus to Bonus_new;


#How can you retrieve a portion of any column value by using a SELECT query?
select substr(Bonus_Date,1,11) from Bonus;

