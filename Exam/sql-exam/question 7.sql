/*Write an SQL query to find the team size of each of the employees.
Return result table in any order.*/


select e1.employee_id, e2.team_size
from employee e1
join (select team_id, count(team_id) as team_size
		from employee 
        group by team_id) as e2
	on e1.team_id = e2.team_id;
    