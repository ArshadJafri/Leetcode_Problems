# Write your MySQL query statement below
with cte as (
select student, class, count(*) as cnt
from courses
group by class

)

select class from cte 
where cnt >= 5

