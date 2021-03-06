USE [s17guest17]
GO
/****** Object:  StoredProcedure [dbo].[selectPresentationsSpeaker]    Script Date: 5/15/2017 6:28:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Scopio
-- Create date: 5/15/2017
-- Description:	Selects the speaker for any given presentation
-- =============================================
ALTER PROCEDURE [dbo].[selectPresentationsSpeaker]
	-- Add the parameters for the stored procedure here
	@presentation nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT Classes.Title, Persons.FirstName, Persons.LastName
	FROM Classes
	LEFT JOIN Presenters ON Presenters.PresenterID = Classes.PresenterID
	LEFT JOIN Persons ON Persons.PersonID = Presenters.PersonID
	WHERE Classes.Title = @presentation

END
