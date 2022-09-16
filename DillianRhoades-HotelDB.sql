DROP DATABASE IF EXISTS HotelReservation;

CREATE DATABASE HotelReservation;

USE  HotelReservation;

CREATE TABLE Address (
AddressId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Street VARCHAR(50) NOT NULL,
City VARCHAR(20) NOT NULL,
State VARCHAR(20) NOT NULL,
ZipCode CHAR(5) NOT NULL
);

CREATE TABLE Phone (
PhoneId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
PhoneNumber CHAR(10) NOT NULL
);

CREATE TABLE Guest (
GuestId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
AddressId INT NOT NULL,
PhoneId INT NOT NULL,
FOREIGN KEY fk_Guest_AddressId (AddressId)
REFERENCES Address (AddressId),
FOREIGN KEY fk_Guest_PhoneId (PhoneId)
REFERENCES Phone (PhoneId)
);

CREATE TABLE Reservation (
    ReservationId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    NumberOfAdults INT NOT NULL,
    NumberOfChildren INT NOT NULL,
    TotalCost DECIMAL(10 , 2) NOT NULL
);

CREATE TABLE GuestReservation (
GuestId INT NOT NULL,
ReservationId INT NOT NULL,
PRIMARY KEY (GuestId, ReservationId),
FOREIGN KEY fk_GuestReservation_GuestId (GuestId)
REFERENCES Guest (GuestId),
FOREIGN KEY fk_GuestReservation_ReservationId (ReservationId)
REFERENCES Reservation (ReservationId)
);

CREATE TABLE Type (
TypeId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
BasePrice DECIMAL(10, 2) NOT NULL,
StandardOccupancy INT NOT NULL,
MaximumOccupancy INT NOT NULL,
ExtraCostPerPerson DECIMAL(10, 2) NULL
);

CREATE TABLE Room (
RoomId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
RoomNumber INT NOT NULL,
Floor INT NOT NULL,
ADAAccessible TINYINT(1) NOT NULL
);

CREATE TABLE RoomReservation (
RoomId INT NOT NULL,
ReservationId INT NOT NULL,
PRIMARY KEY (RoomId, ReservationId),
FOREIGN KEY fk_RoomReservation_RoomId (RoomId)
REFERENCES Room (RoomId),
FOREIGN KEY fk_RoomReservation_ReservationId (ReservationId)
REFERENCES Reservation (ReservationId)
);

CREATE TABLE RoomType (
RoomId INT NOT NULL,
TypeId INT NOT NULL,
PRIMARY KEY (RoomId, TypeId),
FOREIGN KEY fk_RoomType_RoomId (RoomId)
REFERENCES Room (RoomId),
FOREIGN KEY fk_RoomType_TypeId (TypeId)
REFERENCES Type (TypeId)
);

CREATE TABLE Amenity (
AmenityId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(40) NOT NULL,
AdditionalRate DECIMAL(10, 2) NULL
);

CREATE TABLE RoomAmenity (
RoomId INT NOT NULL,
AmenityId INT NOT NULL,
PRIMARY KEY (RoomId, AmenityId),
FOREIGN KEY fk_RoomAmenity_RoomId (RoomId)
REFERENCES Room (RoomId),
FOREIGN KEY fk_RoomAmenity_AmenityId (AmenityId)
REFERENCES Amenity (AmenityId)
);




