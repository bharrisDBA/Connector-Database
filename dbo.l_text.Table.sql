USE [_connector]
GO
/****** Object:  Table [dbo].[l_text]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[l_text](
	[l_text_id] [int] IDENTITY(1,1) NOT NULL,
	[l_tag] [int] NULL,
	[l_code] [int] NULL,
	[l_text] [nvarchar](max) NULL,
 CONSTRAINT [PK_l_text] PRIMARY KEY CLUSTERED 
(
	[l_text_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [NonClusteredIndex-20160506-101553]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160506-101553] ON [dbo].[l_text]
(
	[l_text_id] ASC,
	[l_tag] ASC,
	[l_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
