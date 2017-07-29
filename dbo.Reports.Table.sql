USE [_connector]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reports](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[ReportName] [nvarchar](255) NULL,
	[ReportType] [nvarchar](255) NULL,
	[ReportStatement] [nvarchar](max) NULL,
	[NeedUserID] [bit] NULL,
	[RequestStartDateEndDate] [bit] NULL,
	[RequestCountry] [bit] NULL,
	[RequestLanguage] [bit] NULL,
	[ProcVars] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
