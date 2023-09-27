USE [QueensClassSchedule]
GO

/****** Object:  Table [Schedule].[ClassDayTime]    Script Date: 11/29/2022 9:43:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Schedule].[ClassDayTime](
	[ClassTimeID] [UDT].[SurrogateKey] IDENTITY(1,1) NOT NULL,
	[ClassDay] [UDT].[CourseClassDay] NOT NULL,
	[ClassTime] [UDT].[CourseClassTime] NOT NULL,
	[UserAuthorizationKey] [UDT].[SurrogateKey] NOT NULL,
	[DateAdded] [UDT].[DateAdded] NOT NULL,
	[dateOfLastUpdate] [UDT].[DateOfLastUpdate] NOT NULL,
 CONSTRAINT [PK_ClassDayTime] PRIMARY KEY CLUSTERED 
(
	[ClassTimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Schedule].[ClassDayTime] ADD  CONSTRAINT [DF_ClassDayTime_DateAdded]  DEFAULT (SYSDATETIME()) FOR [DateAdded]
GO

ALTER TABLE [Schedule].[ClassDayTime] ADD  CONSTRAINT [DF__ClassDayTime_DateOfLastUpdate]  DEFAULT (SYSDATETIME()) FOR [dateOfLastUpdate]
GO

ALTER TABLE [Schedule].[ClassDayTime]  WITH CHECK ADD  CONSTRAINT [FK_ClassDayTime_UserAuthorization] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO

ALTER TABLE [Schedule].[ClassDayTime] CHECK CONSTRAINT [FK_ClassDayTime_UserAuthorization]
GO


