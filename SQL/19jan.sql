1/*Get all the categories which are having at least one sub category*/
select * from category 
where category_id in (select parent_id from category);

2/*Get all the products which are having price between 50 to 100*/
select product_id,price,title from product
where price between 40 and 100;

3/*Get all the products sorted based on created date*/
select product_id,title,createdAt from product
order by createdAt asc;

4/*Get total sub total of all the orders*/
select order_id,total,sub_total from orders;
select sum(sub_total) from orders;

5/*Get total discount applied in all the orders*/
select sum(discount) from orders;

6/*Get data of particular user that how many orders they are having*/
select user_id, count(*) as orders_count from orders 
group by user_id;

7/*Get orders list which is having promo applied in that order*/
select * from orders
where promo is not null;

8/*Get current active carts details*/
select * from cart
where status = 1;

9/*get the list of product ids which are having multiple categories*/
SELECT productId FROM product_category
group by productId having count(categoryId) > 1;

10/*Get all the product ids which is having more than 2 reviews*/
select product_id, count(*) as review_count from productreview 
group by product_id having review_count>1;

11/*Get all the products which are updated in last 2 hours*/
Select * from product where createdAt >= createdAt - INTERVAL 5 HOUR;
select * from  product where updatedAt >= DATE_SUB(NOW(),INTERVAL 2 HOUR);

12/*Get products which is having qty between 20 to 30*/
select * from product
where quantity between 20 and 30;





/*1.List all the product names which are assigned to category ID 1.*/
select productCategory.product_id, productCategory.category_id, product.title 
from product 
join productCategory
on productCategory.product_id = product.product_id
where category_id = 1;

/*2.Get the active product count which is assigned to category ID 2.*/
select productCategory.product_id, productCategory.category_id, product.title, cartItem.active
from product 
join productCategory
on productCategory.product_id = product.product_id
join cartItem
on cartItem.product_id = product.product_id
where category_id = 1 and  active = 1;

/*3.Show all category names which are assigned to Product ID 1.*/
select category.title,productcategory.product_id 
from 
category
 join productcategory
 on
 category.category_id=productcategory.category_id
 where
 productcategory.product_id=1;
 
 /*4.List out all the tag names which are assigned to Product ID 1.*/
select tag.title,producttag.product_id from tag
 join producttag
 on producttag.tag_id=tag.tag_id
 where producttag.product_id=1;

 /*5.Show product reviews with product name if product is active.*/
 select productReview.productReview_id,productReview.title, product.title, cartItem.active
from product 
join productReview
on productReview.product_id = product.product_id
join cartItem
on cartItem.product_id = product.product_id
where active = 1;
 
 /*6.List out product names and product ids which have at least one order available.*/
 select product.title, product.product_id, orderItem.order_id, count(*) as order_count
 from product
 join orderItem
 on product.product_id = orderItem.product_id
 group by product_id having count(order_id)>=1;
 
 /*7.Show the product names, ids and total qty purchased so far for each product.*/
 select product.title, product.product_id, sum(orderitem.quantity) as order_qutity_total
 from product
 join orderItem
 on product.product_id = orderItem.product_id
 group by product_id ;
  
 /*8.Show User ID and Order ID associated with that User.*/
 select user.user_id, orders.order_id, user.first_name
 from user 
 join orders
 on user.user_id = orders.user_id;
 
 /*9.Show total subtotal of all the orders for user id 1.*/
 select user.user_id,orders.total, orders.sub_total
 from user
 join orders
 on user.user_id = orders.user_id
 where orders.user_id = 1;
 
 /*10.Show all the orders which are created on 19th Jan.*/
 select * from orders
 where DATE(createdAt) = "2021-01-05";
 
 /*11.Show product names and their product ids which are placed in order id 1.*/
 select product.title, product.product_id, orderItem.order_id
 from product
 join orderItem
 on product.product_id = orderItem.product_id
 where order_id = 1;
 
 /*12.List out the order of user ID 1 which has a discount greater than 100.*/
 select order_id, user_id, discount, first_name from orders
 where user_id = 1 and  discount>100;
 