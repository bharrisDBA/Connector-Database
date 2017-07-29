USE [_connector]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 7/28/2017 10:17:13 PM ******/
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
SET ANSI_PADDING ON

GO
/****** Object:  Index [ClusteredIndex-20160929-145133]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE CLUSTERED INDEX [ClusteredIndex-20160929-145133] ON [dbo].[Languages]
(
	[thisLangCode] ASC,
	[languageCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClustered_Code_ThisCode]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [NonClustered_Code_ThisCode] ON [dbo].[Languages]
(
	[languageCode] ASC
)
INCLUDE ( 	[languageName],
	[thisLangCode]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
