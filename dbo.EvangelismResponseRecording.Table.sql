USE [_connector]
GO
/****** Object:  Table [dbo].[EvangelismResponseRecording]    Script Date: 8/16/2017 8:45:17 PM ******/
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
