#Schema SQL

  CREATE TABLE Employee (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
department VARCHAR(50),
salary DECIMAL(10, 2),
joining_date DATE
);
INSERT INTO Employee (emp_id, emp_name, department, salary, joining_date) VALUES
(1, 'Karthik', 'HR', 60000.00, '2021-01-15'),
(2, 'Pratik', 'Finance', 70000.00, '2021-03-10'),
(3, 'Veer', 'HR', 55000.00, '2021-06-20'),
(4, 'Priya', 'Finance', 80000.00, '2022-01-05'),
(5, 'Ajay', 'Engineering', 75000.00, '2020-11-01'),
(6, 'Vijay', 'Engineering', 78000.00, '2019-05-22'),
(7, 'Veena', 'HR', 62000.00, '2023-03-12'),
(8, 'Meena', 'Marketing', 65000.00, '2022-08-18');

CREATE TABLE Sales (
sales_id INT PRIMARY KEY,
emp_id INT,
product VARCHAR(50),
amount DECIMAL(10, 2),
sale_date DATE
);
INSERT INTO Sales (sales_id, emp_id, product, amount, sale_date) VALUES
(1, 1, 'Laptop', 50000.00, '2023-01-15'),
(2, 2, 'Mobile', 30000.00, '2023-02-18'),
(3, 3, 'Tablet', 20000.00, '2023-02-25'),
(4, 4, 'Laptop', 45000.00, '2023-03-05'),
(5, 5, 'Mobile', 35000.00, '2023-03-12'),
(6, 6, 'Tablet', 25000.00, '2023-03-20'),
(7, 7, 'Laptop', 60000.00, '2023-04-01'),
(8, 8, 'Mobile', 40000.00, '2023-04-10');

Basic GROUP BY Queries
  
1. Find the total salary for each department in the Employee table.

  select SUM(salary)as total_salary,department
from Employee
group by department;

2.Count the number of employees in each department.

  select count(emp_name)as no_of_employee,department
from Employee
group by department;

3.Calculate the average salary of employees in each department
  select avg(salary)as avg_salary,department
from Employee
group by department;
4. Find the maximum salary in each department.
  select max(salary)as max_salary,department
from Employee
group by department;
  
5. Find the minimum salary in each department.
  select min(salary)as min_salary,department
from Employee
group by department;

6.Find the total salary for departments where the total salary exceeds 100,000.

  select department,sum(salary) as total_salary
from Employee
group by department
Having sum(salary)> 100000;

7.Count the number of employees in departments with more than 2 employees.
  select department,count(emp_name) as no_of_employee
from Employee
group by department
having count(emp_name)>2;

8. Calculate the average salary for employees who joined after 2021-01-01, grouped by department.
  select department,avg(salary) as avg_salary
from Employee
where joining_date> '2021-01-01'
group by department;

9. Find the departments where the maximum salary is greater than 75,000.
  select department,max(salary) as max_salary
from Employee
group by department
having max(salary)>75000;

10. List the departments where the total salary is less than 150,000.
  select department,sum(salary) as total_salary
from Employee
group by department
having sum(salary)<150000;

11.Find the total number of employees grouped by department, but only include departments with more than 1 employee
  select department, count(emp_name) as total_employees
from Employee
group by department
having count(emp_name)>1;

12. Calculate the total salary of each department and show only those where the total exceeds 125,000.

select department, sum(salary) as total_salary
from Employee
group by department
having sum(salary)>125000

13. Count the number of employees in each department, but include only departments with more than 2 employees

select department,count(emp_name) as no_of_employee
from Employee
group by department
having no_of_employee>2

14.Find the average salary in each department where the average salary is above 60,000.

  select department,avg(salary) as avg_Salary
from Employee
group by department
having avg_salary>60000
  
15. Show departments where the sum of salaries is between 100,000 and 200,000.

select department,sum(salary) as sum_salaries
from Employee
group by department
having sum_salaries between 100000 and 200000 

GROUP BY with JOINs
  
16. Find the total sales amount for each employee.

  select e.emp_name,sum(s.amount) as Total_sales
from Employee e
join Sales s on e.emp_id=s.emp_id
group by emp_name
order by Total_sales desc
  
17. List the number of sales made by each employee.

  select e.emp_name,count(s.product) as no_of_sales
from Employee e
join Sales s on e.emp_id=s.emp_id
group by emp_name
order by no_of_sales desc

18.Find the total sales amount grouped by product.

  select s.product,sum(s.amount) as total_amount
from Employee e
join Sales s on e.emp_id=s.emp_id
group by product

19.Calculate the average sales amount grouped by product.

  select s.product,avg(s.amount) as avg_amount
from Employee e
join Sales s on e.emp_id=s.emp_id
group by product

20. Find employees who have made more than 2 sales, grouped by their names.

select e.emp_name,count(s.product) as more_than_2sales
from Employee e
join Sales s on e.emp_id=s.emp_id
group by emp_name
having more_than_2sales>2;

Advanced GROUP BY
21. Calculate the total salary and total sales amount for each employee.

  select e.emp_name,sum(s.amount) as total_sales,sum(e.salary) as total_salary
from Employee e
join Sales s on e.emp_id=s.emp_id
group by emp_name
  
22. Count the number of unique products sold by each employee.
 select e.emp_name,count(DISTINCT s.product) as unique_products
from Employee e
join Sales s on e.emp_id=s.emp_id
group by emp_name

23. Find the highest sales amount made by each employee.
  select e.emp_name,max(s.amount) as highest_sales_amount
from Employee e
join Sales s on e.emp_id=s.emp_id
group by emp_name

24.Calculate the total sales amount grouped by product and filtered by products where the total exceeds 50,000.

  select s.product,sum(s.amount) as total_sales_amount
from Employee e
join Sales s on e.emp_id=s.emp_id
group by product
having total_sales_amount>50000;

25. Find the departments with the highest average sales amount.

  select e.department ,avg(s.amount) as avg_sales_amount
from Employee e
join Sales s on e.emp_id=s.emp_id
group by department
order by avg_sales_amount desc 

Real-World Scenarios
26. Find the department with the highest total sales amount.
  select e.department ,max(s.amount) as highest_sales_amount
from Employee e
join Sales s on e.emp_id=s.emp_id
group by department
order by highest_sales_amount desc limit 1
  
27. Show the top 3 employees with the highest total sales amount, grouped by employee
names.

  select e.emp_name ,sum(s.amount) as highest_sales_amount
from Employee e
join Sales s on e.emp_id=s.emp_id
group by emp_name
order by highest_sales_amount desc limit 3

28.Calculate the total number of employees and the average salary, grouped by the year of joining.
  select Extract(year from joining_date) as joining_year,count(*) as total_employee ,avg(salary) as avg_salary
from Employee
group by year(joining_date)
order by joining_year
  
29. Find the total sales amount for each department (using a join between Employee and Sales).
  select e.department ,sum(s.amount) as total_sales_amount
from Employee e
join Sales s on e.emp_id=s.emp_id
group by department
  
30. Show employees who have not made any sales, grouped by their department

select e.department ,count(*) as NO_sales
from Employee e
 left join Sales s on e.emp_id = s.emp_id
where s.emp_id is NULL
group by e.department