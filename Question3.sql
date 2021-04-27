#How you remove Null value from table ?
delete from Bonus where Worker_ref_id = " " OR Worker_ref_id is Null;

#How can you add and remove any column of a table?
ALTER TABLE products ADD COLUMN price int;

# For dropping particular columns
alter table bonus  drop column price;

# What is index ? How index can be declared ?
# Index is a data structure of mysql table that is used to speed up queries.
# It is used by the database search engine to find out the record faster 
# Index can defined when creating a new table.
create table users(username varchar(44) primary key,
    -> email varchar(40) not null,
    -> password varchar(30) not null,
    -> index(username,email));

# to see index;
show index from users;

# what is meant by a decimal(5,2)?
# A decimal data type is used in mysql to store the fractional data.
# Example 4232.223

insert into product values(343.412);

# What is the view ? How you can create and drop view in mysql ?
# A view work as a virtual table
# it is used store query and return a result set when it is called .

CREATE VIEW `client_list` AS SELECT `name` as 'Name', `membership` as 'Membership' FROM `clients`;

SELECT * from client_list;

# Drop that view 
SELECT * from client_list;

# What is Mysql Dump ?
# Mysql dump is a userful utility tool of mysql that is used to dump one or more or all databases from the server 
# for backup or transfer to another database server.
mysqldump -u root -p testdb > D:\Database_backup\testdb.sql  

