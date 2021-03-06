USE [_connector]
GO
/****** Object:  Table [dbo].[DatabaseMonitoring]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatabaseMonitoring](
	[DatabaseMonitoringID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DatabaseName] [varchar](20) NOT NULL,
	[BackupSize] [numeric](20, 0) NOT NULL,
	[DBSizeGB] [decimal](19, 4) NOT NULL,
	[BackupDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DatabaseMonitoring] PRIMARY KEY CLUSTERED 
(
	[DatabaseMonitoringID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
