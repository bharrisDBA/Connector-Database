USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[dequeueTemp]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dequeueTemp] ( 	@UserID int ) AS BEGIN DELETE FROM TempQueue WHERE InquirerID = @UserID END
GO
