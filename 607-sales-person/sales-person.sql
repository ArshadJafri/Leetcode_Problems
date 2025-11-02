WITH cte AS (
    SELECT DISTINCT o.sales_id
    FROM orders AS o
    JOIN company AS c
    ON o.com_id = c.com_id
    WHERE c.name = 'RED'
)
SELECT s.name
FROM salesperson AS s
WHERE s.sales_id NOT IN (SELECT sales_id FROM cte);
