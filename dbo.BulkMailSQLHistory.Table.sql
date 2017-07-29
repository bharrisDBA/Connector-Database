USE [_connector]
GO
/****** Object:  Table [dbo].[BulkMailSQLHistory]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BulkMailSQLHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SQLCommand] [nvarchar](max) NULL,
	[DateSaved] [datetime] NULL,
	[html] [nvarchar](max) NULL,
	[plain] [nvarchar](max) NULL,
	[subject] [nvarchar](250) NULL,
	[emailfrom] [nvarchar](150) NULL,
 CONSTRAINT [PK_BulkMailSQLHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
