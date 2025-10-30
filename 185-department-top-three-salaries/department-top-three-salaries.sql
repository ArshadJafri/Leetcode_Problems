# Write your MySQL query statement below

with cte as(
    select e.name as Employee,
    e.salary as Salary,
    e.id as EmployeeId,
    e.departmentId as DepartmentId,
    dense_rank() over (partition by DepartmentId order by Salary desc) as rnk
    from employee as e 
)

select d.name as Department,
r.Employee,
r.Salary 
from department as d
join cte as r
on d.id = r.DepartmentId
where r.rnk <=3
