-- Write your PostgreSQL query statement below

with cte as (
    select  book_id, count(book_id) as current_borrowers
    from borrowing_records
    where return_date is null
    group by book_id
)


select l.book_id, title, author, genre, publication_year, current_borrowers
from library_books as l
join cte as c
on c.book_id = l.book_id
where (current_borrowers - total_copies) = 0 
order by current_borrowers desc, title asc
