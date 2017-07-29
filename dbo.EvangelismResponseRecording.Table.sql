USE [_connector]
GO
/****** Object:  Table [dbo].[EvangelismResponseRecording]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvangelismResponseRecording](
	[visitID] [int] IDENTITY(1,1) NOT NULL,
	[IPAddress] [nvarchar](255) NULL,
	[linkTo] [nvarchar](255) NULL,
	[siteOfOrigin] [nvarchar](255) NULL,
	[docURL] [nvarchar](255) NULL,
	[RefURL] [nvarchar](255) NULL,
	[visTime] [datetime] NULL,
	[CountryCode] [nvarchar](255) NULL,
	[CountryName] [nvarchar](255) NULL,
	[Region] [nvarchar](255) NULL,
	[RegionName] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](255) NULL,
	[AreaCode] [nvarchar](255) NULL,
	[DmaCode] [nvarchar](255) NULL,
	[Latitude] [nvarchar](255) NULL,
	[Longitude] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[visitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ix_EvangelismResponseRecording_IPAddress]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [ix_EvangelismResponseRecording_IPAddress] ON [dbo].[EvangelismResponseRecording]
(
	[IPAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredByVisTimeWithcountryCode]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredByVisTimeWithcountryCode] ON [dbo].[EvangelismResponseRecording]
(
	[visTime] ASC
)
INCLUDE ( 	[CountryCode]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20161130-071811]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20161130-071811] ON [dbo].[EvangelismResponseRecording]
(
	[visTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
