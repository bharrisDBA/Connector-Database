USE [_connector]
GO
/****** Object:  Table [dbo].[tmpMiscData]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpMiscData](
	[dateentered] [datetime] NULL,
	[entrytype] [nvarchar](50) NULL,
	[entry] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
