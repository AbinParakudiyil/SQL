USE Assignment4;
-- Inner Join: Retrieves persons with a matching country in the Country table
SELECT Persons.Fname, Persons.Lname, Persons.Country_name, Country.Population, Country.Area 
FROM Persons 
INNER JOIN Country ON Persons.Country_Id = Country.Id;

-- Left Join: Retrieves all persons, even if they don't have a matching country
SELECT Persons.Fname, Persons.Lname, Persons.Country_name, Country.Population, Country.Area 
FROM Persons 
LEFT JOIN Country ON Persons.Country_Id = Country.Id;

-- Right Join: Retrieves all countries, even if no person is associated with them
SELECT Persons.Fname, Persons.Lname, Persons.Country_name, Country.Population, Country.Area 
FROM Persons 
RIGHT JOIN Country ON Persons.Country_Id = Country.Id;

-- UNION removes duplicates and returns a unique list of country names from both tables
SELECT Country_name FROM Country 
UNION 
SELECT Country_name FROM Persons;

-- UNION ALL keeps duplicates and returns all country names from both tables
SELECT Country_name FROM Country 
UNION ALL
SELECT Country_name FROM Persons;

-- ROUND function rounds the rating values to the nearest whole number
SELECT Id, Fname, Lname, Country_name, ROUND(Rating) AS Rounded_Rating 
FROM Persons;


