USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[deleteEmail]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteEmail] (@EmailID int) AS BEGIN DELETE FROM Emails WHERE EmailID = @EmailID END
GO
