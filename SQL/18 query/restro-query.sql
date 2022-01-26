-- 1.Total income of Restaurant till now.

DELIMITER $$
CREATE FUNCTION total_income(price FLOAT, discount FLOAT, quantity FLOAT) RETURNS int DETERMINISTIC
BEGIN
 DECLARE temp FLOAT;
  Select (sum(price)-sum(discount)) into temp;
  RETURN (temp)*quantity;
END $$
DELIMITER ;

select sum(total_income(price, discount, quantity)) as total_income from order_item;

-- 2.Customer who visited the restaurant more than twice.

select u.firstName as customer
from order1 o
join user u
on u.id = o.userId
group by userId having count(*) > 1;


-- 3.List of all menus with its menu items.

select m.title as menu_title , i.title as item_title
from menu m
join menu_item mi
on m.id = mi.menuId
join item i
on i.id = mi.itemId;

-- 4.List out all the unique ids and possible indexes for this DB schema.

	PRIMARY KEY AND UNIQUE KEY
		user.id,
        ingredient.id,
        item.id,
        recipe.id,
        menu.id,
        menu_item.id,
        item_chef.id,
        table_top.id,
        booking.id,
        booking_item.id,
        order.id,
        order_item.id,
        transaction.id,
        
	POSSIBLE UNIQUE KEY AND INDEX
		user.mobile,
        user.email,
        ingredient.slug,
        item.slug,
        ingredient.title,
        item.title,
        menu.title,
        menu.slug,
        table_top.code,
        booking.mobile,
        booking.email,
        booking.token,
        transaction.code,
        all primary keys are also possible for index
        
    
-- 5.List out total order placed by each User.

select u.firstName as user_name, count(userId) as total_order
from order1 o
join user u
on u.id = o.userId
group by userId;

         
-- 6.Make a list of each user and the highest-priced menu item he or she ordered.
select u.firstName as user , i.title as item , max(i.price) as price
from user u
join menu m
on u.id = m.userId
join item i
on u.id = i.userId
group by u.firstName;


-- 7.Retrieve the name of a chef who prepares more recipes than any other chef.

select u.firstName , count(ic.itemId) as prepared_recipes
from item_chef ic
join user u
on u.id = ic.chefId
where count(ic.itemId) = max(count(ic.itemId))
group by ic.chefId;

select count(ic.itemId) 
from item_chef ic
group by ic.chefId;

-- 8.Retrieve the amount of subtotal for all day on 9th November 2021. (It does not include the total, formula: item price * ordered qty).

select sum(total(price, quantity, createdAt)) as subtotal from order_item
where date(createdAt) = '2021-11-09';

DELIMITER $$
CREATE FUNCTION total(price FLOAT, quantity FLOAT, createdAt DATETIME) RETURNS int DETERMINISTIC
BEGIN
 DECLARE temp FLOAT;
  Select (price * quantity)  into temp;
  RETURN temp;
END $$
DELIMITER ;

-- 9.List out user along with the average amount spend at the restaurant.

DELIMITER $$
CREATE FUNCTION avg_amount(price FLOAT, discount FLOAT, quantity FLOAT, createdAt DATETIME) RETURNS int DETERMINISTIC
BEGIN
 DECLARE temp FLOAT;
  Select ((price - discount) * quantity)  into temp;
  RETURN temp;
END $$
DELIMITER ;

select u.firstName, avg(avg_amount(oi.price, oi.discount, oi.quantity, oi.createdAt)) as avg_amount
from order_item oi
join order1 o
on o.id = oi.orderId
join user u
on u.id = o.userId
group by u.firstName;

-- 10. List out the menu items which are preferred by the customer at dinner time

select i.title
from item i
join order_item oi
on i.id = oi.itemId
where time(oi.createdAt) between '19:00:00' and '24:00:00';  

