USE [_connector]
GO
/****** Object:  Table [dbo].[UserSessions]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSessions](
	[UserSessionsID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL DEFAULT (getdate()),
	[EndTime] [datetime] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[UserSessionsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
