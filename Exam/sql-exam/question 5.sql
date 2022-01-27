/*Write an SQL query to report the customer ids from the Customer table 
that bought all the products in the Product table. Return the result 
table in any order.*/

select e2.student_id, min(e2.course_id) as course_id, e2.grade
from enrollments e2
where e2.grade = 
		(select max(grade) 
        from enrollments e1
        where e2.student_id = e1.student_id)
	group by e2.student_id
    order by e2.student_id;