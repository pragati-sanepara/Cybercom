-- Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring". Return the result table ordered by rating in descending order.

create table Cinema
(
	id int auto_increment primary key,
    movie varchar(16),
    description varchar(16),
    rating float (10,1)
);

INSERT INTO `practice`.`Cinema` (`movie`, `description`, `rating`) VALUES ('War', 'great 3D', '8.9');
INSERT INTO `practice`.`Cinema` (`movie`, `description`, `rating`) VALUES ('Science', 'fiction', '8.5');
INSERT INTO `practice`.`Cinema` (`movie`, `description`, `rating`) VALUES ('irish', 'boring', '6.2');
INSERT INTO `practice`.`Cinema` (`movie`, `description`, `rating`) VALUES ('Ice song', 'Fantacy', '8.6');
INSERT INTO `practice`.`Cinema` (`movie`, `description`, `rating`) VALUES ('House card', 'Interesting', '9.1');

select * from Cinema
where mod(id, 2) <> 0 and description <> 'boring'
order by rating desc;