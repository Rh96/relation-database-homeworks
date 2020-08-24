--HOMEWORK REQUIREMENT 1a
CREATE OR ALTER PROCEDURE dbo.CreateGrade
(
	@StudentID int,
	@CourseID smallint,
	@TeacherID smallint,
	@Grade tinyint,
	@Comment nvarchar(100),
	@CreatedDate datetime
)
AS
BEGIN
		INSERT INTO dbo.Grade (StudentID,CourseID,TeacherID,Grade,Comment,CreatedDate)
		VALUES (@StudentID, @CourseID, @TeacherID, @Grade, @Comment, @CreatedDate)

		SELECT COUNT(*) 
		FROM dbo.Grade
		WHERE StudentID = @StudentID

		SELECT MAX(Grade) AS MaxGrade
		FROM dbo.Grade
		WHERE 
			StudentID = @StudentID and TeacherID = @TeacherID
END
GO

EXEC dbo.CreateGrade
	@StudentID = 30
,	@CourseID = 1
,	@TeacherID = 1
,	@Grade = 10
,	@Comment = 'Snaodliv'
,	@CreatedDate = '2019-05-23'
GO

SELECT * FROM dbo.Grade
ORDER BY StudentID DESC
GO

----HOMEWORK REQUIREMENT 1b
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
		INSERT INTO dbo.GradeDetails (GradeID,AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
		VALUES (@GradeID,@AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate)

		SELECT
			SUM(cast(gd.AchievementPoints as decimal(5,2))/cast(gd.AchievementMaxPoints as decimal(5,2))*a.ParticipationRate) AS GradePoints
		FROM 
			dbo.GradeDetails AS gd
			inner join dbo.AchievementType AS a ON gd.AchievementTypeID = a.ID
		WHERE 
			gd.GradeID = @GradeID
END
GO

EXEC [dbo].[CreateGradeDetail]
	@GradeId = 20130
,	@AchievementTypeID = 0
,	@AchievementPoints = 93
,	@AchievementMaxPoints = 100
,	@AchievementDate = '2019-05-20'
GO

SELECT TOP 10 * 
FROM [dbo].[GradeDetails]
ORDER BY ID DESC
GO