-- Clean File
DROP TABLE IF EXISTS "meteorites";

-- Import data from .csv
.import --csv meteorites.csv temp

-- Clean NULL values
UPDATE "temp" SET "year" = NULL
WHERE "year" = '';

UPDATE "temp" SET "lat" = NULL
WHERE "lat" = '';

UPDATE "temp" SET "long" = NULL
WHERE "long" = '';

UPDATE "temp" SET "mass" = NULL
WHERE "mass" = '';

-- Create Table
CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" REAL,
    "discovery" TEXT NOT NULL CHECK("discovery" IN ("Fell", "Found")),
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY("id")
);

-- Insert data into table
INSERT INTO "meteorites" (
    "name",
    "class",
    "mass",
    "discovery",
    "year",
    "lat",
    "long"
)
SELECT 
    "name",
    "class",
    ROUND("mass", 2),
    "discovery",
    "year",
    ROUND("lat", 2),
    ROUND("long", 2)
FROM (
    SELECT
        "name",
        "class",
        "mass",
        "discovery",
        "year",
        "lat",
        "long"
    FROM "temp"
    WHERE "nametype" <> "Relict"
    ORDER BY "year" ASC, "name"
);

-- Clean
DROP TABLE "temp";