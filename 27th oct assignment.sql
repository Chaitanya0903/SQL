CREATE TABLE STUDENTS(STUDENT_ID INT, FIRST_NAME varchar(max), LAST_NAME varchar(max), 
GPA DECIMAL (10,2) , ENROLLMENT_DATE Datetime, MAJOR varchar(max));

CREATE TABLE PROGRAM (STUDENT_REF_ID INT, PROGRAM_NAME varchar(max));

CREATE TABLE Scholarship (Student_ref_id int, Scholarship_amount int, Scholarship_date datetime);

Select * from STUDENTS;
select * from program;
select * from scholarship;

--1. Write a SQL query to fetch "FIRST_NAME" from the Student table in upper case and use ALIAS name as STUDENT_NAME.

--Sol 1:-
SELECT UPPER(First_name) AS STUDENT_NAME from STUDENTS;

--2. Write a SQL query to fetch unique values of MAJOR Subjects from Student table.

--Sol 2 :-
SELECT DISTINCT(MAJOR) AS UNIQUE_MAJOR FROM STUDENTS;

--3. Write a SQL query to print the first 3 characters of FIRST_NAME from Student table.

--Sol 3:-
SELECT LEFT(FIRST_NAME,3) AS characters from Students;

--4. Write a SQL query that fetches the unique values of MAJOR Subjects from Student table and print its length.

--Sol 4 :-
SELECT MAJOR,LEN(MAJOR) AS LENGTH FROM STUDENTS
GROUP BY MAJOR;

--5. Write a SQL query to print the FIRST_NAME and LAST_NAME from Student table into single column COMPLETE_NAME.

--Sol 5 :-
SELECT CONCAT(FIRST_NAME,' ' ,LAST_NAME) AS COMPLETE_NAME FROM STUDENTS;

--6. Write a SQL query to print details of the Students with the FIRST_NAME as 'Prem' and 'Shivansh' from Student table.
--Sol 6 :-
Select * from STUDENTS
WHERE FIRST_NAME IN( 'Prem' , 'Shivansh');

--7. Write a SQL query to print details of the Students excluding FIRST_NAME as 'Prem' and 'Shivansh' from Student table.
--Sol 7 :-
Select * from STUDENTS
WHERE FIRST_NAME NOT IN( 'Prem' , 'Shivansh');

--8. Write a SQL query to print details of the Students whose FIRST_NAME ends with 'a'.
--Sol 8 :-
Select * from students
where FIRST_NAME LIKE '%a';

--9. Write an SQL query to fetch Students full names with GPA >= 8.5 and <= 9.5.
--Sol 9 :-
Select CONCAT(FIRST_NAME,' ',LAST_NAME) as full_names from STUDENTS
WHERE GPA BETWEEN 8.5 AND 9.5;

--10. Write an SQL query to fetch the no. of Students for each MAJOR subject in the descending order.
--Sol 10 :-
Select MAJOR,COUNT(STUDENT_ID) AS studentcount FROM STUDENTS
GROUP BY MAJOR
ORDER BY studentcount DESC;

--11. Display the details of students who have received scholarships, including their names, scholarship amounts, and scholarship dates.
--Sol 11:-
Select Stu.first_name,Stu.last_name,s.scholarship_amount,s.scholarship_date 
from STUDENTS Stu
join Scholarship s
on Stu.STUDENT_ID = s.Student_ref_id;

--12.List all students and their scholarship amounts if they have received any. If a student has not received a scholarship, display NULL for the scholarship details.
--Sol 12:-
Select Stu.first_name,Stu.last_name,s.scholarship_amount,s.scholarship_date 
from STUDENTS Stu
full outer join Scholarship s
on Stu.STUDENT_ID = s.Student_ref_id;

--13. Write an SQL query to show the top n (say 5) records of Student table order by descending GPA.
--Sol 13:-
WITH maxgpa as(
Select first_name,GPA, DENSE_RANK() OVER(ORDER BY GPA DESC) as max_gpa
from STUDENTS
)
Select top 2 GPA from maxgpa
WHERE max_gpa = 1;

--14. Write an SQL query to fetch the list of Students with the same GPA.
SELECT s1.*
FROM Students s1
JOIN Students s2 ON s1.GPA = s2.GPA AND s1.STUDENT_ID <> s2.STUDENT_ID
ORDER BY s1.GPA;

--15. Write an SQL query to show the second highest GPA from a Student table using sub-query.
--Sol 15:-
Select TOP 1 GPA FROM( SELECT DISTINCT TOP 2 GPA FROM STUDENTS ORDER BY GPA DESC) AS gpas
ORDER BY GPA;

--16. Write an SQL query to show one row twice in results from a table.
-- Using UNION ALL to include the same row twice
SELECT *
FROM Students
UNION ALL
Select * from STUDENTS

--17. Write an SQL query to list STUDENT_ID who does not get Scholarship
--Sol 17 :-
Select Stu.STUDENT_ID
from STUDENTS Stu
LEFT join Scholarship s
on Stu.STUDENT_ID = s.Student_ref_id
WHERE s.Student_ref_id IS NULL ;

--18. Write an SQL query to fetch the MAJOR subject that have less than 4 people in it.
SELECT MAJOR,COUNT(STUDENT_ID) AS COUNT FROM STUDENTS
GROUP BY MAJOR
HAVING COUNT(STUDENT_ID)< 4
ORDER BY COUNT;

--19. Write an SQL query to show all MAJOR subject along with the number of people in there.
--Sol 19:-
SELECT MAJOR,COUNT(STUDENT_ID) AS COUNT FROM STUDENTS
GROUP BY MAJOR
ORDER BY COUNT;

--20. Write an SQL query to show the last record from a table
--Sol 20
SELECT TOP 1 * FROM STUDENTS
ORDER BY STUDENT_ID DESC;

--21. Write an SQL query to fetch three max GPA from a table using co-related subquery.
SELECT TOP 3 GPA FROM(SELECT DISTINCT TOP 3 GPA FROM STUDENTS ORDER BY GPA DESC) AS MAXGPA
ORDER BY GPA DESC;

--22. Write an SQL query to fetch MAJOR subjects along with the max GPA in each of these MAJOR subjects.
Select MAJOR,MAX(GPA) as maxgpa from students
GROUP BY MAJOR;

--23. Write an SQL query to fetch the names of Students who has highest GPA.
--Sol 23:-
SELECT FIRST_NAME
FROM Students
WHERE GPA = (SELECT MAX(GPA) FROM Students);
