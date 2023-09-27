USE [QueensClassSchedule]
GO

/****** Object:  Table [HR].[Instructor]    Script Date: 11/29/2022 9:42:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [HR].[Instructor](
	[InstructorNum] [UDT].[SurrogateKey] IDENTITY(1,1) NOT NULL,
	[FirstName] [UDT].[FirstName] NOT NULL,
	[LastName] [UDT].[LastName] NOT NULL,
	[UserAuthorizationKey] [UDT].[SurrogateKey] NOT NULL,
	[DateAdded] [UDT].[DateAdded] NOT NULL,
	[dateOfLastUpdate] [UDT].[DateOfLastUpdate] NOT NULL,
	[FullName]  AS (CONCAT([LastName],N', ',[FirstName])) PERSISTED NOT NULL,
	[Email]  AS (CONCAT([FirstName],'.',[LastName],'@qc.cuny.edu')) PERSISTED NOT NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[InstructorNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [HR].[Instructor] ADD  CONSTRAINT [DF_Instructor_DateAdded]  DEFAULT (SYSDATETIME()) FOR [DateAdded]
GO

ALTER TABLE [HR].[Instructor] ADD  CONSTRAINT [DF_Instructor_DateOfLastUpdate]  DEFAULT (SYSDATETIME()) FOR [dateOfLastUpdate]
GO

ALTER TABLE [HR].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_UserAuthorization] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO

ALTER TABLE [HR].[Instructor] CHECK CONSTRAINT [FK_Instructor_UserAuthorization]
GO


