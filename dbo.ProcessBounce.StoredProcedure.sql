USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[ProcessBounce]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 11/11/16
-- Description:	Processes soft and hard bounces.
-- If soft it just increments the counter
-- If # of soft exceeds limit, run the makeHardBounce
-- If hard, rund the makeHardBounce
-- =============================================
CREATE PROCEDURE [dbo].[ProcessBounce] 
	-- Add the parameters for the stored procedure here
	@Email nvarchar(60),
	@BounceType nvarchar(20) = 'soft',
	@MaxSoftBounceCount int = 5

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @Userid int
	Declare @BounceCount int =0
	Declare @HardBounceCount int = 0
	select @userid = userid from users where email = @Email
	if (NOT @userid IS Null )
		Begin
			if @BounceType = 'soft'
				Begin
					Update users set softbounces =  softbounces + 1 where userid = @Userid
					select @BounceCount = softbounces from users where userid = @Userid
					if @BounceCount > = @MaxSoftBounceCount
						Begin
							exec dbo.makeHardBounce @userid ;
						end
				End
			else
				Begin
					exec dbo.makeHardBounce @userid;
					Set @BounceCount = @MaxSoftBounceCount + 1
				end
		End
	select @BounceCount as bouncecount;
END

GO
