USE [_connector]
GO
/****** Object:  Table [dbo].[CustomReportData]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomReportData](
	[custReportDataID] [int] IDENTITY(1,1) NOT NULL,
	[custReportID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[custReportData] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
