-- Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. Return the result table in any order.

create table person1
(
	id int auto_increment primary key,
    email varchar(64)
);

select * from person1;

INSERT INTO `practice`.`person1` (`email`) VALUES ('john@example.com');
INSERT INTO `practice`.`person1` (`email`) VALUES ('bob@example.com');
INSERT INTO `practice`.`person1` (`email`) VALUES ('john@example.com');


delete p1 FROM Person1 p1
join  Person1 p2
on p1.email = p2.email
WHERE
	p1.id > p2.id;

delete  from person1 
where id in 
(select * from
(select max(id) from person1
group by email having count(*) > 1) as p1);
    
set sql_safe_updates = 0;
delete  from person1 
WHERE id NOT IN 
(select * from
(select min(id) from person1
    group by email) as p);
