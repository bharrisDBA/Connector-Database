USE [_connector]
GO
/****** Object:  Table [dbo].[Conversation]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversation](
	[ConversationID] [int] IDENTITY(1,1) NOT NULL,
	[ConversationTypeID] [int] NOT NULL,
	[LastMessageDate] [datetime] NULL,
	[LastAuthorID] [int] NULL,
	[LastRecipientID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ConversationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
