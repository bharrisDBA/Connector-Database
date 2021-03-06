USE [_connector]
GO
/****** Object:  Table [dbo].[AdminBanners]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminBanners](
	[AdminBannerID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageCode] [nvarchar](255) NULL,
	[TopBanner] [nvarchar](max) NULL,
	[SideBanner] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminBannerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
