use [QueensClassScheduleCurrentSemester];

-- =============================================
-- Author:		Oliver Vidal
-- Create date: 12/10/2022
-- Description:	Propositions
-- =============================================

-- PROPOSITION 01: 


--Get the building names of room numbers that starts with A


WITH GetSpecificRoomNumber AS(

    SELECT r.RoomNumber, r.BuildingID 
    FROM [Location].[Room] as r
    WHERE r.RoomNumber LIKE 'A%'

)

SELECT r.RoomNumber, b.BuildingName 
FROM GetSpecificRoomNumber as r
INNER JOIN [Location].[Building] as b
ON r.BuildingId = b.BuildingID 


GO

-- PREPOSITION 2

--Get building code with room numbers in one columnthat belongs to
--Building 10-20 for only room numbers that are 3 digits finally 
--Dispaly it in the building codes rank order



WITH All3DigitRoom AS(

    SELECT r.RoomNumber, r.BuildingID
    FROM [Location].[Room] as r
    WHERE LEN(r.RoomNumber) = 3

)

SELECT b.BuildingCode + a.RoomNumber as buildingCodeAndRoom 
FROM All3DigitRoom as a
INNER JOIN [Location].[Building] as b
ON a.BuildingID = b.BuildingID
WHERE b.BuildingID BETWEEN 10 AND 20
ORDER BY b.BuildingCode ASC


GO



