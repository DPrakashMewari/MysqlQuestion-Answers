
# Please provide data about all books published in 2010. Required attributes are Title and Isbn.

select Title ,Isbn from Book where Publication_year = 2010;


# Please provide data about all employees whose last name contains the substring ki. Data about all attributes are required.

SELECT *   
FROM Employee
WHERE  Last_name like "%ki%"; 

# Please provide data about all books whose title either contains the word HTML or Web. Data about all attributes are required.

SELECT  * 
FROM Book
WHERE Title like "%HTML%" or Title like "%Web%";

# Please provide data about all employees whose salary ranges from 40000 to 70000 inclusive. Data about all attributes are required.

SELECT *  
FROM Employee 
WHERE Salary >= 40000 and Salary <= 70000;


#Please provide data about all books whose title contains the word Head and published either in 2009 or 2012. Data about all attributes are required
SELECT *  
FROM Book
WHERE  Title like "%Head%" and (Publication_year = 2009 or Publication_year = 2012);

#Please provide data about all books either whose Isbn begins with 978 or whose title containts the word First. On top of that, books published in 2009 only are needed. Required attributes are Title and Isbn.

SELECT Title, Isbn
FROM Book
WHERE (Title LIKE '%First%' or Isbn LIKE '978%' ) AND Publication_year = 2009





