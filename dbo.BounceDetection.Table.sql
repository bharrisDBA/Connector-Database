USE [_connector]
GO
/****** Object:  Table [dbo].[BounceDetection]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BounceDetection](
	[bounceid] [int] IDENTITY(1,1) NOT NULL,
	[detectphrase] [nvarchar](100) NULL,
	[locateemail] [nchar](50) NULL,
	[errorcode] [nchar](10) NULL,
	[bouncetype] [nchar](10) NULL
) ON [PRIMARY]

GO
