USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [project3].[LoadDepartmentInstructor]    Script Date: 11/29/2022 9:36:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jasmine Kim
-- Create date: 11/26/2022
-- Description:	Load DeptInstructor Bridge Table
-- =============================================
ALTER PROCEDURE [project3].[LoadDepartmentInstructor]
	 @UserAuthorizationKey [UDT].[SurrogateKey]
AS
BEGIN
	DECLARE @starttime AS DATETIME2(7) = SYSDATETIME()
	SET NOCOUNT ON;

	INSERT INTO hr.DepartmentInstructor
(
    DepartmentId,
    InstructorNum,
    UserAuthorizationKey
    
)

SELECT DISTINCT 
	d.DepartmentId,
	i.InstructorNum,
	@UserAuthorizationKey

FROM Uploadfile.RevisedTable AS rt
	INNER JOIN HR.Department AS d
		ON d.DepartmentCode = rt.DepartmentAcronym
	INNER JOIN hr.Instructor AS i
		ON i.FirstName = rt.InstructorFirstName
		AND i.LastName = rt.InstructorLastName


    DECLARE @endtime AS DATETIME2(7) = SYSDATETIME()
	DECLARE @rowcount AS INT
	SELECT @rowcount = COUNT(*) FROM [HR].[DepartmentInstructor]

	PRINT 'Loaded DeptInstructor Bridge Table'

    EXEC [Process].[usp_TrackWorkFlow] N'Load DeptInstructor Table',@rowcount,@starttime,@endtime,@UserAuthorizationKey
END
