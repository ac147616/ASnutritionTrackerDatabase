DROP TABLE IF EXISTS users.details;
DROP TABLE IF EXISTS users.allergies;
DROP TABLE IF EXISTS users.goals;
DROP TABLE IF EXISTS users.dietTrack;
DROP TABLE IF EXISTS users.dailyLog;
DROP SCHEMA IF EXISTS users;
GO

DROP TABLE IF EXISTS admins.adminDetails;
DROP TABLE IF EXISTS admins.foods;
DROP TABLE IF EXISTS admins.dietPlans;
DROP SCHEMA IF EXISTS admins
GO 

-- create schemas

CREATE SCHEMA users;
go

CREATE SCHEMA admins;
go


-- create tables
CREATE TABLE users.details (
	userID INT IDENTITY (1, 1) PRIMARY KEY,
	username VARCHAR (255) NOT NULL,
	emailID VARCHAR (255) NOT NULL,
	passwordkey VARCHAR (100) NOT NULL,
	age INT check (age between 0 and 100),
	gender VARCHAR (225),
	CONSTRAINT chk_gender CHECK (UPPER(gender) IN ('MALE', 'FEMALE', 'NULL')),
	userWeight DECIMAL(5, 2),
	userHeight DECIMAL(5, 2),
	signUpDate DATE,
	);

CREATE TABLE users.allergies (
	allergyID INT IDENTITY (1, 1) PRIMARY KEY,
	allergy VARCHAR (255) NOT NULL,
	userID int FOREIGN KEY REFERENCES users.details(userID)
	);

CREATE TABLE users.goals (
	goalID INT IDENTITY (1, 1) PRIMARY KEY,
	userID int FOREIGN KEY REFERENCES users.details(userID),
	goal VARCHAR (255) NOT NULL,
	dateStarted DATE,
	dateEnded DATE
	);

CREATE TABLE users.dietTrack (
	dietTrackID INT IDENTITY (1, 1) PRIMARY KEY,
	planID INT FOREIGN KEY REFERENCES users.details(userID) NOT NULL,
	dateStarted DATE NOT NULL,
	dateEnded DATE,
	);


CREATE TABLE admins.adminDetails (
	adminID INT IDENTITY (1, 1) PRIMARY KEY,
	username VARCHAR (255) NOT NULL,
	emailID VARCHAR (255) NOT NULL,
	passwordkey VARCHAR (100) NOT NULL,																																			
	);

CREATE TABLE admins.foods (
	foodID INT IDENTITY (1, 1) PRIMARY KEY,
	foodName VARCHAR (255) NOT NULL,
	category VARCHAR (255) NOT NULL,
	calories DECIMAL(5, 2),
	carbohydrates DECIMAL(5, 2),
	proteins DECIMAL(5, 2),
	fats DECIMAL(5, 2),
	servingSize DECIMAL(5, 2)
	);

CREATE TABLE admins.dietPlans (
	planID INT IDENTITY (1, 1) PRIMARY KEY,
	planName VARCHAR (255) NOT NULL,
	caloriesTarget INT NOT NULL,
	proteinsTarget INT NOT NULL,
	carbohydratesTarget INT NOT NULL,
	fatsTarget INT NOT NULL
	);

CREATE TABLE users.dailyLog (
	logID INT IDENTITY (1, 1) PRIMARY KEY,
	userID int FOREIGN KEY REFERENCES users.details(userID),
	foodID int FOREIGN KEY REFERENCES admins.foods(foodID),
	mealTime VARCHAR (225),
	CONSTRAINT chk_mealTime CHECK (UPPER(mealTime) IN ('BREAKFAST', 'LUNCH', 'DINNER')),
	todayDate DATE
	);