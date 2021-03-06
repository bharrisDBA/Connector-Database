USE [_connector]
GO
/****** Object:  Table [dbo].[Activation]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activation](
	[Code] [nvarchar](20) NOT NULL,
	[UserID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
