USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[approveUser121Application]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[approveUser121Application] (
@ApplicationID int, 
@UserID int, 
@ProcessorID int, 
@ProcessorComments nvarchar(max)
) AS BEGIN UPDATE 
User121Application SET Status = 2,
ProcessorID = @ProcessorID, 
ProcessorComments = @ProcessorComments, 
DateProcessed = getdate() 
WHERE 
ApplicationID = @ApplicationID; 
UPDATE Users SET
DateJoined = getdate(),
ConfidentialComments = CONCAT(ConfidentialComments, @ProcessorComments),
UserTypeID = 200 
WHERE UserID = @UserID END
GO
