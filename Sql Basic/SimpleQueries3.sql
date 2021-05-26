# Please provide data about all books in which Andrew Duncan was involved in the drafting.


SELECT b.Title , b.Isbn
FROM Book as b 
inner join Writing as w 
on b.ID = w.Book_id
inner join Author as a 
on w.author_id  = a.ID
WHERE a.First_name = "Andrew" and a.Last_name = "Duncan";


#Please provide data about all employees not working in the Finance department (regardless if employees have left the company or not). Required attributes are last name, first name and department name.


SELECT e.Last_name, e.First_name ,d.Name
FROM  Employee AS e 
inner join  Department as d 
on d.Id = e.Department_id
WHERE d.name <> "Finance";

# Please provide data about all books having been written by Andrew Duncan only, i.e. without any other co-authors.

SELECT *
FROM Author as a
inner join Writing as w on w.Author_id = a.ID
inner join Book as b on w.Book_id = b.ID
Group BY b.id 
having count(*) = 1 and a.First_name = 'Andrew' and 
a.Last_name ="Duncan";




# Please provide data about all books (Title, Isbn) having been written by two or more people and whose title contains the word Head.

SELECT b.Title,b.Isbn
FROM Book as b, Writing as w 
WHERE b.ID = w.Book_id and b.Title like"%Head%"
group by b.ID
HAVING COUNT(*) > 1;






Please provide data about all authors and the number of books in which each has been involved in the drafting. Required attributes are last name, first name and the number of books, which have to be renamed into LastName, FirstName and NbOfBooks.

SELECT a.First_name as Firstname, a.Last_name as LastName,count(*) 
as NbOfBooks
FROM Author as a,Writing as w , Book as b
WHERE  a.ID = w.Author_id and w.Book_id = b.ID
group by a.ID ;



#Please provide data about all publishers having published only one book. Required attributes are publisher’s name and book’s title.

SELECT p.name,b.Title 
FROM Book as b ,Publisher as p
WHERE b.publisher_id = p.Id
group by p.ID 
Having count(*) = 1;



#Please provide data about departments whose total of salaries of employees working in it exceeds 61,000. Required attributes are the department name and the related total of salaries which have to be renamed into Department and TotalSalaries.

SELECT Department.Name as Department, Sum(Employee.salary) as TotalSalaries  
FROM Department, Employee 
WHERE Department.ID = Employee.Department_id 
group by Department.ID 
HAVING sum(Employee.Salary) > 61000;
