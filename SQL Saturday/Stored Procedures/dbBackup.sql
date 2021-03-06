USE [s17guest17]
GO
/****** Object:  StoredProcedure [dbo].[dbBackup]    Script Date: 5/15/2017 6:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Scopio
-- Create date: 5/15/2017
-- Description:	Backs up database
-- =============================================
ALTER PROCEDURE [dbo].[dbBackup]
AS
BEGIN
	SET NOCOUNT ON;

	BACKUP DATABASE [s17guest17] 
		TO DISK = '\s17guest17.Bak'
		WITH FORMAT,
			MEDIANAME = 'Z_SQLServerBackups',
			NAME = 'Full Backup of s17guest17';
END
