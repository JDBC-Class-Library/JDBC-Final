USE [QueensClassScheduleCurrentSemester]

--Proposition 1: Instructors that teach In person and the number of classes they teach.

Select I.FullName, C.ModeOfInstructionId, M.Mode, Count(*) as NumofClass
FROM [Enrollment].[Class] as C
INNER JOIN [Location].[InstructionMode] as M
ON C.ModeOfInstructionId=M.InstructionModeID
INNER JOIN [HR].[Instructor] as I
ON C.InstructorID=I.InstructorID
WHERE C.ModeOfInstructionId = 2
GROUP BY I.FullName, C.ModeOfInstructionId, M.Mode


--Proposition 2: Number of classes available for each Mode


Select M.InstructionModeID,M.Mode,Count(*) as NumOfClasses 
FROM [Enrollment].[Class] as C
INNER JOIN [Location].[InstructionMode] as M
ON C.ModeOfInstructionId=M.InstructionModeID
GROUP BY M.InstructionModeID,M.Mode







