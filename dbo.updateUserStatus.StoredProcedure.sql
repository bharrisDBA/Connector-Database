USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[updateUserStatus]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateUserStatus] (@UserID int, @UserStatus int) AS BEGIN UPDATE Users SET Status = @UserStatus WHERE UserID = @UserID END
GO
