--- JOINS ASSIGNMENT--

CREATE DATABASE Chaitanya_5thOct_LiveProject_8AM
USE Chaitanya_5thOct_LiveProject_8AM

CREATE TABLE EmployeeDetail (
    EmployeeID INT,
	FirstName varchar(20),
	LastName  varchar(20),
	Salary	  INT,
	Department varchar(20),
	Gender    varchar(20)
	)

CREATE TABLE ProjectDetail (
     ProjectDetailID INT,
	EmployeeDetailID INT,
	 ProjectName  varchar(20)
	 )

	 SELECT * FROM EmployeeDetail;
	 SELECT * FROM ProjectDetail;

-----Get Employee Name, Project Name order by firstname from "EmployeeDetail" and "ProjectDetail"for those Employee which have assigned project already. 
--Solution 1

	 SELECT e.FirstName,e.LastName,p.ProjectName 
	 from EmployeeDetail e
	 JOIN ProjectDetail p
	 ON e.EmployeeID = p.EmployeeDetailID
	 ORDER BY e.FirstName;

----Get Employee Name, Project Name order by firstname from "EmployeeDetail" and "ProjectDetail"for those Employee even they have not assigned project.
---Solution 2
SELECT e.FirstName,e.LastName,p.ProjectName 
	 from EmployeeDetail e
	LEFT JOIN ProjectDetail p
	 ON e.EmployeeID = p.EmployeeDetailID
	 WHERE p.ProjectName IS NULL
	 ORDER BY e.FirstName;

-----Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail".
----Solution 3
SELECT e.EmployeeID,e.FirstName,e.LastName,p.ProjectName 
	 from ProjectDetail p
	LEFT JOIN EmployeeDetail e
	 ON e.EmployeeID = p.EmployeeDetailID
	 ORDER BY e.FirstName;

--Get Employee Record (Employeename, project name)from both tables ([EmployeeDetail],[ProjectDetail]),if no match found in any table then show null.
---Solution 4
 SELECT e.FirstName,e.LastName,p.ProjectName 
	 from EmployeeDetail e
	 FULL JOIN ProjectDetail p
	 ON e.EmployeeID = p.EmployeeDetailID;

------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
----SQL PRACTICE ASSIGNMENT

CREATE TABLE EmployeeDetails(
EmpId INT,
FullName Varchar(20),
ManagerId INT,
City Varchar(20)
)

SELECT * FROM EmployeeDetails

CREATE TABLE EmployeeSalary(
EmpId	INT,
Project	Varchar(20),
Salary	INT,
Variable INT
)

SELECT * FROM EmployeeSalary

---Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.
---Solution 1
Select EmpId,FullName from EmployeeDetails
WHERE ManagerId = 986

---Write an SQL query to fetch the different projects available from the EmployeeSalary table.
----Solution 2
Select distinct(Project) from EmployeeSalary

----Write an SQL query to fetch the count of employees working in project ‘P1’.
----Solution 3
SELECT COUNT(*) AS emp_in_p1 from EmployeeSalary
WHERE Project = 'P1';

-----Write an SQL query to find the maximum, minimum, and average salary of the employees.
---SOlution 4
SELECT MAX(Salary) as max_salary,
MIN(Salary) as min_salary,
AVG(Salary) as average_salary
FROM EmployeeSalary;

----Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
----solution 5
Select EmpId from EmployeeSalary
WHERE Salary Between 9000 AND 15000;

---- Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
---Solution 6
Select * from EmployeeDetails
WHERE City LIKE 'Toronto'
AND ManagerId = 321;

--- Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
----Solution 7
Select * from EmployeeDetails
WHERE City LIKE 'California'
OR ManagerId = 321;

---Write an SQL query to fetch all those employees who work on Projects other than P1.
---Solution 8
SELECT *FROM EmployeeSalary
WHERE Project <> 'P1';

---Write an SQL query to display the total salary of each employee adding the Salary with Variable value.
----Solution 9
SELECT EmpId,(Salary + Variable) AS Total_Salary
FROM EmployeeSalary;

----- Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.
---Solution 10
SELECT EmpId
FROM EmployeeDetails UNION
SELECT EmpId
FROM EmployeeSalary;

