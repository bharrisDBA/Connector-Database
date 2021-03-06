USE [_connector]
GO
/****** Object:  Table [dbo].[DiscipleshipSeries]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscipleshipSeries](
	[SeriesID] [int] IDENTITY(1,1) NOT NULL,
	[SeriesName] [nvarchar](255) NULL,
	[SeriesLanguage] [nvarchar](255) NULL,
	[SeriesLength] [int] NULL,
	[SeriesDescription] [nvarchar](1000) NULL,
	[Regularity] [nvarchar](255) NULL,
	[SeriesDescriptionHTML] [nvarchar](1000) NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF_DiscipleshipSeries_Active]  DEFAULT ((1)),
	[Topic] [nchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SeriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
