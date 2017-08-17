USE [_connector]
GO
/****** Object:  User [PostAnalytics]    Script Date: 8/16/2017 8:45:17 PM ******/
CREATE USER [PostAnalytics] FOR LOGIN [PostAnalytics] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [PostAnalytics]
GO
