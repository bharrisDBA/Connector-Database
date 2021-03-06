USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[sendChat]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sendChat]
(
	@conversationID int,
	@Message nvarchar(255),
	@UserFrom int,
	@DateTimeSent nvarchar(255)
)
AS
BEGIN
	INSERT INTO ChatMessages 
	(
		ConversationID, 
		Message, 
		UserFrom,
		DateTimeSent
	) 
	VALUES 
	(
		@conversationID,
		@Message,
		@UserFrom,
		@DateTimeSent
	)
END
GO
