# Most Frequent SQL Interview question

# What is mysql ?
# Mysql is an open source dbms which devloped and distributed by a oracle corp.

# What are the features of mysql?
# It is reliable and easy to use too.
# It is suitable database software for both large small application 

# What is default port in my-sql?
# The default port number of mysql is 3306


# How can you Find out the version of mysql?
show variables like "%version%";

# Advantages and disadvantages of using mysql ?

Adv.
---> It can handles million of queries with a high speed transactional process.
-> Maintaince and debugging process are easier for this software .

Disadvantages:

It is hard to make sql scalable 
It is not suitable for a large type of databases;

# What are the function of myisamchk?
myisamchk is a useful database utility tool that is used to get information about myisam database table.
For 
Checking 
Debugging 
reparing and optimising databases.

# What are the purpose of enum and set data types ?

Enum data tyes is used in the mysql database table to select any one value from the predifiend list

we cant choose any other value rather then that value.

Set data types is used to select one or more or all value like enum 

# What is the difference b/w 
primary key and foreign keys ?

A database table uses a primary key to identify each row uniquely.
One or more field of a table can be declared as the primary key.

When the Primary key of any table is used in another table as the primary key or another feild for making databases relation then it is called a foreign key.

CREATE TABLE manufacturers (
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(50));

create table items( id int auto_increment primary key,name varchar(50), type varchar(50),brand varchar(50),manufactures_id int,foreign key(id) references manufactures(id));



