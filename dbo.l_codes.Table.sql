USE [_connector]
GO
/****** Object:  Table [dbo].[l_codes]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[l_codes](
	[l_id] [int] IDENTITY(1,1) NOT NULL,
	[l_code] [nvarchar](5) NULL,
	[l_lang] [nvarchar](50) NULL,
	[RightToLeft] [bit] NOT NULL DEFAULT ((0)),
	[IsInterfaceLang] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_l_codes] PRIMARY KEY CLUSTERED 
(
	[l_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20160506-101450]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160506-101450] ON [dbo].[l_codes]
(
	[l_id] ASC,
	[RightToLeft] ASC,
	[IsInterfaceLang] ASC
)
INCLUDE ( 	[l_code],
	[l_lang]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
