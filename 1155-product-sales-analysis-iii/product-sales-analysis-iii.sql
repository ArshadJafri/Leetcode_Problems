# Write your MySQL query statement below
with cte as (

select product_id, min(`year`) as first_year
from sales
group by product_id
)

select c.product_id, c.first_year, s.quantity, s.price
from cte as c
join sales as s

  ON s.product_id = c.product_id 
  AND s.year = c.first_year;

