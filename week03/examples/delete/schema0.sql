-- Demonstrates schema of mfa.db for delete files
-- Creates mfa.db

-- Deletes prior tables if they exist
DROP TABLE IF EXISTS "collections";
DROP TABLE IF EXISTS "aritsts";
DROP TABLE IF EXISTS "created";

-- Creates new table and add data
CREATE TABLE "collections" IF NOT EXISTS (
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "accession_number" TEXT NOT NULL UNIQUE,
    "acquired" NUMERIC,
    PRIMARY KEY("id")
);

INSERT INTO "collectinos" ("title", "accession_number", "acquired")
VALUES
('Profusion of flowers', '56.257', '1956-04-12'),
('Farmers working at dawn', '11.6152', '1911-08-03'),
('Spring outing', '14.76', '1914-01-08'),
('Imaginative landscape', '56.496', NULL),
('Peonies and butterfly', '06.1899', '1906-01-01'),
('Tile Lunette', '06.2437', '1906-11-08'),
('Statuette of a shrew', '01.105', '19501-02-11');

-- Tile Lunette: https://collections.mfa.org/objects/8559/tile-lunette?ctx=0510197c-0c9b-4a77-93ea-f5246427388a&idx=3
-- Statuette of a shrew: https://collections.mfa.org/objects/132432/statuette-of-a-shrew?ctx=3247cc4b-30db-4047-b9c7-813a6d39e11c&idx=5