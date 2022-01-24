-- Write an SQL query to report all customers who never order anything. Return the result table in any order.

create table Customers
(
	id int auto_increment primary key,
    name varchar(16)
);

INSERT INTO `practice`.`Customers` (`name`) VALUES ('Joe');
INSERT INTO `practice`.`Customers` (`name`) VALUES ('Henry');
INSERT INTO `practice`.`Customers` (`name`) VALUES ('Sam');
INSERT INTO `practice`.`Customers` (`name`) VALUES ('Max');


create table Orders
(
	id int auto_increment primary key,
    customer_id int,
    foreign key (customer_id) references Customers (id)
);

INSERT INTO `practice`.`Orders` (`customer_id`) VALUES ('3');
INSERT INTO `practice`.`Orders` (`customer_id`) VALUES ('1');

select Customers.name from Customers
where Customers.name not in 
( select Customers.name 
from Customers
join Orders
on Customers.id = Orders.customer_id);