# Write your MySQL query statement below

select p.firstName, p.Lastname, t.city, t.state
from person as p
left join address as t
on p.personid = t.personid
