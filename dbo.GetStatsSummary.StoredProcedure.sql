USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[GetStatsSummary]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetStatsSummary]
	@StartDate date,
	@EndDate date,
	@ConnectorMessageCount integer = 0 OUTPUT ,
	@InquirerMessageCount integer = 0 OUTPUT,
	@ConnectorCount integer = 0 Output,
	@InquirerCount integer = 0 Output,
	@EvanResp integer = 0 Output,
	@EvanRespCountries integer = 0 Output,
	@InquirerCountries integer =0  Output,
	@DecZero integer = 0 Output,
	@DecOne integer = 0 Output,
	@DecTwo integer = 0 Output,
	@DecThree integer = 0 Output,
	@DecFour integer =0 Output,
	@DecFive integer =0  Output,
	@DecSix integer = 0 Output,
	@DecSeven integer = 0  Output,
	@DecEight integer =0 Output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select @ConnectorMessageCount = count(*) from messages m
		join users u on u.userid=m.FromUserID 
		where (datesent between @startdate and @enddate) and u.UserTypeID >=150;
		
		select @ConnectorCount = count(*) from (select m.FromUserID from messages m
		join users u on u.userid=m.FromUserID 
		where (datesent between @startdate and @enddate) and u.UserTypeID >=150
		group by m.FromUserID) c;

	select @inquirerCountries = count(*) from (select u.countrycode from inquiries i join users u on u.userid=i.userid 
		group by u.CountryCode ) c;

	select @InquirerMessageCount = count(*) from messages m
		join users u on u.userid=m.FromUserID 
		where (datesent between @startdate and @enddate) and u.UserTypeID < 150;
	
	select @InquirerCount = count(*) from (select m.FromUserID from messages m
		join users u on u.userid=m.FromUserID 
		where (datesent between @startdate and @enddate) and u.UserTypeID < 150
		group by m.FromUserID) c;
	
		select @DecZero = sum(case when decisiontoday = 0 then 1 else 0 end) ,
			@DecOne = sum(case when decisiontoday = 1 then 1 else 0 end),
			@DecTwo = sum(case when decisiontoday = 2 then 1 else 0 end),
			@DecThree = sum(case when decisiontoday = 3 then 1 else 0 end),
			@DecFour = sum(case when decisiontoday = 4 then 1 else 0 end),
			@DecFive = sum(case when decisiontoday = 5 then 1 else 0 end),
			@DecSix = sum(case when decisiontoday = 6 then 1 else 0 end),
			@DecSeven = sum(case when decisiontoday = 7 then 1 else 0 end),
			@DecEight = sum(case when decisiontoday = 8 then 1 else 0 end)
		from Inquiries
		where DateSubmitted between @startdate and @enddate;

		select @EvanResp = count(*) from EvangelismResponseRecording
			where visTime between @startdate and @enddate;

		select @EvanRespCountries = count(*) from (select countrycode from EvangelismResponseRecording
		 where visTime between @startdate and @enddate group by CountryCode) c;

		select @startdate as StartingDate,
		@enddate as EndingDate,
		@ConnectorMessageCount as ConnectorsMessagesSent,
			@ConnectorCount as ActiveConnectors,
			@InquirerMessageCount as InquirersMessagesReceived,
			@InquirerCount as InquirersActive,
			@inquirerCountries as InquirerCountries,
			@EvanResp as EvangelismResponses,
			@EvanRespCountries as EvangelismResponseCountries,
			@DecZero as Salvations,
			@DecOne as Recommitments,
			@DecTwo as Questions,
			@DecThree as Prayer,
			@DecFour as Contacts,
			@DecFive as Subscriptions;
	
	return;


end
GO
