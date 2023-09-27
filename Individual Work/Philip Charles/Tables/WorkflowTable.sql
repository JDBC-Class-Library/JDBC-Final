USE [QueensClassSchedule]
GO

/****** Object:  Table [Process].[WorkflowSteps]    Script Date: 11/21/2022 10:07:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Process].[WorkflowSteps](
	[WorkFlowStepKey] [UDT].[SurrogateKey] IDENTITY(1,1) NOT NULL,
	[WorkFlowStepDescription] [UDT].[WFSDescription] NOT NULL,
	[WorkFlowStepTableRowCount] [UDT].[WFSRowCount] NULL,
	[StartingDateTime] [UDT].[StartTime] NULL,
	[EndingDateTime] [UDT].[EndTime] NULL,
	[ClassTime] [UDT].[ClassTime] NULL,
	[UserAuthorizationKey] [UDT].[SurrogateKey] NOT NULL,
	[DateAdded] [UDT].[DateAdded] NOT NULL,
	[DateOfLastUpdate] [UDT].[DateOfLastUpdate] NOT NULL,
 CONSTRAINT [PK_Process.WorkflowSteps] PRIMARY KEY CLUSTERED 
(
	[WorkFlowStepKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Process].[WorkflowSteps] ADD  CONSTRAINT [DF_Process.WorkflowSteps_WorkFlowStepTableRowCount]  DEFAULT ((0)) FOR [WorkFlowStepTableRowCount]
GO

ALTER TABLE [Process].[WorkflowSteps] ADD  CONSTRAINT [DF_Process.WorkflowSteps_StartingDateDateTime]  DEFAULT (sysdatetime()) FOR [StartingDateTime]
GO

ALTER TABLE [Process].[WorkflowSteps] ADD  CONSTRAINT [DF_Process.WorkflowSteps_EndingDateTime]  DEFAULT (sysdatetime()) FOR [EndingDateTime]
GO

ALTER TABLE [Process].[WorkflowSteps] ADD  CONSTRAINT [DF_Process.WorkflowSteps_ClassTime]  DEFAULT ('10:45') FOR [ClassTime]
GO

ALTER TABLE [Process].[WorkflowSteps] ADD  CONSTRAINT [DF_Process.WorkflowSteps_DateAdded]  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [Process].[WorkflowSteps] ADD  CONSTRAINT [DF_Process.WorkflowSteps_DateOfLastUpdate]  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO

