USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeMessage]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeMessage] 
(
	@MessageID int
)
AS
BEGIN
	DELETE FROM Messages WHERE MessageID = @MessageID
END

GO
