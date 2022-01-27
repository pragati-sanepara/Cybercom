/*Write an SQL query to report the customer ids from the Customer table 
that bought all the products in the Product table. Return the result 
table in any order.*/

select c.customer_id 
from customer c
join product1 p
on p.product_key = c.product_key
group by c.customer_id
having count(distinct c.product_key) = 2;