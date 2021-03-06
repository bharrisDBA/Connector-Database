USE [_connector]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserName] [nvarchar](255) NULL,
	[Password] [varchar](255) NULL,
	[Status] [int] NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[FirstName] [nvarchar](32) NULL,
	[LastName] [nvarchar](32) NULL,
	[Gender] [bit] NULL,
	[DateOfBirth] [date] NULL,
	[Address] [nvarchar](64) NULL,
	[City] [nvarchar](64) NULL,
	[StateProvince] [nvarchar](64) NULL,
	[Zip] [nvarchar](64) NULL,
	[CountryCode] [varchar](2) NULL,
	[Email] [nvarchar](64) NULL,
	[Phone] [varchar](64) NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT (getdate()),
	[DateJoined] [datetime] NULL,
	[NickName] [nvarchar](32) NULL,
	[EmailNotification] [bit] NOT NULL DEFAULT ((0)),
	[PreferredLanguage] [nvarchar](5) NULL,
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FluentLanguages] [varchar](255) NULL,
	[ChatActive] [bit] NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF_Users_Active]  DEFAULT ((1)),
	[SoftBounces] [int] NOT NULL CONSTRAINT [DF_Users_Bounces]  DEFAULT ((0)),
	[UserComments] [nvarchar](max) NULL,
	[ConfidentialComments] [nvarchar](max) NULL,
	[HardBounces] [int] NULL CONSTRAINT [DF_Users_HardBounces]  DEFAULT ((0)),
	[LocalTimeZone] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
