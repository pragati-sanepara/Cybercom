-- CASE 1

create table Activity
(
	player_id  int not null, 
	device_id  int,
	event_date  date not null, 
	games_played  int,
    primary key (player_id, event_date)
);
select * from Activity;

INSERT INTO `practice`.`Activity` (`player_id`, `device_id`, `event_date`, `games_played`) VALUES ('1', '2', '2016-03-01', '5');
INSERT INTO `practice`.`Activity` (`player_id`, `device_id`, `event_date`, `games_played`) VALUES ('1', '2', '2016-05-02', '6');
INSERT INTO `practice`.`Activity` (`player_id`, `device_id`, `event_date`, `games_played`) VALUES ('2', '3', '2017-06-25', '1');
INSERT INTO `practice`.`Activity` (`player_id`, `device_id`, `event_date`, `games_played`) VALUES ('3', '1', '2016-03-02', '0');
INSERT INTO `practice`.`Activity` (`player_id`, `device_id`, `event_date`, `games_played`) VALUES ('3', '4', '2018-07-03', '5');

-- Question 1: Write an SQL query to report the first login date for each player. Return the result table in any order.

select player_id, min(event_date) as first_login
from Activity
group by player_id;


-- Question 2: Write an SQL query to report the device that is first logged in for each player. Return the result table in any order.

select player_id,  device_id
from Activity
group by player_id having min(event_date);


-- Question 3: Write an SQL query to report for each player and date, how many games played so far by the player. That is, the total number of games played by the player until that date. Check the example for clarity. Return the result table in any order.

select a1.player_id, a1.event_date, sum(a2.games_played) as games_played_so_far
from Activity as a1 
join Activity as a2
on a1.player_id = a2.player_id
where a1.event_date >= a2.event_date
group by a1.player_id, a1.event_date;