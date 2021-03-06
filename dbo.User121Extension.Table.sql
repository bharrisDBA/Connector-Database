USE [_connector]
GO
/****** Object:  Table [dbo].[User121Extension]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User121Extension](
	[User121ExtensionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SunNum] [int] NOT NULL,
	[MonNum] [int] NOT NULL,
	[TueNum] [int] NOT NULL,
	[WedNum] [int] NOT NULL,
	[ThurNum] [int] NOT NULL,
	[FriNum] [int] NOT NULL,
	[SatNum] [int] NOT NULL,
	[VacationStartDate] [date] NULL DEFAULT (NULL),
	[VacationEndDate] [date] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[User121ExtensionID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
