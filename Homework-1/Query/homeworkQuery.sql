CREATE TABLE [dbo].[Student]
(
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[EnrolledDate] [datetime] NOT NULL,
	[Gender] [nchar](1) NOT NULL,
	[NationalIDNumber] [nvarchar](20) NULL,
	[StudentCardNumber] [nvarchar](10) NOT NULL,
	CONSTRAINT [Pk_Student] PRIMARY KEY CLUSTERED
	(
	[ID] ASC
	)
)

CREATE TABLE [dbo].[Teacher]
(
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[AcademicRank] [nvarchar](50) NOT NULL,
	[HireDate] [date] NOT NULL,
	CONSTRAINT [Pk_Teacher] PRIMARY KEY CLUSTERED
	(
	[ID] ASC
	)
)

CREATE TABLE [dbo].[Grade]
(
	[ID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseID] [smallint] NOT NULL,
	[TeacherID] [smallint] NOT NULL,
	[Grade] [tinyint] NOT NULL,
	[Comment] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	CONSTRAINT [Pk_Grade] PRIMARY KEY CLUSTERED
	(
	[ID] ASC
	)
)

CREATE TABLE [dbo].[Course]
(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Credit] [decimal](18,2) NOT NULL,
	[AcademicYear] [date] NOT NULL,
	[Semester] [smallint] NOT NULL,
	CONSTRAINT [Pk_Course] PRIMARY KEY CLUSTERED
	(
	[ID] ASC
	)
)

CREATE TABLE [dbo].[AchievementType]
(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](MAX) NOT NULL,
	[ParticipationRate] [nvarchar](10) NOT NULL,
	CONSTRAINT [Pk_AchievementType] PRIMARY KEY CLUSTERED
	(
	[ID] ASC
	)
)

CREATE TABLE [dbo].[GradeDetails]
(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GradeID] [int] NOT NULL,
	[AchievementTypeID] [int] NOT NULL,
	[AchievementPoints] [decimal](18,2) NOT NULL,
	[AchievementMaxPoints] [decimal](18,2) NOT NULL,
	[AchievementDate] [date] NOT NULL,
	CONSTRAINT [Pk_GradeDetails] PRIMARY KEY CLUSTERED
	(
	[ID] ASC
	)
)