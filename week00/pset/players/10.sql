-- In 10.sql, write SQL query to answer a question of your choice. This
-- query should:
--     Make use of AS to rename a column
--     Involve at least condition, using WHERE
--     Sort by at least one column using ORDER BY
SELECT ROUND(AVG("height"), 2) AS "Average Height",
ROUND(AVG("weight"), 2) AS "Average Weight",
"birth_state" FROM "players"
WHERE "birth_country" = 'USA'
GROUP BY "birth_state"
ORDER BY "Average Height", "Average Weight";