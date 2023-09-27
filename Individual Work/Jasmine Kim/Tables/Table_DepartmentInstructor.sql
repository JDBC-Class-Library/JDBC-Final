USE [QueensClassSchedule]
GO

/****** Object:  Table [HR].[DepartmentInstructor]    Script Date: 11/29/2022 9:41:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [HR].[DepartmentInstructor](
	[DepartmentID] [UDT].[SurrogateKey] NOT NULL,
	[InstructorNum] [UDT].[SurrogateKey] NOT NULL,
	[UserAuthorizationKey] [UDT].[SurrogateKey] NOT NULL,
	[DateAdded] [UDT].[DateAdded] NOT NULL,
	[dateOfLastUpdate] [UDT].[DateOfLastUpdate] NOT NULL,
 CONSTRAINT [PK_DeptInstructor] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC,
	[InstructorNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [HR].[DepartmentInstructor] ADD  CONSTRAINT [DF_DeptInstructor_DateAdded]  DEFAULT (SYSDATETIME()) FOR [DateAdded]
GO

ALTER TABLE [HR].[DepartmentInstructor] ADD  CONSTRAINT [DF_DeptInstructor_DateOfLastUpdate]  DEFAULT (SYSDATETIME()) FOR [dateOfLastUpdate]
GO

ALTER TABLE [HR].[DepartmentInstructor]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentInstructor_Department] FOREIGN KEY([DepartmentID])
REFERENCES [HR].[Department] ([departmentId])
GO

ALTER TABLE [HR].[DepartmentInstructor] CHECK CONSTRAINT [FK_DepartmentInstructor_Department]
GO

ALTER TABLE [HR].[DepartmentInstructor]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentInstructor_Instructor] FOREIGN KEY([InstructorNum])
REFERENCES [HR].[Instructor] ([InstructorNum])
GO

ALTER TABLE [HR].[DepartmentInstructor] CHECK CONSTRAINT [FK_DepartmentInstructor_Instructor]
GO

ALTER TABLE [HR].[DepartmentInstructor]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentInstructor_UserAuthorization] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO

ALTER TABLE [HR].[DepartmentInstructor] CHECK CONSTRAINT [FK_DepartmentInstructor_UserAuthorization]
GO

ALTER TABLE [HR].[DepartmentInstructor]  WITH CHECK ADD  CONSTRAINT [FK_DeptartmentInstructor_UserAuthorization] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO

ALTER TABLE [HR].[DepartmentInstructor] CHECK CONSTRAINT [FK_DeptartmentInstructor_UserAuthorization]
GO


