with converted_users as (
    select user_id
    from useractivity
    group by user_id
    having sum(case when activity_type='free_trial' then 1 else 0 end) >0
    and 
    sum(case when activity_type ='paid' then 1 else 0 end) >0
),
avg_users as(
    select user_id,
    activity_type,
    avg(activity_duration) as avg_duration
    from useractivity
    where activity_type in ('free_trial', 'paid')
    group by user_id, activity_type
)

select c.user_id,
round(
    avg(case when a.activity_type ='free_trial' then a.avg_duration end),2 
) as trial_avg_duration,
round(
    avg(case when a.activity_type ='paid' then a.avg_duration end), 2) as paid_avg_duration

from converted_users as c
join avg_users as a
on c.user_id = a.user_id
group by c.user_id
order by c.user_id;