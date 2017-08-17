USE [_connector]
GO
/****** Object:  User [reporter]    Script Date: 8/16/2017 8:45:17 PM ******/
CREATE USER [reporter] FOR LOGIN [reporter] WITH DEFAULT_SCHEMA=[db_datareader]
GO
ALTER ROLE [db_datareader] ADD MEMBER [reporter]
GO
