USE [_connector]
GO
/****** Object:  Table [dbo].[TestimoniesOrPrayerNeeds]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestimoniesOrPrayerNeeds](
	[commentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Comment] [nvarchar](255) NULL,
	[commentType] [int] NULL,
	[Testimonies] [nvarchar](max) NULL,
	[PrayerNeeds] [nvarchar](max) NULL,
	[dateATime] [datetime] NULL,
	[Language] [nvarchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
