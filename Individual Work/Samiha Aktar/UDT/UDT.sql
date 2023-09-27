-- =============================================
-- Author: Samiha Aktar
-- Create date: 11/27/2022
-- Description: Mode of Instruction Table's UDT
-- =============================================

/****** Object:  UserDefinedDataType [Udt].[ModeOfInstructionID]    Script Date: 11/27/2022 10:49:25 PM ******/
CREATE TYPE [Udt].[ModeOfInstructionID] FROM [int] NOT NULL
GO


/****** Object:  UserDefinedDataType [Udt].[ModeOfInstructionName]    Script Date: 11/27/2022 10:49:25 PM ******/
CREATE TYPE [Udt].[ModeOfInstructionName] FROM [nvarchar](20) NOT NULL
GO