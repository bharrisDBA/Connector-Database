USE [_connector]
GO
/****** Object:  Table [dbo].[User121Application]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User121Application](
	[UserID] [int] NOT NULL,
	[ChurchName] [nvarchar](64) NULL,
	[ReferenceName] [nvarchar](32) NULL,
	[ReferenceEmail] [nvarchar](64) NULL,
	[ReferencePhone] [varchar](64) NULL,
	[ReferenceRelationship] [nvarchar](64) NULL,
	[DateSubmitted] [datetime] NOT NULL DEFAULT (getdate()),
	[Status] [int] NULL,
	[ProcessorID] [int] NULL,
	[DateProcessed] [datetime] NULL,
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessorComments] [nvarchar](max) NULL,
	[WhyMember] [nvarchar](max) NULL,
	[PersonalTestimony] [nvarchar](max) NULL,
	[PersonalGrowth] [nvarchar](max) NULL,
	[MinistryExperience] [nvarchar](max) NULL,
	[PastorName] [nvarchar](128) NULL,
	[EmailedReference] [datetime] NULL,
	[WhoEmailedReference] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
