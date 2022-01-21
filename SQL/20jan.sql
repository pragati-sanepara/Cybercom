create database practice;

use practice; 

/*Write an SQL query to report all the duplicate emails. Return the result table in any order.*/

drop table person;
create table person
(
	id int auto_increment primary key,
    email varchar(64)
);

insert into person values 
(0,"a@b.com"),
(0,"b@c.com"),
(0,"c@d.com"),
(0,"a@b.com"),
(0,"b@c.com"),
(0,"c@d.com"),
(0,"e@f.com"),
(0,"g@h.com"),
(0,"i@j.com"),
(0,"j@k.com"),
(0,"l@m.com"),
(0,"g@h.com");

truncate table person;
select email from person
group by email
having count(email) > 1;


/*A high earner in a department is an employee who has a salary in the top three unique salaries for that department.*/

drop table department;
create table department
(
	department_id int auto_increment primary key,
    department_name varchar(16) not null
);

INSERT INTO `practice`.`department` (`department_name`) VALUES ('IT');
INSERT INTO `practice`.`department` (`department_name`) VALUES ('Sales');

select * from department;

create table employee
(
	employee_id int auto_increment primary key,
    employee_name varchar(16) not null,
    salary int not null,
    department_id int not null,
    foreign key (department_id) references department(department_id) on delete cascade 
);

INSERT INTO `practice`.`employee` (`employee_name`, `salary`, `department_id`) VALUES ('Joe', '85000', '1');
INSERT INTO `practice`.`employee` (`employee_name`, `salary`, `department_id`) VALUES ('Henry', '80000', '2');
INSERT INTO `practice`.`employee` (`employee_name`, `salary`, `department_id`) VALUES ('Sam', '60000', '2');
INSERT INTO `practice`.`employee` (`employee_name`, `salary`, `department_id`) VALUES ('Max', '90000', '1');
INSERT INTO `practice`.`employee` (`employee_name`, `salary`, `department_id`) VALUES ('Janet', '69000', '1');
INSERT INTO `practice`.`employee` (`employee_name`, `salary`, `department_id`) VALUES ('Randy', '85000', '1');
INSERT INTO `practice`.`employee` (`employee_name`, `salary`, `department_id`) VALUES ('Will', '70000', '1');

select * from employee;

select salary, department_name, employee_name
from employee e
join department d
on e.department_id = d.department_id 
where 3>(
select count(distinct salary)
from employee e1
where e1.salary>e.salary
and e1.department_id = e.department_id)
order by department_name asc, e.salary desc;



select employee_name , Salary, e1.department_id, department_name
from Employee e1
join department d
on e1.department_id = d.department_id 
where 3 >
(
    select count(distinct e2.Salary)
    from Employee e2
    where e2.Salary > e1.Salary
    and e1.department_id = e2.department_id
)
order by department_name asc, e1.salary desc;



/*Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).*/

create table weather 
(
	id int auto_increment primary key,
    record_date date,
    temperature int
);

select * from weather;

INSERT INTO `practice`.`weather` (`record_date`, `temperature`) VALUES ('2015-01-01', '10');
INSERT INTO `practice`.`weather` (`record_date`, `temperature`) VALUES ('2015-01-02', '25');
INSERT INTO `practice`.`weather` (`record_date`, `temperature`) VALUES ('2015-01-03', '20');
INSERT INTO `practice`.`weather` (`record_date`, `temperature`) VALUES ('2015-01-04', '30');

select w2.id 
from weather w2
where w2.temperature > 
					(select w1.temperature from weather w1
						where w1.id = (w2.id)-1);

select w1.id
from weather w1
join weather w2
on w2.id = w1.id-1
where w1.temperature > w2.temperature;

/*Write an SQL query to find all numbers that appear at least three times consecutively.*/

create table logs
(
	id int auto_increment primary key,
    num varchar(8)
);
select * from logs;

INSERT INTO `practice`.`logs` (`num`) VALUES ('1');
INSERT INTO `practice`.`logs` (`num`) VALUES ('1');
INSERT INTO `practice`.`logs` (`num`) VALUES ('1');
INSERT INTO `practice`.`logs` (`num`) VALUES ('2');
INSERT INTO `practice`.`logs` (`num`) VALUES ('1');
INSERT INTO `practice`.`logs` (`num`) VALUES ('2');
INSERT INTO `practice`.`logs` (`num`) VALUES ('2');
 
/*select l1.num 
from logs l1
where  (select l2.num from logs l2
						where l2.id = (l1.id)+1 and l1.num=l2.num);*/
                        
             -- select l1.id,l2.id,l3.id from logs l1,logs l2,logs l3 where l1.id=l2.id-1 and l1.id=l3.id-2;        
                        select l1.num as 'Consecutive Number'
                        from logs l1
                        join logs l2
                        on l1.id = l2.id-1
                        join logs l3
                        on l1.id = l3.id-2
                        where 
                        l1.num=l2.num and l2.num=l3.num;
                        
                        
/*Write an SQL query to report the nth highest salary from the Employee table. If there is no nth highest salary, the query should report null.*/
                        
create table employee1
(
	id int auto_increment primary key,
    salary int 
);
select * from employee1;

INSERT INTO `practice`.`employee1` (`salary`) VALUES ('100');
INSERT INTO `practice`.`employee1` (`salary`) VALUES ('200');
INSERT INTO `practice`.`employee1` (`salary`) VALUES ('300');

select * from
(select IFNULL(salary, 'NULL') AS salary, rank() over (order by salary desc) as r
from employee1) a
where r = 4;

SELECT DISTINCT(Salary) FROM employee1 ORDER BY Salary DESC LIMIT 1,1;
-- SELECT DISTINCT(Salary) FROM employee1 ORDER BY Salary DESC LIMIT (n-1),1;

-- SELECT DISTINCT Salary FROM tblemployee ORDER BY Salary DESC LIMIT 1 OFFSET (2-1);
SELECT DISTINCT Salary FROM employee1 ORDER BY Salary DESC LIMIT 1 OFFSET 1;

SELECT MAX(Salary) FROM Employee1
WHERE Salary NOT IN (SELECT MAX(Salary) FROM Employee1);

-- select MAX(Salary) from Employee WHERE Salary <> (select MAX(Salary) from Employee );

Select IFNULL((select Distinct Salary from Employee1 order by Salary Desc limit 3, 1),NULL) as getNthHighestSalary;

                        