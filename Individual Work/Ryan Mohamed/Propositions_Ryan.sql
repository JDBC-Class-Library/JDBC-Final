use [QueensClassScheduleCurrentSemesterTest]

-- =============================================
-- Author:		Ryan Mohamed
-- Create date: 12/08/2022
-- Description:	Propositions
-- =============================================

-- PROPOSITION 01: 

-- Order buildings by the number of classes that 
-- occur in them on Tuesday at 10:45am

;WITH TargetClassCounts AS (
    SELECT r.BuildingID, count(c.ClassId) as NumberOfClasses
    FROM [Enrollment].[Class] as c
        INNER JOIN [Location].[Room] as r
            -- use foreign key for linkage
            ON c.RoomId = r.RoomID 
    WHERE ClassTimeId IN (
        -- subquery returns column of target times, does this class occur then?
        SELECT ClassTimeID
        FROM [Schedule].[ClassDayTime]
        WHERE ClassTime LIKE N'10:45%' AND LEFT(ClassDay, 2) IN ('T', 'T,')
    )
    GROUP BY r.BuildingID
)
SELECT b.BuildingID, 
       b.BuildingName, 
       COALESCE(t.NumberOfClasses, 0) as NumberOfClasses-- count null as 0
FROM [Location].[Building] as b
    LEFT JOIN TargetClassCounts as t -- LEFT JOIN TO PRESERVE NULLS
        ON b.BuildingID = t.BuildingID -- link with primary key
ORDER BY t.NumberOfClasses DESC


-- PROPOSITION 02:

-- Rank each departments classes that occur in Kiely Hall, 
-- the Science Building, or the Music Building
-- by enrollment
-- Break ties with waitlist

;WITH CourseDepartment AS (
    SELECT CourseID,
        CourseDescription, 
        d.DepartmentID,
        d.DepartmentName
    FROM [Enrollment].[Course] as cc
        INNER JOIN [HR].[Department] as d
            ON cc.DepartmentID = d.departmentID 
)
SELECT c.ClassId,
       b.BuildingName, cd.DepartmentName, 
       c.Enrollment,
       DENSE_RANK() OVER (PARTITION BY cd.DepartmentID
                    ORDER BY c.Enrollment DESC, c.Waitlist DESC) as DepRank
FROM [Enrollment].[Class] as c
    INNER JOIN [Location].[Room] as r
        ON c.RoomId = r.RoomID
    INNER JOIN [Location].[Building] as b
        ON r.BuildingID = b.BuildingID
    INNER JOIN [CourseDepartment] as cd
        ON c.CourseId = cd.CourseID
WHERE b.BuildingID IN (
    SELECT BuildingID
    FROM [Location].[Building]
    WHERE BuildingName IN ('Music Building', 'Science Building', 'Kiely Hall')
)

