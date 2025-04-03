CREATE DATABASE Sorting_and_Grouping_Data_Assignment;
USE Sorting_and_Grouping_Data_Assignment;

CREATE TABLE Country (
    Id INT PRIMARY KEY,           -- Unique ID for each country
    Country_name VARCHAR(100),     -- Name of the country
    Population INT,                -- Population of the country
    Area INT                        -- Area of the country in square km
);

CREATE TABLE Persons (
    Id INT PRIMARY KEY,            -- Unique ID for each person
    Fname VARCHAR(50),             -- First name of the person
    Lname VARCHAR(50),             -- Last name of the person (can be NULL)
    Population INT,                -- Associated population value
    Rating DECIMAL(3,2),           -- Rating given to the person
    Country_Id INT,                -- Foreign key linking to Country table
    Country_name VARCHAR(100),     -- Country name (redundant for quick access)
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)  -- Establish relationship with Country table
);

INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'India', 1400000000, 3287263),
(2, 'USA', 331000000, 9833520),
(3, 'China', 1440000000, 9596961),
(4, 'Germany', 83000000, 357022),
(5, 'France', 67000000, 551695),
(6, 'Brazil', 213000000, 8515767),
(7, 'Canada', 38000000, 9984670),
(8, 'Australia', 26000000, 7692024),
(9, 'UK', 67000000, 243610),
(10, 'Japan', 126000000, 377975);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 1000, 4.5, 1, 'India'),
(2, 'Jane', 'Smith', 2000, 3.8, 2, 'USA'),
(3, 'Alice', 'Brown', 1500, 4.2, 3, 'China'),
(4, 'Robert', 'Johnson', 800, 4.0, 4, 'Germany'),
(5, 'Emily', 'Davis', 1200, 4.7, 5, 'France'),
(6, 'Michael', 'Miller', 2500, 3.5, 6, 'Brazil'),
(7, 'Sarah', 'Wilson', 1800, 4.6, 7, 'Canada'),
(8, 'David', 'Moore', 3000, 3.9, 8, 'Australia'),
(9, 'Laura', 'Taylor', 2200, 4.1, 9, 'UK'),
(10, 'Daniel', 'Anderson', 1700, 4.3, 10, 'Japan');

SELECT LEFT(Country_name, 3) AS Short_Name FROM Country;

SELECT CONCAT(Fname, ' ', Lname) AS Full_Name FROM Persons;

SELECT COUNT(DISTINCT Country_name) AS Unique_Countries FROM Persons;

SELECT MAX(Population) AS Max_Population FROM Country;

SELECT MIN(Population) AS Min_Population FROM Persons;

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(11, 'Chris', NULL, 1900, 4.0, 2, 'USA'),
(12, 'Mia', NULL, 1400, 4.2, 5, 'France');

SELECT COUNT(Lname) AS Count_Lname FROM Persons;

SELECT COUNT(*) AS Total_Persons FROM Persons;

SELECT Population FROM Country LIMIT 3;

SELECT * FROM Country ORDER BY RAND() LIMIT 3;

SELECT * FROM Persons ORDER BY Rating DESC;

SELECT Country_name, SUM(Population) AS Total_Population 
FROM Persons 
GROUP BY Country_name;

SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name
HAVING Total_Population > 50000;

SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Avg_Rating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY Avg_Rating ASC;

SELECT * FROM Country;
SELECT * FROM Persons;














