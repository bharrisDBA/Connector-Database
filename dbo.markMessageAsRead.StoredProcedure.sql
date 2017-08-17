USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[markMessageAsRead]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[markMessageAsRead] 
(
	@MessageID int
)
AS
BEGIN
	UPDATE Messages SET MessageRead='true' WHERE MessageID = @MessageID
END
GO
