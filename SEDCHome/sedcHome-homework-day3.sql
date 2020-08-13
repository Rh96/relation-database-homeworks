--Homework requirement 1/3
--1
select
	count(g.Grade) as TotalGrades
from
	dbo.Grade g
group by
	g.Grade
GO

--2
select distinct
	t.FirstName + N' ' + t.LastName as Teachers, count(g.Grade) as TotalGradesPerTeacher
from
	dbo.Grade g
	inner join dbo.Teacher as t on t.ID = g.TeacherID
group by 
	t.FirstName, t.LastName, g.Grade 
Go

--3
select distinct
	t.FirstName + N' ' + t.LastName as Teachers, s.ID as StudentID , count(*) as TotalGradesPerTeacher
from
	dbo.Grade g
	inner join dbo.Teacher as t on t.ID = g.TeacherID
	inner join dbo.Student as s on s.ID = g.StudentID
where
	s.ID < 100
group by 
	t.FirstName, t.LastName, g.Grade, s.ID 
Go

--4
select
	s.StudentCardNumber as StudentCard, max(g.Grade) as MaxGrade, avg(g.Grade) as AvgGrade
from
	dbo.Grade g
	inner join dbo.Student as s on s.ID = g.StudentID
group by
	s.StudentCardNumber
GO


--Homework requirement 2/3
--1
select 
	t.FirstName + N' ' + t.LastName as Teachers, count(g.Grade) as GradeCount
from
	dbo.Grade g
	inner join dbo.Teacher as t on t.ID = g.TeacherID
where
	g.Grade > 200
group by 
	t.FirstName, t.LastName, g.Grade
Go

--2
select
	t.FirstName + N' ' + t.LastName as Teachers, s.ID as StudentID , count(*) as TotalGradesPerTeacher
from
	dbo.Grade g
	inner join dbo.Teacher as t on t.ID = g.TeacherID
	inner join dbo.Student as s on s.ID = g.StudentID
where
	s.ID < 100
group by 
	t.FirstName, t.LastName, g.Grade, s.ID 
having
	count(Grade) > 50
Go

--3
select
	s.StudentCardNumber as StudentCard, count(g.Grade) as GradeCount, max(g.Grade) as MaxGrade, avg(g.Grade) as AvgGrade
from
	dbo.Grade g
	inner join dbo.Student as s on s.ID = g.StudentID
group by
	s.StudentCardNumber
having
	max(g.Grade) = avg(g.Grade)
GO

--4
select
	s.FirstName + N' ' + s.LastName as Student, s.StudentCardNumber as CardNumber ,count(g.Grade) as GradeCount, max(g.Grade) as MaxGrade, avg(g.Grade) as AvgGrade
from
	dbo.Grade g
	inner join dbo.Student as s on s.ID = g.StudentID
group by
	s.FirstName, s.LastName ,s.StudentCardNumber
having
	max(g.Grade) = avg(g.Grade)
GO

--Homework requirement 3/3
--1
create view vv_StudentGrades
as
select
	s.ID as StudentID, count(g.Grade) as GradeCount
from
	dbo.Grade g
	inner join dbo.Student as s on s.ID = g.StudentID
group by
	s.ID
GO

--2
alter view vv_StudentGrades
as
select
	s.FirstName + N' ' + s.LastName as StudentName, count(g.Grade) as GradeCount
from
	dbo.Grade g
	inner join dbo.Student as s on s.ID = g.StudentID
group by
	s.FirstName, s.LastName, g.Grade
GO

--3
alter view vv_StudentGrades
as
select
	s.FirstName + N' ' + s.LastName as StudentName, count(g.Grade) as GradeCount
from
	dbo.Grade g
	inner join dbo.Student as s on s.ID = g.StudentID
group by
	s.FirstName, s.LastName, g.Grade
order by
	GradeCount desc
GO

--4
create view vv_StudentGradeDetails
as
select distinct
	s.FirstName + N' ' + s.LastName as StudentName, count(*) as Passed
from
	dbo.GradeDetails gd
	inner join dbo.Grade as g on g.ID = gd.GradeID
	inner join dbo.Student as s on s.ID = g.StudentID
	inner join dbo.Course as c on c.ID = g.CourseID
	inner join dbo.AchievementType as atype on atype.ID = gd.AchievementTypeID
where
	gd.AchievementTypeID = 5
group by
	s.FirstName, s.LastName, g.CourseID
having
	max(AchievementPoints) > 50
GO