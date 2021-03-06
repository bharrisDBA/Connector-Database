USE [_connector]
GO
/****** Object:  Table [dbo].[Emails]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Emails](
	[EmailID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](255) NULL,
	[Body] [nvarchar](max) NULL,
	[DateSubmitted] [datetime] NOT NULL DEFAULT (getdate()),
	[EmailFrom] [nvarchar](255) NULL,
	[Sent] [bit] NOT NULL CONSTRAINT [DF_Emails_Sent]  DEFAULT ((0)),
	[EmailTo] [nvarchar](255) NULL,
	[bounceCount] [int] NOT NULL CONSTRAINT [DF_Emails_bounceCount]  DEFAULT ((0)),
	[DateToSend] [datetime] NULL,
	[textBody] [nvarchar](max) NULL,
	[notation] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
