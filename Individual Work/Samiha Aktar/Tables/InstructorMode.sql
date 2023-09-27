USE [QueensClassSchedule]
GO

/****** Object:  Table [Location].[InstructionMode]    Script Date: 12/5/2022 11:01:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Location].[InstructionMode](
	[InstructionModeID] [UDT].[SurrogateKey] IDENTITY(1,1) NOT NULL,
	[Mode] [UDT].[Mode] NOT NULL,
	[UserAuthorizationKey] [UDT].[SurrogateKey] NOT NULL,
	[DateAdded] [UDT].[DateAdded] NULL,
	[DateOfLastUpdate] [UDT].[DateOfLastUpdate] NULL,
 CONSTRAINT [PK_InstructionMode] PRIMARY KEY CLUSTERED 
(
	[InstructionModeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Location].[InstructionMode] ADD  CONSTRAINT [DF_Location.InstructionMode_DateAdded]  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [Location].[InstructionMode] ADD  CONSTRAINT [DF_Location.InstructionMode_DateOfLastUpdate]  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO

ALTER TABLE [Location].[InstructionMode]  WITH CHECK ADD  CONSTRAINT [FK_InstructionMode_UserAuthorization] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO

ALTER TABLE [Location].[InstructionMode] CHECK CONSTRAINT [FK_InstructionMode_UserAuthorization]
GO

ALTER TABLE [Location].[InstructionMode]  WITH CHECK ADD  CONSTRAINT [CK_InstructionMode_Mode] CHECK  (([Mode]=N'In-Person' OR [Mode]=N'Online' OR [Mode]=N'Web-Enhanced' OR [Mode]=N'Hybrid'))
GO

ALTER TABLE [Location].[InstructionMode] CHECK CONSTRAINT [CK_InstructionMode_Mode]
GO

