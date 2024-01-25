-- In Massachusetts, school district expenditures are in part
-- determined by local taxes on property (e.g., home) values.
-- In 10.sql, write a SQL query to find the 10 public school
-- districts with the highest per-pupil expenditures. Your query
-- should return the names of the districts and the per-pupil
-- expenditure for each.
SELECT "districts"."name", "expenditures"."per_pupil_expenditure"
FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
WHERE "districts"."id" IN (
    SELECT "district_id" FROM "schools"
    WHERE "type" = 'Public School'
)
ORDER BY "expenditures"."per_pupil_expenditure" DESC
LIMIT 10;

-- SELECT "districts"."name", "expenditures"."per_pupil_expenditure"
-- FROM "districts"
-- JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
-- WHERE "districts"."id" IN (
-- SELECT "district_id" FROM "expenditures"
--     WHERE "district_id" IN (
--         SELECT "district_id" FROM "schools"
--         WHERE "type" = 'Public School'
--     )
--     ORDER BY "per_pupil_expenditures" DESC
--     LIMIT 10
-- );