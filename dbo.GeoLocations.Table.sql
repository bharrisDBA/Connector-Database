USE [_connector]
GO
/****** Object:  Table [dbo].[GeoLocations]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeoLocations](
	[LocationID] [int] NULL,
	[CountryCode] [nvarchar](4) NULL,
	[Region] [nvarchar](4) NULL,
	[City] [nvarchar](200) NULL,
	[TimeZone] [nvarchar](50) NULL
) ON [PRIMARY]

GO
