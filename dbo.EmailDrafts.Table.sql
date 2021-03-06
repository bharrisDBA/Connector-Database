USE [_connector]
GO
/****** Object:  Table [dbo].[EmailDrafts]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailDrafts](
	[DraftID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ConversationID] [int] NULL,
	[LastTime] [datetime] NULL,
	[DraftText] [nvarchar](max) NULL,
	[InquirerID] [int] NULL,
	[DraftSubject] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[DraftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
