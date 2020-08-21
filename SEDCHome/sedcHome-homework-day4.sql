--HOMEWORK REQUIREMENT 1/2
--SCALAR VARIABLE
declare 
	@FirstName nvarchar(100)
set @FirstName = 'Antonio'

select
	*
from
	Student
where 
	FirstName = @FirstName
go

--TABLE VARIABLE
declare @StudentTable table
	(StudentID int not null, FirstName nvarchar(100), LastName nvarchar(100), DateOfBirth date);

insert into @StudentTable
select
	ID, FirstName, LastName, DateOfBirth
from
	Student
where
	Gender = 'F'

select * from @StudentTable
go

--TEMP TABLE
create table #StudentTable
	(LastName nvarchar(100), EnrolledDate date)

insert into #StudentTable
select
	LastName, EnrolledDate
from
	Student
where
	Gender = 'M' and FirstName = 'A%'

select * from #StudentTable
where LEN(LastName) = 7
go

--TEACHERS
select
	*
from
	Teacher
where
	LEN(FirstName) < 5
	and left(FirstName, 3) = left(LastName, 3)
go

--HOMEWORK REQUIREMENT 2/2
create function dbo.fn_FormatStudentName (@StudentID int)
returns nvarchar(100)
as
	begin
		declare @Result nvarchar(2000)

		select @Result = REPLACE(s.StudentCardNumber, 'sc-', '') + '-' + LEFT(s.FirstName, 1) + '.' + s.LastName
		from Student as s
		where ID = @StudentID

		return @Result
	end
go

select *, dbo.fn_FormatStudentName(ID) as FunctionOutput
from Student