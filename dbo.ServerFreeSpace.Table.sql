USE [_connector]
GO
/****** Object:  Table [dbo].[ServerFreeSpace]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServerFreeSpace](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Drive] [char](1) NULL,
	[MB_Free] [int] NULL,
	[GB_Free] [int] NULL,
	[DateRecorded] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
