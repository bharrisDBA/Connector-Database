USE [_connector]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[FromUserID] [int] NOT NULL,
	[ConversationID] [int] NOT NULL,
	[Subject] [nvarchar](255) NULL,
	[Message] [nvarchar](max) NULL,
	[DateSent] [datetime] NOT NULL DEFAULT (getdate()),
	[MessageRead] [bit] NOT NULL DEFAULT ((0)),
	[ToUserID] [int] NULL,
	[MessageType] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [NonClusterdToUserIDFromUserid]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [NonClusterdToUserIDFromUserid] ON [dbo].[Messages]
(
	[FromUserID] ASC,
	[ToUserID] ASC
)
INCLUDE ( 	[ConversationID],
	[DateSent]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredDateSent]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredDateSent] ON [dbo].[Messages]
(
	[DateSent] ASC
)
INCLUDE ( 	[ConversationID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-ConversationID]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-ConversationID] ON [dbo].[Messages]
(
	[ConversationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-MessageRead-ToUserID]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-MessageRead-ToUserID] ON [dbo].[Messages]
(
	[MessageRead] ASC,
	[ToUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
