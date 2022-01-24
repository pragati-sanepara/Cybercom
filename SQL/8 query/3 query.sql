-- Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables.Note that you must write a single update statement, do not write any select statement for this problem.

create table Salary 
(
	id int auto_increment primary key,
    name varchar(16) not null,
    sex enum("f","m") not null,
    salary int not null
);

INSERT INTO `practice`.`Salary` (`name`, `sex`, `salary`) VALUES ('A', 'm', '2500');
INSERT INTO `practice`.`Salary` (`name`, `sex`, `salary`) VALUES ('B', 'f', '1500');
INSERT INTO `practice`.`Salary` (`name`, `sex`, `salary`) VALUES ('C', 'm', '5500');
INSERT INTO `practice`.`Salary` (`name`, `sex`, `salary`) VALUES ('D', 'f', '500');

select * from Salary;

set sql_safe_updates = 0;
update Salary
set sex = 
	case 
		when sex = 'f' then 'm' 
        else 'f'
	end;