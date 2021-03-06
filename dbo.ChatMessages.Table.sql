USE [_connector]
GO
/****** Object:  Table [dbo].[ChatMessages]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatMessages](
	[ChatID] [int] IDENTITY(1,1) NOT NULL,
	[ConversationID] [int] NOT NULL,
	[Message] [nvarchar](255) NULL,
	[UserFrom] [int] NOT NULL,
	[DateTimeSent] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ChatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
