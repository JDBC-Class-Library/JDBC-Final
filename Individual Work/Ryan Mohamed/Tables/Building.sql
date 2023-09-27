USE [QueensClassSchedule]
GO

/****** Object:  Table [Location].[Building]    Script Date: 12/6/2022 7:29:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Location].[Building](
	[BuildingID] [UDT].[SurrogateKey] IDENTITY(1,1) NOT NULL,
	[BuildingCode] [UDT].[BuildingCode] NOT NULL,
	[BuildingName] [UDT].[BuildingName] NULL,
	[UserAuthorizationKey] [UDT].[SurrogateKey] NOT NULL,
	[DateAdded] [UDT].[DateAdded] NULL,
	[DateOfLastUpdate] [UDT].[DateOfLastUpdate] NULL,
 CONSTRAINT [PK_BuildingID] PRIMARY KEY CLUSTERED 
(
	[BuildingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Location].[Building] ADD  CONSTRAINT [DF_Location.Building_DateAdded]  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [Location].[Building] ADD  CONSTRAINT [DF_Location.Building_DateOfLastUpdate]  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO

ALTER TABLE [Location].[Building]  WITH CHECK ADD  CONSTRAINT [FK_Building_UserAuthorization] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO

ALTER TABLE [Location].[Building] CHECK CONSTRAINT [FK_Building_UserAuthorization]
GO

