# Select * 
select * from family_members;

# Select with one few columns
#Can you return just the name and species columns?
select name,species from family_members;

# Select with where 
SELECT * FROM family_members WHERE species = 'dog';


# Using greater then operator 
# Can you run return all rows of family members whose num_books_read is greater than 190?
SELECT * FROM family_members WHERE num_books_read > 190;


# Using Greater then or equal ?
SELECT * FROM family_members WHERE num_books_read >= 180;


# Using And Operation ?
SELECT * FROM friends_of_pickles WHERE  species = 'dog' and height_cm  <=  '45';


# Using or ?
SELECT * FROM friends_of_pickles WHERE height_cm < 45 OR species = 'dog';

# Using in ,Not in ?
SELECT * FROM friends_of_pickles WHERE species NOT IN ('cat', 'dog');
-----
SELECT * FROM friends_of_pickles WHERE species IN ('cat', 'human');


# Using Distinct 
# Can you return a list of the distinct species of animals greater than 50cm in height?
select distinct species from friends_of_pickles
where height_cm > 50;


# Using Order by ?
#Can you run a query that sorts the friends_of_pickles by height_cm in descending order?
SELECT * FROM friends_of_pickles ORDER BY height_cm desc;


# Using limit ;
# Can you return the single row (and all columns) of the tallest friends_of_pickles?
SELECT * FROM friends_of_pickles ORDER BY height_cm  desc LIMIT 1;
 
# Count (*) : To get total no of rows ?
SELECT COUNT(*) FROM friends_of_pickles;

# Count with where 
SELECT COUNT(*) FROM friends_of_pickles WHERE species = 'dog';

# Sum 
SELECT SUM(num_books_read) FROM family_members;

# Average:
# Can you find the average num_books_read made by each family member?
SELECT AVG(num_books_read) FROM family_members;

# Using Max and  Min 
SELECT MIN(num_legs) FROM family_members;

select max(num_books_read) from family_members;

# Group by : ( Using Aggregate function)
select count(*),species from friendsofpickle group by species;

# Nested Queries:
# Can you return the family members that have the highest num_books_read?
select * from family_members where num_books_read = (select max(num_books_read) from family_members);

# Null or Not Null
select * from family_members where favorite_book is not Null;
select * from family_members where favorite_book is Null;

# Using Date Format:
#Can you return a list of celebrities that were born after September 1st, 1980?
select * from celebs_born where birthdate  >= '1980-08-17';


# Inner join 
select character.name,character_actor.actor_name from character inner join character_actor on character.id = character_actor.character_id;

