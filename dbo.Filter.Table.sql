USE [_connector]
GO
/****** Object:  Table [dbo].[Filter]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filter](
	[FilterID] [int] IDENTITY(1,1) NOT NULL,
	[FilterName] [nvarchar](64) NULL,
	[FilterDescription] [nvarchar](256) NULL,
	[FormFieldData] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL DEFAULT (getdate()),
	[FormFieldID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FilterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Filter]  WITH NOCHECK ADD FOREIGN KEY([FormFieldID])
REFERENCES [dbo].[FormFields] ([FormFieldID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
