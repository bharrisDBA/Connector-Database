USE [_connector]
GO
/****** Object:  User [345kh2345l2h34lh234lh234]    Script Date: 8/16/2017 8:45:17 PM ******/
CREATE USER [345kh2345l2h34lh234lh234] FOR LOGIN [345kh2345l2h34lh234lh234] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [345kh2345l2h34lh234lh234]
GO
ALTER ROLE [db_datareader] ADD MEMBER [345kh2345l2h34lh234lh234]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [345kh2345l2h34lh234lh234]
GO
