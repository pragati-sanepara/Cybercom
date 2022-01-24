/*1.Get the users which are having permission id assigned as 2.*/

select rp.permissionId, u.firstName 
from user u 
join role r
on r.id = u.roleId
join role_permission rp
on r.id = rp.roleId
where rp.permissionId = 2;

/*2.Get a list of users who are working in organization id 1 along with organization title..*/

select o.id, u.firstName, o.title
from employee e
join organization o
on e.organizationId = o.id
join user u
on e.userId = u.id
where e.organizationId = 1;

/*3.Get all the employee emails who are created in the last two dates and have permission id 1.*/
select e.roleId, rp.permissionId, u.email ,e.createdAt 
from  employee e
join user u
on e.userId = u.id
join role_permission rp
on e.roleId = rp.roleId
where e.createdAt >= DATE_SUB(curdate(),INTERVAL 2 day) and permissionId = 1;


/*4.Get the active count of employees working in organization id 1.*/

select count(*) as count_emp, status from employee 
where organizationId = 1 and status = 1;

/*5.Get all the employee emails who were working last year.*/

select u.email, e.endsAt
from  employee e
join user u
on e.userId = u.id
where year(endsAt) = year(DATE_SUB(curdate(),INTERVAL 1 year));




/*1.Get all the users who created in the last 15 days.*/
select u.user_id, u.first_name, nl.created_at
from user u
join newsLetter nl
on u.user_id = nl.user_id
where nl.created_at >= DATE_SUB(curdate(),INTERVAL 15 day);

/*2.Get all the users with their addresses who are active subscribers.*/
select a.first_name, a.city, a.country, s.active
from user u
join subscriber s
on u.user_id = s.user_id
join address a
on u.user_id = a.user_id
where active = 1 ;

/*3.Get all the users who subscribed in the last 30 days and are active currently.*/
select u.first_name, s.active , s.created_at
from user u
join subscriber s
on u.user_id = s.user_id
where s.created_at >= date_sub(curdate(), interval 30 day) and active = 1;

select first_name, active, created_at
from subscriber 
where created_at >= date_sub(curdate(), interval 30 day) and active = 1;

/*4.Get all the users email who are currently in the active mailing list.*/
select s.first_name, s.email_address, ml.active
from subscriber s
join mailing_list ml
on s.subscriber_id = ml.subscriber_id
where ml.active = 1;

/*5.Get all the users email and newsletter title for which newsletter triggered today.*/

select u.first_name, u.email_address, n.title, nt.created_at
from newsLetter n
join user u
on n.user_id = u.user_id
join newsletter_trigger nt
on n.newsletter_id = nt.newsletter_id
where nt.created_at >= date_sub(curdate(), interval 0 day);

