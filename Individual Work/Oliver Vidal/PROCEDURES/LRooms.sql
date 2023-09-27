USE [QueensClassSchedule]
GO

/****** Object:  StoredProcedure [Project3].[LoadRooms]    Script Date: 12/6/2022 7:16:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Oliver Vidal
-- Create date: 12/03/2022
-- Description:	Load All Rooms
-- =============================================
CREATE PROCEDURE [Project3].[LoadRooms]
@UserAuthorizationKey [UDT].[SurrogateKey]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @starttime AS DATETIME2(7) = SYSDATETIME()
	
INSERT INTO [Location].[Room] (
	RoomNumber
	,BuildingID
	,UserAuthorizationKey
	)
SELECT T.Room
	,T.BuildingID
	,@UserAuthorizationKey
FROM (
	SELECT RV.Room
		,B.BuildingID
	FROM Location.Building AS B
	INNER JOIN [Uploadfile].[RevisedTable] AS RV ON B.BuildingCode = RV.BuildingAcronym
	GROUP BY BuildingID
		,Room
	) AS T

	DECLARE @endtime AS DATETIME2(7) = SYSDATETIME()
	DECLARE @rowcount AS INT 
	SELECT @rowcount = COUNT(*) FROM [Location].[Room]

	PRINT 'Loaded Rooms Table'
    EXEC [Process].[usp_TrackWorkFlow] N'Load Rooms',@rowcount,@starttime,@endtime,@UserAuthorizationKey
END
GO

