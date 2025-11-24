-- Write your PostgreSQL query statement below
with movie_avg as (
    select m.movie_id, avg(rating), mv.title
    from MovieRating as m
    join movies as mv
    on mv.movie_id = m.movie_id
    WHERE m.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    group by m.movie_id, title
    order by avg desc, title
    limit 1
    

),
movie_rating as (
    select m.user_id, u.name, count(m.user_id) as cnt
    from users as u
    join  MovieRating as m
    on u.user_id = m.user_id
    group by m.user_id, u.name
    order by cnt desc, u.name
    limit 1 

)

select name as results from movie_rating
union all 
select title as results from movie_avg


