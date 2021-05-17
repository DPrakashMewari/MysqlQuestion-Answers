# Please provide data about all books which have neither been published in 2008 nor in 2012. Required attributes are Publication_year and Title which have to be renamed into Year and BookTitle.

SELECT  Publication_year as year, Title as BookTitle
FROM Book 
WHERE Publication_year not in (2008,2012);


# Please provide data about all authors whose first name contains the word Michael. Required attributes are Last_name and First_name which have to be renamed into LastName and FirstName.

SELECT Last_name as LastName,First_name as FirstName 
FROM  Author 
WHERE First_name like "%Michael%";

# Please provide the number of books published in 2012. Rename the header into Published2012.

SELECT count(Publication_year) as Published2012 
FROM Book
WHERE Publication_year = 2012;


# Please provide the average number of kids employees who currently working for the company have (i.e. End is NULL). Rename the header into AverageKids.

SELECT avg(kids_number) as AverageKids 
FROM  Employee
WHERE End is NULL;

# Please provide the total amount of salaries of all employees currently working for the company (i.e. End is NULL). Rename the header into TotalSalaries.

SELECT SUM(salary) as TotalSalaries   
FROM Employee
WHERE end is Null;


# Please provide the number of employees having at least one kid. Rename the header into WithKids.

SELECT count(*) as WithKids
FROM Employee
WHERE Kids_number >= 1;

#Please provide data about all books published by O’Reilly. Required attributes are Title and Isbn. 

Select Title,Isbn 
from Book as b , Publisher as p 
where p.ID = b.Publisher_id and p.Name = "O'Reilly";