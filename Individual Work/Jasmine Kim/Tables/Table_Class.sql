USE [QueensClassSchedule]
GO

/****** Object:  Table [Enrollment].[Class]    Script Date: 12/3/2022 11:42:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Enrollment].[Class](
	[ClassId] [UDT].[SurrogateKey] IDENTITY(1,1) NOT NULL,
	[CourseId] [UDT].[SurrogateKey] NOT NULL,
	[InstructorNum] [UDT].[SurrogateKey] NOT NULL,
	[ModeOfInstructionId] [UDT].[SurrogateKey] NOT NULL,
	[ClassTimeId] [UDT].[SurrogateKey] NOT NULL,
	[RoomId] [UDT].[SurrogateKey] NOT NULL,
	[UserAuthorizationKey] [UDT].[SurrogateKey] NOT NULL,
	[DateAdded] [UDT].[DateAdded] NOT NULL,
	[dateOfLastUpdate] [UDT].[DateOfLastUpdate] NOT NULL,
	[ClassCode] [UDT].[ClassCode] NOT NULL,
	[ClassSection] [UDT].[ClassSection] NOT NULL,
	[MaxEnrollment] [UDT].[MaxEnrollment] NULL,
	[Enrollment] [UDT].[Enrollment] NULL,
	[Waitlist]  AS ([Enrollment]-[MaxEnrollment]),
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Enrollment].[Class] ADD  CONSTRAINT [DF_Class_DateAdded]  DEFAULT (SYSDATETIME()) FOR [DateAdded]
GO

ALTER TABLE [Enrollment].[Class] ADD  CONSTRAINT [DF__Class_DateOfLastUpdate]  DEFAULT (SYSDATETIME()) FOR [dateOfLastUpdate]
GO

ALTER TABLE [Enrollment].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_ClassDayTime] FOREIGN KEY([ClassTimeId])
REFERENCES [Schedule].[ClassDayTime] ([ClassTimeID])
GO

ALTER TABLE [Enrollment].[Class] CHECK CONSTRAINT [FK_Class_ClassDayTime]
GO

ALTER TABLE [Enrollment].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Course] FOREIGN KEY([CourseId])
REFERENCES [Enrollment].[Course] ([CourseId])
GO

ALTER TABLE [Enrollment].[Class] CHECK CONSTRAINT [FK_Class_Course]
GO

ALTER TABLE [Enrollment].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_InstructionMode] FOREIGN KEY([ModeOfInstructionId])
REFERENCES [Schedule].[InstructionMode] ([ModeOfInstructionID])
GO

ALTER TABLE [Enrollment].[Class] CHECK CONSTRAINT [FK_Class_InstructionMode]
GO

ALTER TABLE [Enrollment].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Instructor] FOREIGN KEY([InstructorNum])
REFERENCES [HR].[Instructor] ([InstructorNum])
GO

ALTER TABLE [Enrollment].[Class] CHECK CONSTRAINT [FK_Class_Instructor]
GO

ALTER TABLE [Enrollment].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Room] FOREIGN KEY([RoomId])
REFERENCES [Ground].[Room] ([roomId])
GO

ALTER TABLE [Enrollment].[Class] CHECK CONSTRAINT [FK_Class_Room]
GO

ALTER TABLE [Enrollment].[Class]  WITH CHECK ADD  CONSTRAINT [CK_Class] CHECK  ((NOT [MaxEnrollment] LIKE '%[^0-9]%' AND NOT [Enrollment] LIKE '%[^0-9]%'))
GO

ALTER TABLE [Enrollment].[Class] CHECK CONSTRAINT [CK_Class]
GO


