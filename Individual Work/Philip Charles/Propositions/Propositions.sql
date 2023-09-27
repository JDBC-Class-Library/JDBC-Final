USE [QueensClassScheduleCurrentSemester]

/* BridgeTable executions */


Select DepartmentID, count(InstructorID) as numOfInstructors 
FROM [HR].[DepartmentInstructor]
GROUP BY DepartmentID

Select InstructorID, count(DepartmentID) as numOfDepartments
FROM [HR].[DepartmentInstructor]
GROUP BY InstructorID

Select InstructorID, count(CourseID) as numOfCourses
FROM [Enrollment].[InstructorCourseBridge]
GROUP BY InstructorID

Select CourseID, count(InstructorID) as numofInstructors
FROM [Enrollment].[InstructorCourseBridge]
GROUP BY CourseID

SELECT CourseID, count(InstructionModeID) as numOfInstructorModes
FROM [Location].[CourseMode]
GROUP BY CourseID

SELECT [InstructionModeID], count(CourseID) as numOfCourses
FROM [Location].[CourseMode]
GROUP BY [InstructionModeID]

