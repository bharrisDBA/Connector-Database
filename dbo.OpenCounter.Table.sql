USE [_connector]
GO
/****** Object:  Table [dbo].[OpenCounter]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OpenCounter](
	[opendate] [datetime] NOT NULL,
	[opentype] [varchar](10) NOT NULL,
	[itemid] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
