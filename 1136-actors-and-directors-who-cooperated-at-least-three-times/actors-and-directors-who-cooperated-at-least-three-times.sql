with cte as(
SELECT actor_id, director_id, COUNT(*) as cnt
FROM actordirector
GROUP BY actor_id, director_id  
)

select actor_id, director_id from cte where cnt >= 3;

