# Write your MySQL query statement below
with cte as (
select employee_id, name, count(name) as reports_count, reports_to, round(avg(age)) as average_age
from employees
where reports_to is not null
group by reports_to
)

select e.employee_id, e.name, c.reports_count, c.average_age
from employees as e
join cte as c
on e.employee_id = c.reports_to
order by e.employee_id