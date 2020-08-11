--HOMEWORK 2 REQUIREMENT 1/6
--1
select
	*
from
	dbo.Student
where
	FirstName = 'Antonio'
GO

--2
select 
	*
from
	dbo.Student
where
	DateOfBirth > '1999.01.01'
GO

--3
select
	*
from
	dbo.Student
where
	Gender = 'M'
GO

--4
select
	*
from
	dbo.Student
where
	LastName like 'T%'
GO

--5
select
	*
from
	dbo.Student
where
	EnrolledDate >= '1998.01.01' and EnrolledDate < '1998.02.01'
GO

--6
select
	*
from
	dbo.Student
where
	EnrolledDate >= '1998.01.01' and EnrolledDate < '1998.02.01'
	and LastName like 'J%'
GO

--HOMEWORK 2 REQUIREMENT 2/6
--1
select
	*
from
	dbo.Student
where 
	FirstName = 'Antonio'
order by
	LastName
GO

--2
select
	*
from
	dbo.Student
order by
	FirstName
GO

--3
select
	*
from
	dbo.Student
where
	Gender = 'M'
order by
	EnrolledDate desc
GO


--HOMEWORK 2 REQUIREMENT 3/6
--1
select
	FirstName
from
	dbo.Teacher
union all
select
	FirstName
from
	dbo.Student
GO

--2
select
	LastName
from
	dbo.Teacher
union 
select
	LastName
from
	dbo.Student
GO

--3
select
	FirstName
from
	dbo.Teacher
intersect
select
	FirstName
from
	dbo.Student
GO


--HOMEWORK 2 REQUIREMENT 4/6
--1
alter table GradeDetails
add constraint DF_GradeDetails_AchievementMaxPoints
default 100 for AchievementMaxPoints
GO

--2
alter table GradeDetails with check
add constraint CHK_GradeDetails_AchievementPoints
check (AchievementPoints <= AchievementMaxPoints)
GO

--3
alter table AchievementType with check
add constraint UC_AchievementType unique ([Name])
GO

--HOMEWORK 2 REQUIREMENT 5/6
--1

--HOMEWORK 2 REQUIREMENT 6/6
--1
select
	c.[Name] as CoursesNames, acht.[Name] as AchievementTypeNames
from
	dbo.Course c
	cross join dbo.AchievementType acht
GO

--2
select 
	t.FirstName as TeacherNames
from
	dbo.Grade g
	inner join dbo.Teacher t on t.ID = g.TeacherID
GO

--3
select 
	t.FirstName as Teachers
from
	dbo.Grade g
	inner join dbo.Teacher t on t.ID = g.TeacherID
where
	g.TeacherID is null
GO

--4
select
	s.FirstName as Students
from
	dbo.Student s
	right join dbo.Grade g on g.StudentID = s.ID
where
	g.StudentID is null
GO