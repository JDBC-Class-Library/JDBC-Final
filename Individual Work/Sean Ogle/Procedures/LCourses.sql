USE [QueensClassSchedule]
GO

/****** Object:  StoredProcedure [Project3].[LoadCourses]    Script Date: 12/6/2022 7:14:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Sean Ogle
-- Create date: 12/5/22
-- Description:	Load Courses
-- =============================================
CREATE PROCEDURE [Project3].[LoadCourses] 
@UserAuthorizationKey [UDT].[SurrogateKey]
	
AS
BEGIN
	DECLARE @timeStart as datetime2(7) = sysdatetime()

	SET NOCOUNT ON;
	INSERT INTO [Enrollment].[Course] (
	CourseCode
	,CourseName
	,CourseDescription
	,CourseCredit
	,CourseHour
	,DepartmentID
	,UserAuthorizationKey
	)
SELECT T.CourseCode
	,T.DepartmentAcronym
	,T.Description
	,T.CourseCredit
	,T.CourseHour
	,T.departmentId
	,@UserAuthorizationKey
FROM (
	SELECT DISTINCT D.DepartmentID
		,RV.DepartmentAcronym
		,Rv.CourseCode
		,RV.CourseCredit
		,RV.CourseHour
		,RV.Description
	FROM HR.Department AS D
	INNER JOIN [Uploadfile].RevisedTable AS RV ON D.DepartmentCode = RV.DepartmentAcronym
	) AS T

UPDATE [Enrollment].[Course]
SET CourseHour = N'TBA'
WHERE CourseHour = N'.'

	DECLARE @rowCount as int 
	SELECT @rowCount = count(*) FROM [Enrollment].[Course]
	DECLARE @timeEnd datetime2(7) =sysdatetime();

	PRINT 'Loaded Courses Table'
	EXEC [Process].[usp_TrackWorkFlow] N'Load Courses' ,@rowCount, @timeStart,@timeEnd, @UserAuthorizationKey;
  
END
GO

