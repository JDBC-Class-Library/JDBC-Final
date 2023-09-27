-- 1. Show all instructors who are teaching in classes in multiple departments
SELECT DISTINCT di.InstructorNum
				, i.FullName
				, COUNT(di.DepartmentID) OVER (PARTITION BY di.InstructorNum) AS CountOfDepartments
FROM  HR.Instructor AS i
	INNER JOIN HR.DepartmentInstructor AS di
		ON i.InstructorNum = di.InstructorNum
ORDER BY CountOfDepartments DESC, di.InstructorNum ASC

--with group by
SELECT DISTINCT i.InstructorNum
				, COUNT(di.departmentId)
FROM hr.Instructor AS i
	INNER JOIN HR.DepartmentInstructor AS di
		ON di.InstructorNum = i.InstructorNum
GROUP BY i.InstructorNum
HAVING COUNT(di.departmentId) > 1
ORDER BY COUNT(di.departmentId) DESC, i.InstructorNum ASC

--2. How many instructors are in each department?
SELECT DISTINCT d.DepartmentCode
				, count (di.InstructorNum) AS CountOfInstructors
FROM HR.Department AS d
	INNER JOIN HR.DepartmentInstructor AS di
		ON di.DepartmentID = d.departmentId
GROUP BY d.DepartmentCode
ORDER BY d.DepartmentCode

--with window function
SELECT DISTINCT d.departmentId
			   , d.DepartmentCode
			   , d.DepartmentName
			   ,COUNT(di.InstructorNum) OVER (PARTITION BY di.DepartmentID) AS CountOfInstructors
FROM HR.Department AS d
	INNER JOIN HR.DepartmentInstructor AS di
		ON di.DepartmentID = d.departmentId
ORDER BY d.DepartmentCode

--3. How many classes that are being taught that semester grouped by course and aggregating the total enrollment, total class limit and the percentage of enrollment
SELECT DISTINCT c.CourseId
		, COUNT(c.ClassId) AS NumOfClasses	
		, SUM (c.Enrollment) AS TotalEnrollment
		, SUM(c.MaxEnrollment) AS TotalClassLimit
		, CASE 
			WHEN SUM (c.MaxEnrollment) = 0 THEN 'Class is not open to enrollment yet'
			ELSE FORMAT(SUM (c.Enrollment)/cast (SUM(c.MaxEnrollment)AS NUMERIC), 'P')
		  END AS EnrollmentPercentage
FROM Enrollment.Class AS c
GROUP BY c.CourseId
ORDER BY c.CourseId



-- Aggregate window function: SUM
--How many classes are offered by each department? Obtain the percentage of the current value out of the grand total. 
SELECT DISTINCT  
	d.departmentId,
	d.DepartmentCode,
	d.DepartmentName,
	COUNT(c.ClassId) OVER (PARTITION BY d.departmentId) AS [Number Of Classes],
	COUNT(c.classID) OVER () AS [GrandTotalOfClasses],
	format (COUNT(c.ClassId) OVER (PARTITION BY d.departmentId)/cast (COUNT(c.classID) OVER ()AS NUMERIC),'P') AS [Percent]
FROM Enrollment.Class AS c
	INNER JOIN Enrollment.Course AS c2
		ON c2.CourseId = c.CourseId
	INNER JOIN HR.Department AS d
		ON d.departmentId = c2.DepartmentId
ORDER BY [Number Of Classes] DESC 


--How many courses are offered by each department?
SELECT DISTINCT  
	d.departmentId,
	d.DepartmentCode,
	d.DepartmentName,
	COUNT(c.CourseId) OVER (PARTITION BY d.departmentId) AS [Number Of Courses],
	COUNT(c.CourseId) OVER () AS [GrandTotalOfCourses],
	format (COUNT(c.CourseId) OVER (PARTITION BY d.departmentId)/cast (COUNT(c.courseId) OVER ()AS NUMERIC),'P') AS [Percent]
FROM Enrollment.Course AS c
	INNER JOIN HR.Department AS d
		ON d.departmentId = c.DepartmentId
ORDER BY [Number Of Courses] DESC 


--Obtain a pivot table or total number of classes for each department and classes.
SELECT departmentId, [In-Person], [Web-Enhanced], [Hybrid], [Online]
FROM (SELECT c2.DepartmentId, im.ModeOfInstruction, c.ClassId
	  FROM Enrollment.Class AS c
		INNER JOIN Enrollment.Course AS c2
			ON c2.CourseId = c.CourseId
		INNER JOIN Schedule.InstructionMode AS im
			ON im.ModeOfInstructionId = c.ModeOfInstructionId) AS J
	  PIVOT (COUNT(ClassId) FOR ModeOfInstruction IN ([In-Person], [Web-Enhanced], [Hybrid], [Online])) AS P


