USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[updateUserStatus]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateUserStatus] (@UserID int, @UserStatus int) AS BEGIN UPDATE Users SET Status = @UserStatus WHERE UserID = @UserID END
GO
