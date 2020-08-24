CREATE OR ALTER PROCEDURE dbo.CreateGradeDetail
(
	@GradeID int,
	@AchievementTypeID tinyint,
	@AchievementPoints tinyint,
	@AchievementMaxPoints tinyint,
	@AchievementDate datetime
)
AS
BEGIN
		BEGIN TRY
				INSERT INTO dbo.GradeDetails (GradeID,AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
				VALUES (@GradeID,@AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate)

				SELECT
					SUM(cast(gd.AchievementPoints as decimal(5,2))/cast(gd.AchievementMaxPoints as decimal(5,2))*a.ParticipationRate) AS GradePoints
				FROM 
					dbo.GradeDetails AS gd
					inner join dbo.AchievementType AS a ON gd.AchievementTypeID = a.ID
				WHERE 
					gd.GradeID = @GradeID
		END TRY
		BEGIN CATCH
				SELECT  
					ERROR_NUMBER() AS ErrorNumber
				,	ERROR_SEVERITY() AS ErrorSeverity
				,	ERROR_STATE() AS ErrorState
				,	ERROR_PROCEDURE() AS ErrorProcedure
				,	ERROR_LINE() AS ErrorLine
				,	ERROR_MESSAGE() AS ErrorMessage
		END CATCH
END
GO

EXEC [dbo].[CreateGradeDetail]
	@GradeId = 2
,	@AchievementTypeID = 100
,	@AchievementPoints = 95
,	@AchievementMaxPoints = 100
,	@AchievementDate = '2003-05-21'
GO