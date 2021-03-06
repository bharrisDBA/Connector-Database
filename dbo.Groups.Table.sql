USE [_connector]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](32) NOT NULL,
	[ExpirationTime] [int] NOT NULL DEFAULT ((0)),
	[CreateDate] [datetime] NOT NULL DEFAULT (getdate()),
	[ForwardGroupID] [int] NOT NULL DEFAULT ((0)),
	[GroupDescription] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
