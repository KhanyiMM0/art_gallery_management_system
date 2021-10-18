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
    Gender VARCHAR(20),
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

    FOREIGN KEY(CustomerID) REFERENCES Customers(ID) ON DELETE SET NULL,
    FOREIGN KEY(Amount) REFERENCES Exhibition(Amount) ON DELETE SET NULL
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

INSERT INTO Exhibition(ArtworkID, Artist, Title, ArtworkYear, Amount)
VALUES 
('100', 'Josef Gocke', 'Home and Mountain', 1997, 16667),
('101', 'Nora Lemmon', 'Spring Flowers', 2003, 1583),
('102', 'Jualinda Frey', 'Nguni Black and White', 2016, 3333),
('103', 'Diane Weiman', 'African Hoopoe', 2011, 13333),
('104', 'Mbongeni Naphtal Mhlongo', 'Pure Blood', 1999, 9847);

INSERT INTO Customers(ID, FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES 
('1', 'Ashley', 'Herbert', 'Male', '284 chaucer st', '0756129550', 'ashely07_H@gmail.com', 'Johannesburg', 'South Africa'),
('2', 'Nicole', 'Wilmans', 'Female', '240 Sect 1', '08562140357', 'nicolewils@gmail.com', 'Cape Town', 'South Africa'),
('3', 'Thato', 'Booi', 'Male', '81 Everton Road, Gillits', '06123478509', 'th_booin@gmail.com', 'Durban', 'South Africa'),
('4', 'Shamiso', 'Masuku', 'Male', '290A Dorset Ecke', '+44853248152', 'shamiso.masuku@yahoo.com', 'Berlin', 'Germany'),
('5', 'Lihle', 'Ndlovu', 'Female', '2 Wernerring', '+44836578958', 'Ls2156@yahoo.com', 'Frankfurt', 'Germany');

INSERT INTO Payments(ID, CustomerID, PaymentDate, Amount)
VALUES 
('1', '4', '2020-09-01', 9847),
('2', '5', '2020-09-03', 16667),
('3', '2', '2020-09-03', 1583);

INSERT INTO Orders(ID, PaymentID, DateRequired, DateShipped, Status)
VALUES 
('1', '2', '2020-09-05', NULL, 'Not shipped'),
('2', '2', '2020-09-04', '2020-09-03', 'Shipped'),
('3', '3', '2020-09-06', NULL, 'Not shipped');