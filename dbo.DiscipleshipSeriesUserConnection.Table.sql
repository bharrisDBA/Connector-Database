USE [_connector]
GO
/****** Object:  Table [dbo].[DiscipleshipSeriesUserConnection]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscipleshipSeriesUserConnection](
	[SeriesUserConnectionID] [int] IDENTITY(1,1) NOT NULL,
	[SeriesID] [int] NULL,
	[UserID] [int] NULL,
	[LastSection] [int] NULL,
	[StartDate] [datetime] NULL,
	[UnsubscribeToken] [nchar](36) NULL,
PRIMARY KEY CLUSTERED 
(
	[SeriesUserConnectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
