
-- 175. Combine Two Tables
SELECT a.firstName, a.lastName, b.city, b.state FROM Person a LEFT JOIN Address b ON a.personId = b.personId

-- 176. Second Highest Salary
SELECT MAX(salary) as SecondHighestSalary FROM Employee WHERE salary < (SELECT MAX(salary) FROM Employee)    

-- 177. Nth Highest Salary
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N -1;
  RETURN (SELECT DISTINCT(salary) FROM Employee ORDER BY salary DESC LIMIT 1 OFFSET N);
END;

-- 178. Rank Scores
SELECT 
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
FROM 
    Scores;

-- 180. Consecutive Numbers
SELECT DISTINCT Num AS ConsecutiveNums
FROM Logs
WHERE (Id + 1, Num) IN (SELECT * FROM Logs) AND (Id + 2, Num) IN (SELECT * FROM Logs)

-- 181. Employees Earning More Than Their Managers
SELECT name as 'Employee' 
FROM Employee e WHERE 
    e.managerId IS NOT NULL AND
    salary > (SELECT salary FROM Employee WHERE id = e.managerId) 

-- 182. Duplicate Emails
SELECT email FROM Person GROUP BY email HAVING COUNT(email) > 1