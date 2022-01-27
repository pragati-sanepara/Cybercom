/*Write an SQL query to find the prices of all products on 2019-08-16. 
Assume the price of all products before any change is 10.
Return the result table in any order.*/


select distinct products_Id, 10 AS price
from products
where products_id not in 
		(select products_id 	
        from products 
        where change_date <= '2019-08-16')
union
select products_id, new_price as price
from products
where (products_id, change_date) in 
		(select products_id, MAX(change_date)
        from products
		where change_date <= '2019-08-16'
		group by products_id)
order by price desc;

