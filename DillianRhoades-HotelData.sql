USE HotelReservation;

INSERT INTO Address (Street, City, State, ZipCode) VALUES
('4985 Black Run Rd.', 'Chillicothe', 'OH', '45601'),
('379 Old Shore Street', 'Council Bluffs', 'IA', '51501'),
('750 Wintergreen Dr.', 'Wasilla', 'AK', '99654'),
('9662 Foxrun Lane', 'Harlingen', 'TX', '78552'),
('9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096'),
('762 Wild Rose Street', 'Saginaw', 'MI', '48601'),
('7 Poplar Dr.', 'Arvada', 'CO', '80003'),
('70 Oakwood St.', 'Zion', 'IL', '60099'),
('7556 Arrowhead St.', 'Cumberland', 'RI', '02864'),
('77 West Surrey Street', 'Oswego', 'NY', '13126'),
('939 Linda Rd.', 'Burke', 'VA', '22015'),
('87 Queen St.', 'Drexel Hill', 'PA', '19026');

INSERT INTO Phone (PhoneNumber) VALUES
('7408045073'), ('2915530508'), ('4782779632'), 
('3084940198'), ('2147300298'), ('3775070974'), 
('8144852615'), ('2794910960'), ('4463966785'), 
('8347271001'), ('4463516860'), ('2318932755');

INSERT INTO Guest (FirstName, LastName, AddressId, PhoneId) VALUES
('Dillian', 'Rhoades', 1, 1), ('Mark', 'Simmer', 2, 2), ('Bettyann', 'Seery', 3, 3),
('Duane', 'Cullison', 4, 4), ('Karie', 'Yang', 5, 5),
('Aurore', 'Lipton', 6, 6), ('Zachery', 'Luechtefeld', 7, 7),
('Jeremiah', 'Pendergrass', 8, 8), ('Walter', 'Holaway', 9, 9),
('Wilfred', 'Vise', 10, 10), ('Maritza', 'Tilton', 11, 11),
('Joleen', 'Tison', 12, 12);

INSERT INTO Reservation (StartDate, EndDate, NumberOfAdults, NumberOfChildren, TotalCost) VALUES
('2023-02-02', '2023-04-02', 1, 0, 299.98),
('2023-02-05', '2023-02-10', 2, 1, 999.95),
('2023-02-22', '2023-02-24', 2, 0, 349.98),
('2023-03-06', '2023-03-07', 2, 2, 199.99),
('2023-03-17', '2023-03-20', 1, 1, 524.97),
('2023-03-18', '2023-03-23', 3, 0, 924.95),
('2023-03-29', '2023-03-31', 2, 2, 349.98),
('2023-03-31', '2023-04-05', 2, 0, 874.95),
('2023-04-09', '2023-04-13', 1, 0, 799.96),
('2023-04-23', '2023-04-24', 1, 1, 174.99),
('2023-05-30', '2023-06-02', 2, 4, 1199.97),
('2023-06-10', '2023-06-14', 2, 0, 599.96),
('2023-06-10', '2023-06-14', 1, 0, 599.96),
('2023-06-17', '2023-06-18', 3, 0, 184.99),
('2023-06-28', '2023-07-02', 2, 0, 699.96),
('2023-07-13', '2023-07-14', 3, 1, 184.99),
('2023-07-18', '2023-07-21', 4, 2, 1259.97),
('2023-07-28', '2023-07-29', 2, 1, 199.99),
('2023-08-30', '2023-09-01', 1, 0, 349.98),
('2023-09-16', '2023-09-17', 2, 0, 149.99),
('2023-09-13', '2023-09-15', 2, 2, 399.98),
('2023-11-22', '2023-11-25', 2, 2, 1199.97),
('2023-11-22', '2023-11-25', 2, 0, 449.97),
('2023-11-22', '2023-11-25', 2, 2, 599.97),
('2023-12-24', '2023-12-28', 2, 0, 699.96);

INSERT INTO GuestReservation (GuestId, ReservationId) VALUES
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(1, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(12, 13),
(6, 14),
(1, 15),
(9, 16),
(10, 17),
(3, 18),
(3, 19),
(2, 20),
(5, 21),
(4, 22),
(2, 23),
(2, 24),
(11, 25);

INSERT INTO Type (Name, StandardOccupancy, MaximumOccupancy, ExtraCostPerPerson, BasePrice) VALUES
('Single', 2, 2, null, 174.99),
('Single', 2, 2, null, 149.99),
('Double', 2, 4, 10, 174.99),
('Double', 2, 4, 10, 199.99),
('Suite', 3, 8, 20, 399.99);

INSERT INTO Room (RoomNumber, Floor, ADAAccessible) VALUES
(201, 2, 0),
(202, 2, 1),
(203, 2, 0),
(204, 2, 1),
(205, 2, 0),
(206, 2, 1),
(207, 2, 0),
(208, 2, 1),
(301, 3, 0),
(302, 3, 1),
(303, 3, 0),
(304, 3, 1),
(305, 3, 0),
(306, 3, 1),
(307, 3, 0),
(308, 3, 1),
(401, 4, 1),
(402, 4, 1);

INSERT INTO RoomType (RoomId, TypeId) VALUES
(1, 4),
(2, 3),
(3, 4),
(4, 3),
(5, 1),
(6, 2),
(7, 1),
(8, 2),
(9, 4),
(10, 3),
(11, 4),
(12, 3),
(13, 1),
(14, 2),
(15, 1),
(16, 2),
(17, 5),
(18, 5);

INSERT INTO RoomReservation (RoomId, ReservationId) VALUES
(16, 1),
(3, 2),
(13, 3),
(1, 4),
(15, 5),
(10, 6),
(2, 7),
(12, 8),
(9, 9),
(7, 10),
(17, 11),
(6, 12),
(8, 13),
(12, 14),
(5, 15),
(4, 16),
(17, 17),
(11, 18),
(13, 19),
(8, 20),
(3, 21),
(17, 22),
(6, 23),
(9, 24),
(10, 25);

INSERT INTO Amenity (Name, AdditionalRate) VALUES
('Jacuzzi', 25),
('Microwave', null),
('Refrigerator', null),
('Oven', null);

INSERT INTO RoomAmenity (RoomId, AmenityId) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(3, 2),
(4, 3),
(5, 1),
(5, 2),
(5, 3),
(6, 2),
(6, 3),
(7, 1),
(7, 2),
(7, 3),
(8, 2),
(8, 3),
(9, 1),
(9, 2),
(10, 3),
(11, 1),
(11, 2),
(12, 3),
(13, 1),
(13, 2),
(13, 3),
(14, 2),
(14, 3),
(15, 1),
(15, 2),
(15, 3),
(16, 2),
(16, 3),
(17, 2),
(17, 3),
(17, 4),
(18, 2),
(18, 3),
(18, 4);





