with tablea as (
    select visited_on, 
    sum(amount) as amount
    from customer
    group by visited_on
),
tableb as (
    select visited_on, 
    amount, 
    sum(amount) over (
        order by visited_on 
        range between interval 6 day preceding and current row
    ) as total_amount, 
    avg(amount) over(
        order by visited_on
        range between interval 6 day preceding and current row
    ) as average_amount
    from tablea
)

select visited_on, 
total_amount as amount,
round(average_amount,2) as average_amount
from tableb
where visited_on >=(
    select min(visited_on) +interval 6 day from customer
)
order by visited_on;


