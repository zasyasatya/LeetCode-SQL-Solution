
-- 175. Combine Two Tables (Easy)
SELECT a.firstName, a.lastName, b.city, b.state FROM Person a LEFT JOIN Address b ON a.personId = b.personId

-- 176. Second Highest Salary (Medium)
SELECT MAX(salary) as SecondHighestSalary FROM Employee WHERE salary < (SELECT MAX(salary) FROM Employee)    

-- 177. Nth Highest Salary (Medium)
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N -1;
  RETURN (SELECT DISTINCT(salary) FROM Employee ORDER BY salary DESC LIMIT 1 OFFSET N);
END;

-- 178. Rank Scores (Medium)
SELECT 
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
FROM 
    Scores;

-- 180. Consecutive Numbers (Medium)
SELECT DISTINCT Num AS ConsecutiveNums
FROM Logs
WHERE (Id + 1, Num) IN (SELECT * FROM Logs) AND (Id + 2, Num) IN (SELECT * FROM Logs)

-- 181. Employees Earning More Than Their Managers (Easy)
SELECT name as 'Employee' 
FROM Employee e WHERE 
    e.managerId IS NOT NULL AND
    salary > (SELECT salary FROM Employee WHERE id = e.managerId) 

-- 182. Duplicate Emails (Easy)
SELECT email FROM Person GROUP BY email HAVING COUNT(email) > 1

-- 183. Customers Who Never Order (Easy)
SELECT a.name AS 'Customers' FROM Customers a LEFT JOIN Orders b ON a.id = b.customerId WHERE customerId IS NULL


-- 184. Department Highest Salary
SELECT b.name AS Department, a.name AS Employee, a.salary AS Salary
FROM Employee a 
INNER JOIN Department b ON a.departmentId = b.id
WHERE a.salary = (
    SELECT MAX(salary)
    FROM Employee e
    WHERE e.departmentId = a.departmentId
)
GROUP BY b.id, a.id;