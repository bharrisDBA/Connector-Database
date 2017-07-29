USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[markMessageAsRead]    Script Date: 7/28/2017 10:17:13 PM ******/
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
