USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[deleteEmail]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteEmail] (@EmailID int) AS BEGIN DELETE FROM Emails WHERE EmailID = @EmailID END
GO
