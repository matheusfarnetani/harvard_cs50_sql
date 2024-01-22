-- In 10.sql, write a SQL query to answer a question of your choice
-- about the prints. The query should:
--     Make use of AS to rename a column
--     Involve at least one condition, using WHERE
--     Sort by at least one column, using ORDER BY
SELECT ROUND(AVG("brightness"), 2) AS "Average Brightness",
ROUND(AVG("contrast"), 2) AS "Average Contrast",
ROUND(AVG("entropy"), 2) AS "Average Entropy",
"artist"
FROM "views"
WHERE "entropy" > 5
GROUP BY "artist"
ORDER BY "Average Entropy" DESC;