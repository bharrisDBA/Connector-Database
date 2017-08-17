USE [_connector]
GO
/****** Object:  User [AccessReporter]    Script Date: 8/16/2017 8:45:17 PM ******/
CREATE USER [AccessReporter] FOR LOGIN [AccessReporter] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [AccessReporter]
GO
