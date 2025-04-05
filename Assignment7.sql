CREATE DATABASE IF NOT EXISTS FunctionDataBase;
USE FunctionDataBase;

CREATE TABLE IF NOT EXISTS Country (
    CountryID INT AUTO_INCREMENT PRIMARY KEY,
    CountryName VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS Persons (
    PersonID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

ALTER TABLE Persons
ADD DOB DATE;

INSERT INTO Country (CountryName) 
VALUES 
('India'), 
('United States'), 
('Canada'), 
('Germany'), 
('Australia');

INSERT INTO Persons (Name, DOB, CountryID) 
VALUES 
('John Doe', '1990-05-15', 1), 
('Jane Smith', '1985-08-20', 2), 
('Alice Johnson', '2000-03-10', 3), 
('Bob Brown', '1995-11-25', 4), 
('Charlie Davis', '1992-02-05', 5);

DELIMITER $$

CREATE FUNCTION CalculateAge (DOB DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE Age INT;
    SET Age = TIMESTAMPDIFF(YEAR, DOB, CURDATE()) - 
              (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(DOB, '%m%d'));
    RETURN Age;
END $$

DELIMITER ;


SELECT PersonID, Name, CalculateAge(DOB) AS Age
FROM Persons;

SELECT CountryName, CHAR_LENGTH(CountryName) AS NameLength
FROM Country;

SELECT CountryName, LEFT(CountryName, 3) AS FirstThreeChars
FROM Country;

SELECT CountryName, UPPER(CountryName) AS UpperCaseName
FROM Country;

SELECT CountryName, LOWER(CountryName) AS LowerCaseName
FROM Country;
