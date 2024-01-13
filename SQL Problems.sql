
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



