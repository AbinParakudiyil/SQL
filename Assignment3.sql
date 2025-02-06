# Create the Table (DDL - Data Definition Language)
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Age INT CHECK (Age > 18),
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
);

# Insert 10 rows
INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary)
VALUES
(1, 'John', 'Doe', '1985-06-15', 38, 'Male', 'IT', 30000),
(2, 'Aaliya', 'Khan', '1990-03-22', 33, 'Female', 'HR', 25000),
(3, 'David', 'Smith', '1982-09-10', 41, 'Male', 'Finance', 40000),
(4, 'Emily', 'Johnson', '1995-11-05', 28, 'Female', 'IT', 27000),
(5, 'Michael', 'Brown', '1988-07-19', 35, 'Male', 'Sales', 22000),
(6, 'Sarah', 'Williams', '1992-04-30', 31, 'Female', 'Marketing', 18000),
(7, 'James', 'Jones', '1980-12-12', 43, 'Male', 'IT', 32000),
(8, 'Sophia', 'Davis', '1987-08-25', 36, 'Female', 'HR', 28000),
(9, 'Daniel', 'Miller', '1993-05-15', 30, 'Male', 'Finance', 29000),
(10, 'Olivia', 'Wilson', '1984-10-10', 39, 'Female', 'Sales', 20000);

# Query to Retrieve Manager's Name and DOB for Manager_Id = 1
SELECT 
    First_name, Last_Name, DOB
FROM
    Managers
WHERE
    Manager_Id = 1;
    
# Query to Display Annual Income of All Managers
SELECT First_name, Last_Name, (Salary * 12) AS Annual_Income 
FROM Managers;

# Query to Display Records of All Managers Except ‘Aaliya’
SELECT * 
FROM Managers 
WHERE First_name <> 'Aaliya';

# Query to Display Details of Managers in IT Department with Salary > 25000
SELECT * 
FROM Managers 
WHERE Department = 'IT' AND Salary > 25000;

# Query to Display Details of Managers with Salary Between 10000 and 35000
SELECT * 
FROM Managers 
WHERE Salary BETWEEN 10000 AND 35000;







