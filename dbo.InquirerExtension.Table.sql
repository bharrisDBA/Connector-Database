USE [_connector]
GO
/****** Object:  Table [dbo].[InquirerExtension]    Script Date: 7/28/2017 10:17:13 PM ******/
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
/****** Object:  Index [connectorUserID]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [connectorUserID] ON [dbo].[InquirerExtension]
(
	[ConnectorID] ASC
)
INCLUDE ( 	[UserID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20160813-161009]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160813-161009] ON [dbo].[InquirerExtension]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
