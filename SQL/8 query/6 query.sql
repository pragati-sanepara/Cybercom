-- Create a database schema for student grade system. It contains student data and their grade of each subject based on the different semester.

create table person1
(
	id int auto_increment primary key,
    email varchar(64)
);

create index i_email on person1(email);