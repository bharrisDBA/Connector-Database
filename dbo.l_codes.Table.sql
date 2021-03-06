USE [_connector]
GO
/****** Object:  Table [dbo].[l_codes]    Script Date: 8/16/2017 8:45:17 PM ******/
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
