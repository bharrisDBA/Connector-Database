USE [_connector]
GO
/****** Object:  Table [dbo].[FormFields]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormFields](
	[FormFieldID] [int] IDENTITY(1,1) NOT NULL,
	[FieldType] [int] NOT NULL,
	[DisplayName] [nvarchar](32) NOT NULL,
	[DisplayOrder] [int] NULL,
	[IsPermanent] [bit] NOT NULL DEFAULT ((0)),
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[DefaultValue] [nvarchar](max) NULL,
	[ValidationType] [int] NOT NULL CONSTRAINT [DF_FormFields_ValidationType]  DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[FormFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
