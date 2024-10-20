--SQL JOINS ASSIGNMENT USING PROCEDURE

--SOLUTION 1

CREATE PROCEDURE emp_project_details
AS
BEGIN
Select e.firstname,p.projectname 
from EmployeeDetail e join ProjectDetail p on
e.employeeid = p.employeedetailid
order by e.FirstName;
END;

execute emp_project_details;

---SOLUTION 2

CREATE PROCEDURE emp_no_project_details
AS
BEGIN
Select e.firstname,p.projectname 
from EmployeeDetail e left join ProjectDetail p on
e.employeeid = p.employeedetailid
WHERE p.ProjectName IS NULL
order by e.FirstName;
END;


execute emp_no_project_details;


---SOLUTION 3
CREATE PROCEDURE project_details
AS
BEGIN
SELECT e.EmployeeID,e.FirstName,e.LastName,p.ProjectName 
	 from ProjectDetail p
	LEFT JOIN EmployeeDetail e
	 ON e.EmployeeID = p.EmployeeDetailID
	 ORDER BY e.FirstName;
	 end;

	 execute  project_details;



--- SOLUTION 4
CREATE PROCEDURE EMP_RECORD
AS
BEGIN 
SELECT e.FirstName,e.LastName,p.ProjectName 
	 from EmployeeDetail e
	 FULL JOIN ProjectDetail p
	 ON e.EmployeeID = p.EmployeeDetailID
	 END;
	 EXECUTE EMP_RECORD;