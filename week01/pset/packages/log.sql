
-- *** The Lost Letter ***
-- Checking if address exist
SELECT * FROM "addresses"
WHERE "address" = '900 Somerville Avenue';
SELECT * FROM "addresses"
WHERE "address" = '2 Finnegan Street'; -- Doesn't exist

SELECT * FROM "addresses"
WHERE "address" LIKE '2 Fi%'; -- There is a "2 Finnigan Street"

-- Found Package
SELECT * FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
)
AND "to_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" LIKE '2 Fi%'
);

-- Checking package
SELECT * FROM "scans"
WHERE "package_id" = (
    SELECT "id" FROM "packages"
    WHERE "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
    )
    AND "to_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" LIKE '2 Fi%'
    )
);

-- Checking last addresses register to package
SELECT * FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
        )
        AND "to_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" LIKE '2 Fi%'
        )
    )
    ORDER BY "timestamp" DESC
    LIMIT 1
);

-- *** The Devious Delivery ***
-- Check for packages without "from_address_id"
SELECT * FROM "packages"
WHERE "from_address_id" IS NULL; -- Duck debugger

-- Get address from lastest scan
SELECT * FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" IS NULL
    )
    ORDER BY "timestamp" DESC
    LIMIT 1
); -- Police Station

-- *** The Forgotten Gift ***
SELECT * FROM "addresses"
WHERE "address" = '109 Tileston Street';
SELECT * FROM "addresses"
WHERE "address" = '728 Maple Place';

SELECT * FROM "packages"
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
)
AND "to_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
); -- Flowers

SELECT * FROM "drivers"
WHERE "id" = (
    SELECT "driver_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
        )
        AND "to_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
        )
    )
    ORDER BY "timestamp" DESC
    LIMIT 1
); -- Mikel