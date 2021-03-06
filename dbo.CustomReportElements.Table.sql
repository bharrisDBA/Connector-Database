USE [_connector]
GO
/****** Object:  Table [dbo].[CustomReportElements]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomReportElements](
	[custReportId] [int] IDENTITY(1,1) NOT NULL,
	[custReportCode] [nchar](10) NOT NULL,
	[custReportElementType] [nchar](10) NOT NULL,
	[custReportField] [nchar](30) NULL,
	[custReportFieldName] [ntext] NULL,
	[custReportFieldRequired] [bit] NULL,
	[custReportFieldType] [nchar](10) NULL,
	[custReportFieldOrder] [int] NULL,
	[custReportData] [ntext] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
