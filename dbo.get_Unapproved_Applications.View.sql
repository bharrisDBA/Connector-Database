USE [_connector]
GO
/****** Object:  View [dbo].[get_Unapproved_Applications]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[get_Unapproved_Applications]
AS
SELECT        dbo.Users.FirstName, dbo.Users.LastName, dbo.Users.NickName, dbo.User121Application.ApplicationID, dbo.User121Application.UserID, dbo.User121Application.WhyMember, 
                         dbo.User121Application.PersonalGrowth, dbo.User121Application.PersonalTestimony, dbo.User121Application.MinistryExperience, dbo.User121Application.PastorName, dbo.User121Application.ChurchName, 
                         dbo.User121Application.ReferenceName, dbo.User121Application.ReferenceEmail, dbo.User121Application.ReferencePhone, dbo.User121Application.ReferenceRelationship, 
                         dbo.User121Application.DateSubmitted, dbo.Countries.Name AS Country, dbo.Languages.languageName AS PreferredLanguage, dbo.User121Application.EmailedReference, 
                         dbo.User121Application.WhoEmailedReference
FROM            dbo.User121Application INNER JOIN
                         dbo.Users ON dbo.User121Application.UserID = dbo.Users.UserID INNER JOIN
                         dbo.Countries ON dbo.Users.CountryCode = dbo.Countries.Code INNER JOIN
                         dbo.Languages ON dbo.Users.PreferredLanguage = dbo.Languages.languageCode
WHERE        (dbo.User121Application.Status < 2) AND (dbo.Languages.thisLangCode = 'en') AND (dbo.Countries.LanguageCode = 'en')

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[31] 2[14] 3) )"
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
         Begin Table = "User121Application"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 206
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 284
               Bottom = 192
               Right = 497
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "Countries"
            Begin Extent = 
               Top = 6
               Left = 535
               Bottom = 136
               Right = 705
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Languages"
            Begin Extent = 
               Top = 6
               Left = 743
               Bottom = 193
               Right = 913
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 22
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_Unapproved_Applications'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    Column = 3240
         Alias = 900
         Table = 1170
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_Unapproved_Applications'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_Unapproved_Applications'
GO
