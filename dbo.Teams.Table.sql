USE [_connector]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[TeamID] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](64) NOT NULL,
	[TeamCoachID] [int] NOT NULL,
	[TeamDescription] [nvarchar](64) NOT NULL,
	[CreateDate] [datetime] NOT NULL DEFAULT (getdate()),
	[HeadCoachID] [int] NULL,
	[TeamChatID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
