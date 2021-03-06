USE [_connector]
GO
/****** Object:  Table [dbo].[l_pages]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[l_pages](
	[p_id] [int] IDENTITY(1,1) NOT NULL,
	[p_memo] [nvarchar](100) NULL,
 CONSTRAINT [PK_l_pages] PRIMARY KEY CLUSTERED 
(
	[p_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
