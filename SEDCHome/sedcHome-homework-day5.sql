drop function if exists dbo.fn_PassedStudents_Multistatement
go

create or alter function dbo.fn_PassedStudents_Multistatement(@TeacherID int, @CourseID int)
returns @output table (StudentFirstName nvarchar(100), StudentLastName nvarchar(100), Grade tinyint, CreatedDate datetime)
as
	begin
	insert into @output
	select
		s.FirstName as StudentFirstName, s.LastName as StudentLastName, g.Grade as Grade, g.CreatedDate as CreatedDate
	from
		dbo.Grade as g
		inner join dbo.Student as s on g.StudentID = s.ID
	where
		TeacherID = @TeacherID and CourseID = @CourseID
	return
	end
go

select * from dbo.fn_PassedStudents_Multistatement(1,1)
order by CreatedDate, StudentFirstName, StudentLastName
go