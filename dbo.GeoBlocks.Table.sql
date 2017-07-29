USE [_connector]
GO
/****** Object:  Table [dbo].[GeoBlocks]    Script Date: 7/28/2017 10:17:13 PM ******/
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
/****** Object:  Index [StartIPEndIPClustered]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE UNIQUE CLUSTERED INDEX [StartIPEndIPClustered] ON [dbo].[GeoBlocks]
(
	[StartIPNum] ASC,
	[EndIPNumb] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
