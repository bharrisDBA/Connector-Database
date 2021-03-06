USE [_connector]
GO
/****** Object:  Table [dbo].[Inquiries]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inquiries](
	[UserID] [int] NOT NULL,
	[DecisionToday] [int] NULL,
	[DateSubmitted] [datetime] NOT NULL DEFAULT (getdate()),
	[FirstContactURL] [varchar](100) NULL,
	[IpAddress] [varchar](64) NULL,
	[ProcessorID] [int] NULL,
	[InquiryID] [int] IDENTITY(1,1) NOT NULL,
	[Comments] [nvarchar](max) NULL,
	[ProcessorComments] [nvarchar](max) NULL,
	[DateProcessed] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[InquiryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
