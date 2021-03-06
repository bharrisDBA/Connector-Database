USE [_connector]
GO
/****** Object:  Table [dbo].[TempQueue]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempQueue](
	[TempQueueID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[InquirerID] [int] NOT NULL,
	[QueueDate] [datetime] NOT NULL,
	[DateInserted] [datetime] NOT NULL CONSTRAINT [DF_TempQueue_DateInserted]  DEFAULT (getdate()),
	[TeamID] [int] NULL,
	[ConnectorID] [int] NULL,
	[Comments] [nvarchar](max) NULL,
	[GroupID] [int] NULL,
 CONSTRAINT [PK_TempQueue] PRIMARY KEY CLUSTERED 
(
	[TempQueueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
