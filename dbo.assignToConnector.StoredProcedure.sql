USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[assignToConnector]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[assignToConnector]
(
	@UserID int,
	@ConnectorID int,
	@GroupID int,
	@TeamID int,

	/* These are relevant if a manual assign was handled, so nulls are allowed */
	@ProcessorID int = null,
	@ProcessorComments nvarchar(max) = null
)
AS
BEGIN
	/* Update Inquiry with any processor comments, and update processed date */
	UPDATE Inquiries SET ProcessorID = @ProcessorID,
	ProcessorComments = @ProcessorComments,
	DateProcessed = getdate()
	WHERE UserID = @UserID;

	/* Update User's joined date to reflect latest change */
	UPDATE Users SET DateJoined = getdate() WHERE UserID = @UserID;

	/* Delete any previous connection */
	DELETE FROM InquirerExtension WHERE UserID = @UserID;

	/* Make a new connection to ConnectorID for UserID */
	INSERT INTO InquirerExtension (UserID, ConnectorID, GroupID, TeamID, DateAssigned) VALUES (@UserID, @ConnectorID, @GroupID, @TeamID, getdate());

	/* Reassign any previous conversation messages to new connector */
	UPDATE Messages SET ToUserID = @ConnectorID WHERE FromUserID = @UserID;
END
GO
