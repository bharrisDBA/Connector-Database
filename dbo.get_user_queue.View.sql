USE [_connector]
GO
/****** Object:  View [dbo].[get_user_queue]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[get_user_queue]
AS
SELECT        dbo.Users.FirstName, dbo.Users.LastName, dbo.Users.Gender, dbo.Users.PreferredLanguage, dbo.Teams.TeamCoachID, dbo.Teams.HeadCoachID, dbo.TeamAssignment.TeamID, dbo.GroupQueue.CreateDate, 
                         dbo.GroupQueue.UserID, dbo.Users.UserName, dbo.Users.Status, dbo.Users.UserTypeID, dbo.Users.DateOfBirth, dbo.Users.Address, dbo.Users.City, dbo.Users.StateProvince, dbo.Users.Zip, 
                         dbo.Users.CountryCode, dbo.Users.Email, dbo.Users.Phone, dbo.Users.DateCreated, dbo.Users.DateJoined, dbo.Users.NickName, dbo.Users.EmailNotification, dbo.Users.FluentLanguages, 
                         dbo.Inquiries.FirstContactURL, dbo.Inquiries.Comments, dbo.Inquiries.DecisionToday
FROM            dbo.Teams INNER JOIN
                         dbo.TeamAssignment INNER JOIN
                         dbo.GroupTeam ON dbo.TeamAssignment.TeamID = dbo.GroupTeam.TeamID ON dbo.Teams.TeamID = dbo.TeamAssignment.TeamID INNER JOIN
                         dbo.GroupQueue INNER JOIN
                         dbo.Users ON dbo.GroupQueue.UserID = dbo.Users.UserID ON dbo.GroupTeam.GroupID = dbo.GroupQueue.GroupID INNER JOIN
                         dbo.Inquiries ON dbo.Users.UserID = dbo.Inquiries.UserID

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[56] 4[19] 2[7] 3) )"
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
         Begin Table = "Teams"
            Begin Extent = 
               Top = 204
               Left = 19
               Bottom = 334
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TeamAssignment"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GroupTeam"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GroupQueue"
            Begin Extent = 
               Top = 37
               Left = 528
               Bottom = 167
               Right = 698
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 135
               Left = 243
               Bottom = 265
               Right = 432
            End
            DisplayFlags = 280
            TopColumn = 19
         End
         Begin Table = "Inquiries"
            Begin Extent = 
               Top = 253
               Left = 726
               Bottom = 383
               Right = 925
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_user_queue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    Alias = 900
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_user_queue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_user_queue'
GO
