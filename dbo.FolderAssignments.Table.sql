USE [_connector]
GO
/****** Object:  Table [dbo].[FolderAssignments]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FolderAssignments](
	[FolderAssignmentsID] [int] IDENTITY(1,1) NOT NULL,
	[FolderID] [int] NULL,
	[ConversationID] [int] NULL,
	[LastMessageToDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FolderAssignmentsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [NonClusteredConversationID]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredConversationID] ON [dbo].[FolderAssignments]
(
	[ConversationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-OnFolderID]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-OnFolderID] ON [dbo].[FolderAssignments]
(
	[FolderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
