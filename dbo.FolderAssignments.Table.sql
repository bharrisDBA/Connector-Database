USE [_connector]
GO
/****** Object:  Table [dbo].[FolderAssignments]    Script Date: 8/16/2017 8:45:17 PM ******/
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
