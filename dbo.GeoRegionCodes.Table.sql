USE [_connector]
GO
/****** Object:  Table [dbo].[GeoRegionCodes]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeoRegionCodes](
	[GeoRegionCodeID] [int] IDENTITY(1,1) NOT NULL,
	[CountryCode] [nvarchar](2) NULL,
	[Region] [nvarchar](10) NULL,
	[RegionName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[GeoRegionCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
