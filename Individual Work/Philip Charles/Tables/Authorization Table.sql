USE [QueensClassSchedule]
GO

/****** Object:  Table [DbSecurity].[UserAuthorization]    Script Date: 11/21/2022 10:07:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [DbSecurity].[UserAuthorization](
	[UserAuthorizationKey] [UDT].[SurrogateKey] IDENTITY(1,1) NOT NULL,
	[ClassTime] [UDT].[ClassTime] NULL,
	[IndividualProject] [UDT].[IndividualProject] NULL,
	[GroupMemberLastName] [UDT].[LastName] NOT NULL,
	[GroupMemberFirstName] [UDT].[FirstName] NOT NULL,
	[GroupName] [UDT].[GroupName] NOT NULL,
	[DateAdded] [UDT].[DateAdded] NULL,
	[DateOfLastUpdate] [UDT].[DateOfLastUpdate] NOT NULL,
 CONSTRAINT [PK_DbSecurity.UserAuthorization] PRIMARY KEY CLUSTERED 
(
	[UserAuthorizationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [DbSecurity].[UserAuthorization] ADD  CONSTRAINT [DF_DbSecurity.UserAuthorization_ClassTime]  DEFAULT (N'10:45') FOR [ClassTime]
GO

ALTER TABLE [DbSecurity].[UserAuthorization] ADD  CONSTRAINT [DF_DbSecurity.UserAuthorization_IndividualProject]  DEFAULT (N'Project 3') FOR [IndividualProject]
GO

ALTER TABLE [DbSecurity].[UserAuthorization] ADD  CONSTRAINT [DF_DbSecurity.UserAuthorization_GroupName]  DEFAULT (N'Group2') FOR [GroupName]
GO

ALTER TABLE [DbSecurity].[UserAuthorization] ADD  CONSTRAINT [DF_DbSecurity.UserAuthorization_DateAdded]  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [DbSecurity].[UserAuthorization] ADD  CONSTRAINT [DF_DbSecurity.UserAuthorization_DateOfLastUpdate]  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO

