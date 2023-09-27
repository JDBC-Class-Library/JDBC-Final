USE [QueensClassSchedule]
GO

/****** Object:  Table [HR].[Department]    Script Date: 11/29/2022 9:41:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [HR].[Department](
	[departmentId] [UDT].[SurrogateKey] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [UDT].[DepartmentCode] NOT NULL,
	[DepartmentName] [UDT].[DepartmentName] NULL,
	[UserAuthorizationKey] [UDT].[SurrogateKey] NOT NULL,
	[DateAdded] [UDT].[DateAdded] NULL,
	[DateOfLastUpdate] [UDT].[DateOfLastUpdate] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[departmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [HR].[Department] ADD  CONSTRAINT [DF_HR.Department_DateAdded]  DEFAULT (SYSDATETIME()) FOR [DateAdded]
GO

ALTER TABLE [HR].[Department] ADD  CONSTRAINT [DF_HR.Department_DateOfLastUpdate]  DEFAULT (SYSDATETIME()) FOR [DateOfLastUpdate]
GO

ALTER TABLE [HR].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_UserAuthorization] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO

ALTER TABLE [HR].[Department] CHECK CONSTRAINT [FK_Department_UserAuthorization]
GO


