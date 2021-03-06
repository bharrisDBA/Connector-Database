USE [_connector]
GO
/****** Object:  Table [dbo].[UserSettings]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSettings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[DateDisplay] [nvarchar](255) NULL,
	[InterfaceLanguage] [nvarchar](255) NULL,
	[ItemsPerPage] [int] NULL,
	[NewMessage] [nvarchar](255) NULL,
	[UnreadMessage] [nvarchar](255) NULL,
	[UnansweredMessage] [nvarchar](255) NULL,
	[InQueues] [nvarchar](255) NULL,
	[QueuesOver48Hours] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
