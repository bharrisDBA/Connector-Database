USE [_connector]
GO
/****** Object:  Table [dbo].[tmpunanswered]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpunanswered](
	[conversationid] [int] NULL,
	[connectorid] [int] NULL,
	[inquirerid] [int] NULL,
	[datesent] [datetime] NULL
) ON [PRIMARY]

GO
