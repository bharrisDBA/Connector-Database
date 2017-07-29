USE [_connector]
GO
/****** Object:  Table [dbo].[Inquiries]    Script Date: 7/28/2017 10:17:13 PM ******/
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
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_Inquiries_7_533576939__K5_2_4_6_7_8_9_11]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_Inquiries_7_533576939__K5_2_4_6_7_8_9_11] ON [dbo].[Inquiries]
(
	[DateSubmitted] ASC
)
INCLUDE ( 	[UserID],
	[DecisionToday],
	[FirstContactURL],
	[IpAddress],
	[ProcessorID],
	[InquiryID],
	[Comments]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_Inquiries_7_533576939__K8_K2_K9_K5_4_6_7]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_Inquiries_7_533576939__K8_K2_K9_K5_4_6_7] ON [dbo].[Inquiries]
(
	[ProcessorID] ASC,
	[UserID] ASC,
	[InquiryID] ASC,
	[DateSubmitted] ASC
)
INCLUDE ( 	[DecisionToday],
	[FirstContactURL],
	[IpAddress]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NC-ByProcessorID]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [NC-ByProcessorID] ON [dbo].[Inquiries]
(
	[ProcessorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NC-ByUserID]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [NC-ByUserID] ON [dbo].[Inquiries]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredInquiriesOnDateSubmittedWithUserId]    Script Date: 7/28/2017 10:17:13 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredInquiriesOnDateSubmittedWithUserId] ON [dbo].[Inquiries]
(
	[DateSubmitted] ASC
)
INCLUDE ( 	[UserID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
