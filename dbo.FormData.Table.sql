USE [_connector]
GO
/****** Object:  Table [dbo].[FormData]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormData](
	[FormDataID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[FormFieldID] [int] NOT NULL,
	[Data] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[FormDataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [nonClusteredFormFieldID]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [nonClusteredFormFieldID] ON [dbo].[FormData]
(
	[UserID] ASC,
	[FormFieldID] ASC
)
INCLUDE ( 	[FormDataID],
	[Data],
	[CreateDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredOnFormFieldIDWithData]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredOnFormFieldIDWithData] ON [dbo].[FormData]
(
	[FormFieldID] ASC
)
INCLUDE ( 	[Data]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
