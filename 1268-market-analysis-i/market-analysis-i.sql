# Write your MySQL query statement below

select u.user_id as buyer_id, u.join_date, count(o.order_date) as orders_in_2019
from users as u 
left join orders as o
on u.user_id = o.buyer_id
and o.order_date between '2019-01-01' AND '2019-12-31'
group by u.user_id