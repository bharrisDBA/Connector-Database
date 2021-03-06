USE [_connector]
GO
/****** Object:  Table [dbo].[ResponseTemplate]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResponseTemplate](
	[TemplateID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [varchar](64) NOT NULL,
	[Subject] [nvarchar](64) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[DecisionType] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[FilterID] [int] NULL,
	[Weight] [int] NOT NULL DEFAULT ((-1)),
	[IsDefault] [bit] NOT NULL DEFAULT ((0)),
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_ResponseTemplate_DateCreated]  DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[TemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ResponseTemplate]  WITH CHECK ADD FOREIGN KEY([LanguageID])
REFERENCES [dbo].[l_codes] ([l_id])
GO
