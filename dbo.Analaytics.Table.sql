USE [_connector]
GO
/****** Object:  Table [dbo].[Analaytics]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Analaytics](
	[AnalyticsID] [int] IDENTITY(1,1) NOT NULL,
	[DataType] [nchar](10) NOT NULL,
	[Date] [date] NOT NULL,
	[Data1] [nvarchar](50) NOT NULL,
	[Data2] [nvarchar](50) NULL,
	[Count] [int] NULL
) ON [PRIMARY]

GO
