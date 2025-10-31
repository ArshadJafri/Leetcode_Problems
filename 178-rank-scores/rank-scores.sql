# Write your MySQL query statement below
with cte as (

select id,score,
dense_rank() over (order by score desc) as rnk
from scores 

)

select score, rnk as 'rank'
from cte