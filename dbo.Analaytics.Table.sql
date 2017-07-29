USE [_connector]
GO
/****** Object:  Table [dbo].[Analaytics]    Script Date: 7/28/2017 10:17:13 PM ******/
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
SET ANSI_PADDING ON

GO
/****** Object:  Index [ClusteredIndex-20161115-125700]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE CLUSTERED INDEX [ClusteredIndex-20161115-125700] ON [dbo].[Analaytics]
(
	[DataType] ASC,
	[Date] ASC,
	[Data1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
