ALTER TABLE users.allergies NOCHECK CONSTRAINT ALL;
ALTER TABLE users.goals NOCHECK CONSTRAINT ALL;
ALTER TABLE users.dietTrack NOCHECK CONSTRAINT ALL;
ALTER TABLE users.dailyLog NOCHECK CONSTRAINT ALL;
ALTER TABLE admins.foods NOCHECK CONSTRAINT ALL;
ALTER TABLE admins.dietPlans NOCHECK CONSTRAINT ALL;
ALTER TABLE users.details NOCHECK CONSTRAINT ALL;
ALTER TABLE admins.adminDetails NOCHECK CONSTRAINT ALL;

-- Delete from child tables first to prevent foreign key constraint issues
DELETE FROM users.dailyLog;
DELETE FROM users.dietTrack;
DELETE FROM users.goals;
DELETE FROM users.allergies;

DELETE FROM admins.foods;
DELETE FROM admins.dietPlans;
DELETE FROM admins.adminDetails;

-- Now delete from the parent table
DELETE FROM users.details;

ALTER TABLE users.allergies CHECK CONSTRAINT ALL;
ALTER TABLE users.goals CHECK CONSTRAINT ALL;
ALTER TABLE users.dietTrack CHECK CONSTRAINT ALL;
ALTER TABLE users.dailyLog CHECK CONSTRAINT ALL;
ALTER TABLE admins.foods CHECK CONSTRAINT ALL;
ALTER TABLE admins.dietPlans CHECK CONSTRAINT ALL;
ALTER TABLE users.details CHECK CONSTRAINT ALL;
ALTER TABLE admins.adminDetails CHECK CONSTRAINT ALL;

