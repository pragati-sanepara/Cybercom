-- Create a database structure for employee leave application. It should include all the employee's information as well as their leave information.

create database employeeleave;

use employeeleave;

create table departments 
(
    dept_id     int		        auto_increment,
    dept_name   varchar(16)     not null,
    primary key (dept_id),
    unique  key (dept_name)
);

create table employees
(
		emp_id  	int  			auto_increment,
		birth_date  date            not null,
		first_name  varchar(14)     not null,
		last_name   varchar(16)     not null,
		gender      enum ('M','F')  not null,    
		hire_date   date            not null,
		primary key(emp_id)
);
alter table employees
add emp_experience 		int 			not null,
add emp_designation 	varchar(32) 	not null,
add emp_type			varchar(16) 	not null,
add emp_email           varchar(32) 	not null,
add emp_contact_no      varchar(16) 	not null;


create table deptEmp 
(
    emp_id      int             not null,
    dept_id     int        		not null,
    from_date   date            not null,
    to_date     date            not null,
    foreign key (emp_id)  references employees   (emp_id)  on delete cascade,
    foreign key (dept_id) references departments (dept_id) on delete cascade
);

create table leaveType
(
	leave_type_id		int				auto_increment,
    leave_type			varchar(16)		not null,
    leave_description	varchar(64) 	not null,
    primary key (leave_type_id)
);

drop table leaveDetails;
create table leaveDetails
(
		leave_id		int 		auto_increment,
        leave_type_id	int			not null,
        emp_id			int			not null,
        from_date   	date        not null,
		to_date     	date        not null,
        leave_reason    varchar(64) not null,
        first_half		boolean 	default 0,
        second_half     boolean		default 0,
        full_day		boolean		default 0,
        primary key (leave_id),
		foreign key (leave_type_id)  references leaveType   (leave_type_id)  on delete cascade,
		foreign key (emp_id)  		 references employees   (emp_id)  		 on delete cascade
);

