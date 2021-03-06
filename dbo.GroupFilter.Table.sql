USE [_connector]
GO
/****** Object:  Table [dbo].[GroupFilter]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupFilter](
	[GroupFilterID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[FilterID] [int] NOT NULL,
	[FilterType] [int] NOT NULL,
	[Exclude] [bit] NOT NULL CONSTRAINT [DF_GroupFilter_Exclude]  DEFAULT ((0)),
 CONSTRAINT [PK_GroupFilter] PRIMARY KEY CLUSTERED 
(
	[GroupFilterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
