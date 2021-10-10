DROP DATABASE IF EXISTS Art_gallery;

CREATE DATABASE Art_gallery;

DROP TABLE IF EXISTS Exhibition CASCADE;

CREATE TABLE Exhibition(
    ArtworkID SERIAL PRIMARY KEY,
    Artist VARCHAR(250) NOT NULL,
    Title VARCHAR(250) NOT NULL,
    ArtworkYear INT NOT NULL,
    Amount INT NOT NULL
);

DROP TABLE IF EXISTS Customers CASCADE;
CREATE TABLE Customers
(
    ID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(200),
    Phone BIGINT,
    Email VARCHAR(100),
    City VARCHAR(20),
    Country VARCHAR(50)
);

DROP TABLE IF EXISTS Payments CASCADE;
CREATE TABLE Payments
(
    ID SERIAL PRIMARY KEY,
    CustomerID INT,
    PaymentDate DATE,
    Amount NUMERIC,

    FOREIGN KEY(CustomerID) REFERENCES Customers(ID) ON DELETE SET NULL
);

DROP TABLE IF EXISTS Orders CASCADE;
CREATE TABLE Orders
(
    ID SERIAL PRIMARY KEY,
    PaymentID INT,
    DateRequired DATE,
    DateShipped DATE,
    Status VARCHAR(20),

    FOREIGN KEY(ID) REFERENCES Exhibition(ArtworkID) ON DELETE SET NULL,
    FOREIGN KEY(PaymentID) REFERENCES Payments(ID) ON DELETE SET NULL
);