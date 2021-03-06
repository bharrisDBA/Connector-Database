USE [_connector]
GO
/****** Object:  Table [dbo].[l_tags]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[l_tags](
	[l_tid] [int] IDENTITY(1,1) NOT NULL,
	[l_tag] [nvarchar](max) NULL,
 CONSTRAINT [PK_l_tags] PRIMARY KEY CLUSTERED 
(
	[l_tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
