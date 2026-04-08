--2Q--
SELECT emp_name, department, performance_rating, salary,

CASE 
    WHEN department = 'Finance' AND performance_rating = 'A' THEN salary * 0.20
    WHEN department = 'Finance' AND performance_rating = 'B' THEN salary * 0.15
    WHEN department = 'Finance' AND performance_rating = 'C' THEN salary * 0.05

    WHEN department = 'Engineering' AND performance_rating = 'A' THEN salary * 0.18
    WHEN department = 'Engineering' AND performance_rating = 'B' THEN salary * 0.12
    WHEN department = 'Engineering' AND performance_rating = 'C' THEN salary * 0.03

    ELSE salary * 0.10
END AS bonus

FROM Employee;

--3Q--
SELECT *,
       case
           when salary>80000 and performance_rating='A' then 'High performer'
           when salary between 50000 and 80000 and performance_rating='B' then 'mid performer'
           when salary<50000 and performance_rating='c' then 'low performer'
           else 'least performer'
       End as 'performance mode'
FROM Employee;