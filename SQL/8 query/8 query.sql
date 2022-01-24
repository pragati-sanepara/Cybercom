-- Write an SQL query to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead. Return the result table in any order.

create table person2
(
	personId int auto_increment primary key,
    lastName varchar(16),
    firstName varchar(16)
);

INSERT INTO `practice`.`person2` (`lastName`, `firstName`) VALUES ('wang', 'allen');
INSERT INTO `practice`.`person2` (`lastName`, `firstName`) VALUES ('alice', 'bob');

create table Address
(
	addressId int auto_increment primary key,
    personId int,
    city varchar(16),
    state varchar(16),
    foreign key (personId) references person2(personId)
);

INSERT INTO `practice`.`Address` (`personId`, `city`, `state`) VALUES ('2', 'New York City', 'New York');

select person2.lastName, person2.firstName, Address.city, Address.state
from person2
left join Address
on person2.personId = Address.personId;
