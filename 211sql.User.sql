USE [_connector]
GO
/****** Object:  User [211sql]    Script Date: 8/16/2017 8:45:17 PM ******/
CREATE USER [211sql] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [211sql]
GO
