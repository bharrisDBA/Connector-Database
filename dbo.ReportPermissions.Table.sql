USE [_connector]
GO
/****** Object:  Table [dbo].[ReportPermissions]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportPermissions](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[ReportID] [int] NULL,
	[UserTypeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
