/*Write an SQL query to find the team size of each of the employees.
Return result table in any order.*/


DELIMITER $$
CREATE FUNCTION avg_amount(amount int, visited_on date) RETURNS int DETERMINISTIC
BEGIN
DECLARE n int;
declare sum int default 0;
while n <= 6 do
set sum = sum + amount;
set n = n+1;
return sum/7;
end while;
END $$
DELIMITER ;

select avg_amount(amount, visited_on) as total_income from customer;

select * from customer c
join customer c1
where c1.visited_on = date(c.visited_on+ interval 6 day);

select c1.visited_on, sum(c2.amount) as amount, 
round(avg(c2.amount), 2) as average_amount
from (select visited_on, sum(amount) as amount 
      from customer group by visited_on) c1
join (select visited_on, sum(amount) as amount 
      from customer group by visited_on) c2
on datediff(c1.visited_on, c2.visited_on) between 0 and 6
group by c1.visited_on
having count(c2.amount) = 7;
select visited_on, sum(amount) as amount 
      from customer group by visited_on;
      
    
