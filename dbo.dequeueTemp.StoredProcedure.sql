USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[dequeueTemp]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dequeueTemp] ( 	@UserID int ) AS BEGIN DELETE FROM TempQueue WHERE InquirerID = @UserID END
GO
