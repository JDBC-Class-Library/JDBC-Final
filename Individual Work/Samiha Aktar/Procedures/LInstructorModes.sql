USE [QueensClassSchedule]
GO

/****** Object:  StoredProcedure [Project3].[LoadInstructorModes]    Script Date: 12/5/2022 11:04:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Samiha Aktar
-- Create date: 12/4/2022
-- Description:	Load Instructor Modes
-- =============================================
CREATE PROCEDURE [Project3].[LoadInstructorModes]
@UserAuthorizationKey [UDT].[SurrogateKey]

AS
BEGIN
	
	SET NOCOUNT ON;
	DECLARE @starttime AS DATETIME2(7) = SYSDATETIME();

	WITH Modes AS
	(
	SELECT DISTINCT [Mode of Instruction]
	FROM [Uploadfile].[RevisedTable] as Modes
	)

    INSERT INTO [Location].[InstructionMode](Mode,UserAuthorizationKey)
	SELECT [Mode of Instruction],@UserAuthorizationKey
	FROM Modes;

	DECLARE @endtime AS DATETIME2(7) = SYSDATETIME()
	DECLARE @rowcount AS INT
	SELECT @rowcount = COUNT(*) FROM [Location].[InstructionMode]

	PRINT 'Loaded InstructionMode Table'

	EXEC [Process].[usp_TrackWorkFlow] N'Load Instructor Modes',@rowcount,@starttime,@endtime,@UserAuthorizationKey

	
END
GO

