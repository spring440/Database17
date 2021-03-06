USE [s17guest17]
GO
/****** Object:  StoredProcedure [dbo].[selectSpeakersPresentation]    Script Date: 5/15/2017 6:28:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ryan Scopio
-- Create date: 5/5/2017
-- Description:	Selects all presentations for any given speaker
-- =============================================
ALTER PROCEDURE [dbo].[selectSpeakersPresentation]
	@speaker nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @first_name nvarchar(50)
	DECLARE @last_name nvarchar(50)
	SET @first_name = SUBSTRING(@speaker, 1, CHARINDEX(' ', @speaker) - 1);
	SET @last_name = REVERSE(SUBSTRING(REVERSE(@speaker), 1, CHARINDEX(' ', REVERSE(@speaker)) - 1));

	SELECT Persons.FirstName, Persons.LastName, Classes.Title
	FROM Classes
	LEFT JOIN Presenters ON Presenters.PresenterID = Classes.PresenterID
	LEFT JOIN Persons ON Persons.PersonID = Presenters.PersonID
	WHERE Persons.FirstName = @first_name AND Persons.LastName = @last_name

END
