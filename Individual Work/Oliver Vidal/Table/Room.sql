USE [QueensClassSchedule]
GO

/****** Object:  Table [Location].[Room]    Script Date: 12/5/2022 11:02:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Location].[Room](
	[RoomID] [UDT].[SurrogateKey] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [UDT].[DepartmentCode] NOT NULL,
	[BuildingID] [UDT].[SurrogateKey] NULL,
	[UserAuthorizationKey] [UDT].[SurrogateKey] NOT NULL,
	[DateAdded] [UDT].[DateAdded] NULL,
	[DateOfLastUpdate] [UDT].[DateOfLastUpdate] NULL,
 CONSTRAINT [PK_RoomID] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Location].[Room] ADD  CONSTRAINT [DF_Location.Room_DateAdded]  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [Location].[Room] ADD  CONSTRAINT [DF_Location.Room_DateOfLastUpdate]  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO

ALTER TABLE [Location].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Building] FOREIGN KEY([BuildingID])
REFERENCES [Location].[Building] ([BuildingID])
GO

ALTER TABLE [Location].[Room] CHECK CONSTRAINT [FK_Room_Building]
GO

ALTER TABLE [Location].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_UserAuthorization] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO

ALTER TABLE [Location].[Room] CHECK CONSTRAINT [FK_Room_UserAuthorization]
GO

