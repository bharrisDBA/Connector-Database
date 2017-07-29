USE [_connector]
GO
/****** Object:  Table [dbo].[ConnectionsByCoach]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConnectionsByCoach](
	[ConnectionsByCoachID] [int] IDENTITY(1,1) NOT NULL,
	[InquirerID] [int] NULL,
	[UserID] [int] NULL,
	[ConversationID] [int] NULL,
	[TeamID] [int] NULL,
	[Comments] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ConnectionsByCoachID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
