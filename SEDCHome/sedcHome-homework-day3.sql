--Homework requirement 1/3
--1
select count(g.Grade) as TotalGrades
from dbo.Grade as g
group by g.Grade
GO

--2
select g.TeacherID, count(g.Grade) as TotalGradesPerTeacher
from dbo.Grade as g
group by g.TeacherID
order by g.TeacherID
Go

--3
select g.TeacherID, count(*) as TotalGradesPerTeacher
from dbo.Grade as g
where g.StudentID < 100
group by g.TeacherID
order by g.TeacherID
Go

--4
select g.StudentID, max(g.Grade) as MaxGrade, avg(cast(g.Grade as decimal(18,2))) as AvgGrade
from dbo.Grade as g
group by g.StudentID
order by g.StudentID
GO

--Homework requirement 2/3
--1
select g.TeacherID, count(g.Grade) as GradeCount
from dbo.Grade as g
group by g.TeacherID
having count(g.Grade) > 200
Go

--2
select g.TeacherID, count(g.Grade) as GradeCount
from dbo.Grade as g
where g.StudentID < 100
group by g.TeacherID
having count(Grade) > 50
Go

--3
select g.StudentID, count(g.Grade) as GradeCount, max(g.Grade) as MaxGrade, avg(cast(g.Grade as decimal(4,2))) as AverageGrade
from
	dbo.Grade g
	inner join dbo.Student as s on s.ID = g.StudentID
group by g.StudentID
having max(g.Grade) =  avg(cast(g.Grade as decimal(4,2)))
GO

--4
select
	g.StudentID, s.FirstName, s.LastName, count(g.Grade) as GradeCount, max(g.Grade) as MaxGrade, avg(cast(g.Grade as decimal(4,2))) as AverageGrade
from
	dbo.Grade as g
	inner join dbo.Student as s on s.ID = g.StudentID
group by
	g.StudentID, s.FirstName, s.LastName
having
	max(g.Grade) =  avg(cast(g.Grade as decimal(4,2)))
GO

--Homework requirement 3/3
--1
drop view if exists vv_StudentGrades
go

create view vv_StudentGrades
as
select g.StudentID, count(g.Grade) as GradeCount
from dbo.Grade g
group by g.StudentID
GO

--2
alter view vv_StudentGrades
as
select
	g.StudentID, s.FirstName, s.LastName, count(g.Grade) as GradeCount
from
	dbo.Grade g
	inner join dbo.Student as s on g.StudentID = s.ID
group by
	g.StudentID, s.FirstName, s.LastName
GO

--3
select * from dbo.vv_StudentGrades
order by GradeCount desc
go

--4
drop view if exists vv_StudentGradeDetails
go

create view vv_StudentGradeDetails
as
select
	s.FirstName + N' ' + s.LastName as StudentName, count(*) as CourseCount
from
	dbo.Grade as g
	inner join dbo.Student as s on g.StudentID = s.ID
	inner join dbo.GradeDetails as gd on g.ID = gd.GradeID
	inner join dbo.AchievementType as acht on gd.AchievementTypeID = acht.ID
where
	acht.[Name] = 'Ispit'
group by
	s.FirstName, s.LastName
GO