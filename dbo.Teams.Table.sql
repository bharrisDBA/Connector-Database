USE [_connector]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 7/28/2017 10:17:13 PM ******/
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
/****** Object:  Index [Full_Index]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [Full_Index] ON [dbo].[Teams]
(
	[TeamID] ASC,
	[TeamCoachID] ASC,
	[HeadCoachID] ASC,
	[TeamChatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
