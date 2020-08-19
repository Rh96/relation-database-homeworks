drop function if exists dbo.fn_PassedStudents_Multistatement
go

create function dbo.fn_PassedStudents_Multistatement(@TeacherID int, @CourseID int)
returns @output table (StudentFirstName nvarchar(100), StudentLastName nvarchar(100), Grade tinyint, CreatedDate datetime)
as
	begin
	insert into @output
	select
		s.FirstName as StudentFirstName, s.LastName as StudentLastName, g.Grade as Grade, g.CreatedDate as CreatedDate
	from
		dbo.Grade as g
		inner join dbo.Student as s on g.StudentID = s.ID
		inner join dbo.Teacher as t on g.TeacherID = t.ID
		inner join dbo.Course as c on g.CourseID = c.ID
		inner join dbo.GradeDetails as gd on gd.GradeID = g.ID
		inner join dbo.AchievementType as a on gd.AchievementTypeID = a.ID
	where
		t.ID = @TeacherID and c.ID = @CourseID
		and a.[Name] = 'Ispit'
	return
	end
go

select * from dbo.fn_PassedStudents_Multistatement(1,1)
go