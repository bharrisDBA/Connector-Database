USE [_connector]
GO
/****** Object:  Table [dbo].[InquirerExtension]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InquirerExtension](
	[ExtensionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL DEFAULT (NULL),
	[ConnectorID] [int] NULL DEFAULT (NULL),
	[DateAssigned] [datetime] NULL,
	[GroupID] [int] NULL,
	[TeamID] [int] NULL,
 CONSTRAINT [PK_InquirerExtension] PRIMARY KEY CLUSTERED 
(
	[ExtensionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
