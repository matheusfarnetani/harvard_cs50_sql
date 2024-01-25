-- Identify school districts where additional support might be needed.

SELECT
    "districts"."name" AS "District Name",
    "expenditures"."per_pupil_expenditure" AS "Per Pupil Expenditure",
    "staff_evaluations"."exemplary" AS "Exemplary Percentage"
FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
JOIN "staff_evaluations" ON "districts"."id" = "staff_evaluations"."district_id"
WHERE "districts"."type" = 'Public School District'
AND "expenditures"."per_pupil_expenditure" < (
    SELECT AVG("per_pupil_expenditure") FROM "expenditures"
)
AND "staff_evaluations"."exemplary" < (
    SELECT AVG("exemplary") FROM "staff_evaluations"
)
ORDER BY "staff_evaluations"."exemplary" ASC, "expenditures"."per_pupil_expenditure" ASC;
