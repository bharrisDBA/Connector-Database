USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[InsertConnectorExtension]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertConnectorExtension] (@UserID int) AS DECLARE @count int SELECT @count = 0 SELECT @count = COUNT(*) FROM User121Extension WHERE UserID = @UserID IF (@count = 0) BEGIN INSERT INTO User121Extension (userID,SunNum,MonNum,TueNum,WedNum,ThurNum,FriNum,SatNum) VALUES (@UserID,1,1,1,1,1,1,1) END
GO
