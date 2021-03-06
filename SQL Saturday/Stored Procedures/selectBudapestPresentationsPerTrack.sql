USE [s17guest17]
GO
/****** Object:  StoredProcedure [dbo].[selectBudapestPresentationsPerTrack]    Script Date: 5/15/2017 6:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Scopio
-- Create date: 5/15/2017
-- Description:	Selects a track's presentations
-- =============================================
ALTER PROCEDURE [dbo].[selectBudapestPresentationsPerTrack]
	-- Add the parameters for the stored procedure here
	@track nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Tracks.TrackID, Classes.Title, [Events].EventName, Addresses.City
	FROM Classes
	INNER JOIN Tracks ON Tracks.TrackID = Classes.TrackID
	INNER JOIN Rooms ON Rooms.RoomID = Classes.RoomID
	INNER JOIN Addresses ON Addresses.AddressID = Rooms.RoomID
	INNER JOIN [Events] ON [Events].AddressID = Addresses.AddressID
	WHERE Tracks.TrackID = @track
	AND Addresses.City = 'Budapest'
    
END
