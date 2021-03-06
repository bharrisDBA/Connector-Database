USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[InsertConnectorApplication]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[InsertConnector]    Script Date: 8/14/2015 2:42:09 PM ******/
CREATE PROCEDURE [dbo].[InsertConnectorApplication]
(
	@UserID int,
	@Status int,
	@WhyMember nvarchar(max),
	@PersonalTestimony nvarchar(max),
	@PersonalGrowth nvarchar(max),
	@MinistryExperience nvarchar(max),
	@PastorName nvarchar(128),
	@ChurchName nvarchar(64),
	@ReferenceName nvarchar(32),
	@ReferenceEmail nvarchar(64),
	@ReferencePhone varchar(64),
	@ReferenceRelationship nvarchar(64)
)
AS
DECLARE
	@count int 
	SELECT @count = 0
	SELECT @count = COUNT(*) FROM User121Application
	WHERE UserID = @UserID IF (@count = 0)
	BEGIN INSERT INTO User121Application 
	(
		UserID,
		Status,
		WhyMember,
		PersonalTestimony,
		PersonalGrowth,
		MinistryExperience,
		PastorName,
		ChurchName,
		ReferenceName,
		ReferenceEmail,
		ReferencePhone,
		ReferenceRelationship
	) VALUES
	(
		@UserID,
		@Status,
		@WhyMember,
		@PersonalTestimony,
		@PersonalGrowth,
		@MinistryExperience,
		@PastorName,
		@ChurchName,
		@ReferenceName,
		@ReferenceEmail,
		@ReferencePhone,
		@ReferenceRelationship
	)
END
GO
