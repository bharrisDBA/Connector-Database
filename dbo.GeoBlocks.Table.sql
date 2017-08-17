USE [_connector]
GO
/****** Object:  Table [dbo].[GeoBlocks]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GeoBlocks](
	[StartIPNum] [bigint] NULL,
	[EndIPNumb] [bigint] NULL,
	[LocationNum] [bigint] NULL,
	[PostalCode] [varchar](50) NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
