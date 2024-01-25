-- DESE is preparing a report on schools in the Cambridge 
-- chool district. In 7.sql, write a SQL query to find the
-- names of all schools in the Cambridge school district.
SELECT "name" FROM "schools" WHERE "district_id" = (
    SELECT "district_id" FROM "schools"
    WHERE "name" LIKE 'Cambridge%'
);