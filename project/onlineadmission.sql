create database onlineadmission
go
use onlineadmission
go

create table department
(
dep_id int primary key identity ,
dep_name nvarchar(50) not null,
)
insert into department
values('Chemistry')
insert into department
values('French')
insert into department
values('Economics')
insert into department
values('Psychology')
insert into department
values('Mathematics')

select * from department


create table applicant_status
(
s_id int primary key identity ,
s_name nvarchar(50) not null,
)
insert into applicant_status
values('Merit')
insert into applicant_status
values('waiting')

select * from applicant_status


create table catergory
(
c_id int primary key identity ,
c_name nvarchar(50) not null,
)

insert into catergory
values('Karachi')
insert into catergory
values('other province')
insert into catergory
values('foriegners')

select * from catergory

create table s_registration
(
r_id int primary key identity not null,
r_cnic int unique not null,
r_password nvarchar(50) not null,
r_firstname nvarchar(50) not null,
r_lastname nvarchar(50) not null,
r_fathername nvarchar(50) not null,
r_sscmarksheet nvarchar(max) not null,
r_date date,
r_status int default 0,
r_phonenumber nvarchar(50) not null,
r_PTCLnumber nvarchar(50) not null,
r_matricmarks nvarchar(50) not null,
r_image nvarchar(max) not null,
r_p1 int foreign key references department(dep_id),
r_p2 int foreign key references department(dep_id),
r_p3 int foreign key references department(dep_id),
r_cat int foreign key references catergory(c_id),
)

select * from s_registration

create table merit
(
m_id int primary key identity,
m_applicantID int unique foreign key references s_registration(r_id),
m_depID int foreign key references department(dep_id),
m_appStatusID int foreign key references applicant_status(s_id),
)

select * from merit