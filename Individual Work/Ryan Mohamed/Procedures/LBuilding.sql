USE [QueensClassSchedule]
GO

/****** Object:  StoredProcedure [Project3].[LoadBuildings]    Script Date: 12/6/2022 7:18:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ryan Mohamed
-- Create date: 11/23/2022
-- Description:	Load Buildings
-- =============================================
CREATE PROCEDURE [Project3].[LoadBuildings] 
 @UserAuthorizationKey [UDT].[SurrogateKey]
AS
BEGIN
	
	SET NOCOUNT ON;
	DECLARE @starttime AS DATETIME2(7) = SYSDATETIME()


	INSERT INTO [Location].[Building]([BuildingCode],BuildingName,UserAuthorizationKey)
	SELECT DISTINCT BuildingAcronym,CASE BuildingAcronym
    when 'AR' then 'Building Name Unavailable' 
        when 'AE' then 'Alumni Hall'
        when 'DM' then 'Campbell Dome'
        when 'CA' then 'Colden Auditorium'
        when 'CH' then 'Colwin Hall'
        when 'C1' then 'Continuing Ed 1'
        when 'C2' then 'Continuing Ed 2'
        when 'CD' then 'Building Name Unavailable'
        when 'DY' then 'Delany Hall'
        when 'DH' then 'Dining Hall'
        when 'FG' then 'FitzGerald Gym'
        when 'FH' then 'Frese Hall'
        when 'GB' then 'G Building'
        when 'GC' then 'Gertz Center'
        when 'GT' then 'Goldstein Theatre'
        when 'HH' then 'Honors Hall'
        when 'IB' then 'I Building'
        when 'JH' then 'Jefferson Hall'
        when 'KY' then 'Kiely Hall'
        when 'KG' then 'King Hall'
        when 'KS' then 'Kissena Hall'
        when 'KP' then 'Klapper Hall'
        when 'MU' then 'Music Building'
        when 'PH' then 'Powdermaker Hall'
        when 'QH' then 'Queens Hall'
        when 'RA' then 'Rathaus Hall'
        when 'RZ' then 'Razran Hall'
        when 'RE' then 'Remsen Hall'
        when 'RO' then 'Rosenthal Library'
        when 'SB' then 'Science Building'
        when 'SU' then 'Student Union'
        when 'SA' then 'Summit Apartments'
		ELSE N'Not Available'
  END AS categoryname,@UserAuthorizationKey
	FROM [Uploadfile].[RevisedTable]

	UPDATE [Location].[Building]
SET BuildingCode = N'TBA'
WHERE BuildingCode = N' '
	
	DECLARE @endtime AS DATETIME2(7) = SYSDATETIME()
	DECLARE @rowcount AS INT 
	SELECT @rowcount = COUNT(*) FROM [Location].[Building]

	PRINT 'Loaded Building Table'

	 EXEC [Process].[usp_TrackWorkFlow] N'Load Building',@rowcount,@starttime,@endtime,@UserAuthorizationKey
END
GO

