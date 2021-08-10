# Find duplicate records  -


mysql> select custmer_name,customer_type,count(*) as cnt from customers group by custmer_name,customer_type having count(*) > 0;
+--------------------------+----------------+-----+
| custmer_name             | customer_type  | cnt |
+--------------------------+----------------+-----+
| Surge Stores             | Brick & Mortar |   1 |
| Nomad Stores             | Brick & Mortar |   1 |
| Excel Stores             | Brick & Mortar |   1 |
| Surface Stores           | Brick & Mortar |   1 |
| Premium Stores           | Brick & Mortar |   1 |
| Electricalsara Stores    | Brick & Mortar |   1 |
| Info Stores              | Brick & Mortar |   1 |
| Acclaimed Stores         | Brick & Mortar |   1 |
| Electricalsquipo Stores  | Brick & Mortar |   1 |
| Atlas Stores             | Brick & Mortar |   1 |


# 2nd Highest Salary 

 select max(salary) as salary from emp1 where salary < (select max(salary)
 from emp1);
+--------+
| salary |
+--------+
|   7000 |


# 3rd Highest Salary
 select min(salary) from ( select distinct salary from emp1 limit 3) as o; 
+-------------+
| min(salary) |
+-------------+
|        5000 |


# 
select e.name, e.dept,m.salary  from emp1 as e 
    -> join employee as m on e.id = m.id 
    -> ;
+--------+------------+--------+
| name   | dept       | salary |
+--------+------------+--------+
| Thomas | Sales      |   5000 |
| Jason  | Technology |   5500 |
| Mayla  | Technology |   7000 |
| Nisha  | Marketing  |   9500 |
| Randy  | Technology |   6000 |
+--------+------------+--------+
