-- Create database for countries and persons
CREATE DATABASE WorldData;
USE WorldData;

-- Create Country table
CREATE TABLE Country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100),
    population INT
);

-- Create Persons table
CREATE TABLE Persons (
    person_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    country_id INT,
    rating FLOAT,
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

-- Create database for product/customer
CREATE DATABASE Product;
USE Product;

-- Create Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY AUTO_INCREMENT,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    Zip_code VARCHAR(20),
    Country VARCHAR(50)
);

USE WorldData;

INSERT INTO Country (country_name, population) VALUES
('USA', 331000000),
('India', 1393000000),
('France', 67000000),
('Germany', 83000000),
('Japan', 125800000),
('Brazil', 213000000);

INSERT INTO Persons (first_name, last_name, country_id, rating) VALUES
('John', 'Doe', 1, 4.2),
('Jane', 'Smith', 1, 3.9),
('Raj', 'Kumar', 2, 4.5),
('Amit', 'Sharma', 2, 2.8),
('Pierre', 'Dubois', 3, 3.2),
('Marie', 'Curie', 3, 3.9),
('Hans', 'Zimmer', 4, 2.5),
('Yuki', 'Tanaka', 5, 4.7),
('Carlos', 'Silva', 6, 3.0);

USE Product;

INSERT INTO Customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com', '123-456-7890', '123 Elm St', 'Los Angeles', 'California', '90001', 'US'),
('Bob', 'Smith', 'bob.smith@example.com', '234-567-8901', '456 Oak St', 'San Diego', 'California', '90002', 'US'),
('Charlie', 'Brown', 'charlie.brown@example.com', '345-678-9012', '789 Pine St', 'New York', 'New York', '10001', 'US'),
('David', 'Lee', 'david.lee@example.com', '456-789-0123', '321 Cedar St', 'Houston', 'Texas', '77001', 'US'),
('Eva', 'Green', 'eva.green@example.com', '567-890-1234', '654 Maple St', 'Dallas', 'Texas', '77002', 'US'),
('Fiona', 'White', 'fiona.white@example.com', '678-901-2345', '987 Birch St', 'Chicago', 'Illinois', '60001', 'US'),
('George', 'King', 'george.king@example.com', '789-012-3456', '159 Spruce St', 'Seattle', 'Washington', '98001', 'US'),
('Helen', 'Walker', 'helen.walker@example.com', '890-123-4567', '753 Willow St', 'Miami', 'Florida', '33101', 'US'),
('Ian', 'Stone', 'ian.stone@example.com', '901-234-5678', '852 Palm St', 'Orlando', 'Florida', '33102', 'US'),
('Jack', 'Black', 'jack.black@example.com', '012-345-6789', '951 Ash St', 'San Jose', 'California', '90003', 'US'),
('Karen', 'Bell', 'karen.bell@example.com', '123-456-0000', '321 Peach St', 'Fresno', 'California', '90004', 'US');

USE WorldData;

SELECT c.country_name, COUNT(p.person_id) AS person_count
FROM Country c
JOIN Persons p ON c.country_id = p.country_id
GROUP BY c.country_name;

SELECT c.country_name, COUNT(p.person_id) AS person_count
FROM Country c
JOIN Persons p ON c.country_id = p.country_id
GROUP BY c.country_name
ORDER BY person_count DESC;

SELECT c.country_name, AVG(p.rating) AS avg_rating
FROM Country c
JOIN Persons p ON c.country_id = p.country_id
GROUP BY c.country_name
HAVING avg_rating > 3.0;

SELECT DISTINCT c.country_name
FROM Country c
JOIN Persons p ON c.country_id = p.country_id
WHERE c.country_name != 'USA'
AND p.rating IN (
    SELECT DISTINCT rating
    FROM Persons p2
    JOIN Country c2 ON p2.country_id = c2.country_id
    WHERE c2.country_name = 'USA'
);

SELECT country_name, population
FROM Country
WHERE population > (
    SELECT AVG(population) FROM Country
);

USE Product;

CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS full_name, Email
FROM Customer;

-- SELECT from view
SELECT * FROM customer_info;

CREATE VIEW US_Customers AS
SELECT * FROM Customer
WHERE Country = 'US';

CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS full_name, Email, Phone_no, State
FROM Customer;

-- Disable safe updates
SET SQL_SAFE_UPDATES = 0;

-- Now run the update query
UPDATE Customer
SET Phone_no = '999-999-9999'
WHERE State = 'California';

-- (Optional) Re-enable it if needed
SET SQL_SAFE_UPDATES = 1;

SELECT State, COUNT(*) AS customer_count
FROM Customer
GROUP BY State
HAVING customer_count > 5;

SELECT State, COUNT(*) AS customer_count
FROM Customer_details
GROUP BY State;

SELECT * FROM Customer_details
ORDER BY State ASC;















