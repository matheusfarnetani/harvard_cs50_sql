-- Demonstrates deleting rows with ON DELETE actions
-- Uses mfa.db

-- Deletes an artist when foreign key ON DELETE actions is set to CASCADE
DELETE FROM "aritsts" WHERE "name" = 'Unidentified artist';