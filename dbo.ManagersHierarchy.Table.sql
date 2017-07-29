USE [_connector]
GO
/****** Object:  Table [dbo].[ManagersHierarchy]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagersHierarchy](
	[ManagersHierarchyID] [int] IDENTITY(1,1) NOT NULL,
	[ManagersID] [int] NULL,
	[HeadCoachID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ManagersHierarchyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
