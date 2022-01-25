-- Write an SQL query to report all the classes that have at least five students. Return the result table in any order.

create table Courses
(
	student  varchar(16) not null,
	class varchar(16) not null,
    primary key (student, class)
);

select * from Courses;

INSERT INTO `practice`.`Courses` (`student`, `class`) VALUES ('A', 'Math');
INSERT INTO `practice`.`Courses` (`student`, `class`) VALUES ('B', 'English');
INSERT INTO `practice`.`Courses` (`student`, `class`) VALUES ('C', 'Math');
INSERT INTO `practice`.`Courses` (`student`, `class`) VALUES ('D', 'Biology');
INSERT INTO `practice`.`Courses` (`student`, `class`) VALUES ('E', 'Math');
INSERT INTO `practice`.`Courses` (`student`, `class`) VALUES ('F', 'Computer');
INSERT INTO `practice`.`Courses` (`student`, `class`) VALUES ('G', 'Math');
INSERT INTO `practice`.`Courses` (`student`, `class`) VALUES ('H ', 'Math');
INSERT INTO `practice`.`Courses` (`student`, `class`) VALUES ('I', 'Math');


select class
from Courses
group by class
having count(*) >= 5 ;