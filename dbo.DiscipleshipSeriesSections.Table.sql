USE [_connector]
GO
/****** Object:  Table [dbo].[DiscipleshipSeriesSections]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscipleshipSeriesSections](
	[SectionID] [int] IDENTITY(1,1) NOT NULL,
	[SeriesID] [int] NULL,
	[SeriesLocation] [int] NULL,
	[SectionName] [nvarchar](255) NULL,
	[SectionHTML] [nvarchar](max) NULL,
	[plainText] [nvarchar](max) NULL,
	[sectionhash] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
