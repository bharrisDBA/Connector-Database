USE [_connector]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[langID] [int] IDENTITY(1,1) NOT NULL,
	[languageCode] [nchar](10) NOT NULL,
	[languageName] [nvarchar](50) NOT NULL,
	[thisLangCode] [nchar](10) NOT NULL
) ON [PRIMARY]

GO
