CREATE DATABASE Assignment4; 
USE Assignment4;
-- Create the 'Country' table
CREATE TABLE Country (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Country_name VARCHAR(100) NOT NULL,
    Population INT NOT NULL,
    Area INT NOT NULL
);

-- Create the 'Persons' table
CREATE TABLE Persons (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    Population INT NOT NULL,
    Rating DECIMAL(3,1) NOT NULL,
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

-- Insert 10 records into 'Country' table
INSERT INTO Country (Country_name, Population, Area) VALUES
('USA', 331000000, 9833517),
('Canada', 37700000, 9984670),
('UK', 67800000, 243610),
('India', 1380000000, 3287263),
('Australia', 25700000, 7692024),
('France', 67000000, 551695),
('Germany', 83000000, 357022),
('Brazil', 213000000, 8515767),
('Japan', 126000000, 377975),
('South Africa', 59300000, 1219090);

-- Insert 10 records into 'Persons' table
INSERT INTO Persons (Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
('John', 'Doe', 100000, 4.5, 1, 'USA'),
('Jane', 'Smith', 200000, 3.9, 2, 'Canada'),
('David', 'Johnson', 150000, 4.7, 3, 'UK'),
('Emily', 'Brown', 80000, 4.1, 4, 'India'),
('Michael', 'Wilson', 120000, 3.5, 5, 'Australia'),
('Anna', 'Taylor', 95000, 4.8, 1, 'USA'),
('James', 'Anderson', 110000, 4.0, 6, 'France'),
('Sophia', 'Martinez', 130000, 3.2, 7, 'Germany'),
('Daniel', 'Harris', 140000, 4.6, 8, 'Brazil'),
('Olivia', 'Clark', 160000, 3.8, NULL, NULL); -- This row has a NULL country

-- Select unique country names from the Persons table
SELECT DISTINCT Country_name FROM Persons;

-- Retrieve first names and last names with aliases
SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;

-- Retrieve persons having a rating greater than 4.0
SELECT * FROM Persons WHERE Rating > 4.0;

-- Retrieve countries where population is greater than 1,000,000
SELECT * FROM Country WHERE Population > 1000000;

-- Retrieve persons where the country is 'USA' or rating is greater than 4.5
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;

-- Retrieve persons where the country name is NULL
SELECT * FROM Persons WHERE Country_name IS NULL;

-- Retrieve persons from 'USA', 'Canada', and 'UK'
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');

-- Retrieve persons not from 'India' and 'Australia'
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');

-- Retrieve countries with population between 500,000 and 2,000,000
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;

-- Retrieve countries where name does not start with 'C'
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';










