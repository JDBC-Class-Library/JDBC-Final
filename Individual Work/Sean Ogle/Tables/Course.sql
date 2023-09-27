USE [QueensClassSchedule]
GO

/****** Object:  Table [Enrollment].[Course]    Script Date: 12/6/2022 7:12:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Enrollment].[Course](
	[CourseID] [UDT].[SurrogateKey] IDENTITY(1,1) NOT NULL,
	[CourseCode] [UDT].[CourseCode] NOT NULL,
	[CourseName] [UDT].[CourseName] NULL,
	[CourseDescription] [UDT].[CourseDescription] NULL,
	[CourseCredit] [UDT].[CourseCredit] NULL,
	[CourseHour] [UDT].[CourseHour] NULL,
	[DepartmentID] [UDT].[SurrogateKey] NOT NULL,
	[UserAuthorizationKey] [UDT].[SurrogateKey] NOT NULL,
	[DateAdded] [UDT].[DateAdded] NULL,
	[DateOfLastUpdate] [UDT].[DateOfLastUpdate] NULL,
 CONSTRAINT [PK_CourseID] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Enrollment].[Course] ADD  CONSTRAINT [DF_Enrollment.Course_DateAdded]  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [Enrollment].[Course] ADD  CONSTRAINT [DF_Enrollment.Course_DateOfLastUpdate]  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO

ALTER TABLE [Enrollment].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([DepartmentID])
REFERENCES [HR].[Department] ([departmentId])
GO

ALTER TABLE [Enrollment].[Course] CHECK CONSTRAINT [FK_Course_Department]
GO

ALTER TABLE [Enrollment].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_UserAuthorization] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO

ALTER TABLE [Enrollment].[Course] CHECK CONSTRAINT [FK_Course_UserAuthorization]
GO

