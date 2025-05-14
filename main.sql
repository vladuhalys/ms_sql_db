USE master
GO
-- Create a new database
CREATE DATABASE PetAndOwner
GO
USE PetAndOwner
GO
-- Create a table for pet owners
CREATE TABLE Owners (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100),
    Phone NVARCHAR(15) NOT NULL ,

    CONSTRAINT CHK_Email CHECK(Email LIKE '%_@__%.__%'),
    CONSTRAINT CHK_Phone CHECK(Phone LIKE '%[0-9]%'),
);
GO
-- Create a table for pets
CREATE TABLE Pets (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Type NVARCHAR(50) NOT NULL,
    Breed NVARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    OwnerId INT,

    FOREIGN KEY (OwnerId) REFERENCES Owners(Id),
    CONSTRAINT CHK_Age CHECK(Age >= 0 AND Age <= 50),
    CONSTRAINT CHK_Name CHECK(Name LIKE '[A-Z]%'),
);
GO
-- Insert sample data into Owners table
INSERT INTO Owners (FirstName, LastName, Email, Phone)
VALUES
('John', 'Doe', 'jhon.dou@gmail.com', '1234567890'),
('Jane', 'Smith', 'jane.dou@gmail.com', '0987654321'),
('Alice', 'Johnson', 'alice.johnson@gmail.com', '5551234567'),
('Bob', 'Williams', 'bob.williams@gmail.com', '5559876543'),
('Carol', 'Brown', 'carol.brown@gmail.com', '5556789123'),
('David', 'Miller', 'david.miller@gmail.com', '5553456789'),
('Eve', 'Davis', 'eve.davis@gmail.com', '5552345678');
GO
-- Insert sample data into Pets table
INSERT INTO Pets (Name, Type, Breed, Age, OwnerId)
VALUES
('Buddy', 'Dog', 'Golden Retriever', 3, 1),
('Mittens', 'Cat', 'Siamese', 2, 2),
('Charlie', 'Dog', 'Beagle', 5, 3),
('Luna', 'Cat', 'Maine Coon', 4, 4),
('Max', 'Dog', 'Bulldog', 1, 5),
('Bella', 'Cat', 'Persian', 6, 6),
('Rocky', 'Dog', 'Poodle', 2, 7),
('Simba', 'Cat', 'Bengal', 3, NULL),
('Daisy', 'Dog', 'Labrador', 7, NULL),
('Coco', 'Cat', 'Sphynx', 5, NULL);
GO

--Standart selects
SELECT * FROM Owners
GO
SELECT * FROM Pets
Go

--ALL TABLES
SELECT * FROM Pets, Owners
WHERE Pets.OwnerId = Owners.Id
GO

--SELECTS with filters
SELECT P.Name, P.Age, P.Breed, P.Type, O.FirstName + ' ' + O.LastName AS 'Full Name', O.Phone FROM Pets AS P, Owners AS O
WHERE P.OwnerId = O.Id AND P.Age BETWEEN 1 AND 3
