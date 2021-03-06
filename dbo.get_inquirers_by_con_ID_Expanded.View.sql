USE [_connector]
GO
/****** Object:  View [dbo].[get_inquirers_by_con_ID_Expanded]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[get_inquirers_by_con_ID_Expanded]
AS
SELECT        dbo.Users.UserID, dbo.InquirerExtension.UserID AS Expr1, dbo.Inquiries.DecisionToday, dbo.Inquiries.DateSubmitted, dbo.Inquiries.FirstContactURL, dbo.Inquiries.IpAddress, dbo.Inquiries.ProcessorID, 
                         dbo.Inquiries.InquiryID, dbo.Inquiries.Comments, dbo.Users.UserTypeID, dbo.InquirerExtension.GroupID, dbo.Users.FirstName, dbo.Users.LastName, dbo.Users.Gender, dbo.Users.DateOfBirth, 
                         dbo.Users.Address, dbo.Users.City, dbo.Users.StateProvince, dbo.Users.Zip, dbo.Users.CountryCode, dbo.Users.FluentLanguages, dbo.Users.PreferredLanguage, dbo.Users.NickName, dbo.Users.DateJoined, 
                         dbo.Users.DateCreated, dbo.Users.Phone, dbo.Users.Email, dbo.Users.Status, dbo.InquirerExtension.ConnectorID, Users_1.FirstName AS conFirstname, Users_1.LastName AS conLastName, 
                         Users_1.FirstName + ' ' + Users_1.LastName AS conFullName, dbo.InquirerExtension.DateAssigned, dbo.InquirerExtension.TeamID, dbo.Users.Password, dbo.Countries.Name AS countryName, 
                         dbo.Countries.LanguageCode
FROM            dbo.Countries INNER JOIN
                         dbo.Users INNER JOIN
                         dbo.Inquiries ON dbo.Users.UserID = dbo.Inquiries.UserID ON dbo.Countries.Code = dbo.Users.CountryCode LEFT OUTER JOIN
                         dbo.InquirerExtension RIGHT OUTER JOIN
                         dbo.Users AS Users_1 ON dbo.InquirerExtension.ConnectorID = Users_1.UserID ON dbo.Users.UserID = dbo.InquirerExtension.UserID

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[29] 4[33] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Countries"
            Begin Extent = 
               Top = 6
               Left = 734
               Bottom = 235
               Right = 904
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 278
               Right = 251
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Inquiries"
            Begin Extent = 
               Top = 15
               Left = 301
               Bottom = 145
               Right = 500
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "InquirerExtension"
            Begin Extent = 
               Top = 6
               Left = 526
               Bottom = 184
               Right = 702
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users_1"
            Begin Extent = 
               Top = 278
               Left = 279
               Bottom = 408
               Right = 492
            End
            DisplayFlags = 280
            TopColumn = 18
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 26' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_inquirers_by_con_ID_Expanded'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'10
         Table = 2325
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_inquirers_by_con_ID_Expanded'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_inquirers_by_con_ID_Expanded'
GO
