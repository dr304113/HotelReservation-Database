
USE HotelReservation;

-- Returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.

SELECT 
g.FirstName, 
g.LastName, 
ro.RoomNumber,
res.StartDate,
res.EndDate
FROM Guest g
INNER JOIN GuestReservation gres
ON g.GuestId = gres.GuestId
INNER JOIN Reservation res
ON gres.ReservationId = res.ReservationId
INNER JOIN RoomReservation rr
ON res.ReservationId = rr.ReservationId
INNER JOIN Room ro
ON rr.RoomId = ro.RoomId
WHERE EndDate < '2023-08-01' AND EndDate > '2023-06-30';

-- 'Dillian Rhoades','205','2023-06-28 00:00:00','2023-07-02 00:00:00'
-- 'Walter Holaway','204','2023-07-13 00:00:00','2023-07-14 00:00:00'
-- 'Wilfred Vise','401','2023-07-18 00:00:00','2023-07-21 00:00:00'
-- 'Bettyann Seery','305','2023-07-28 00:00:00','2023-07-29 00:00:00'

-- Returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.

SELECT 
g.FirstName,
g.LastName, 
ro.RoomNumber,
res.StartDate,
res.EndDate
FROM Guest g
INNER JOIN GuestReservation gres
ON g.GuestId = gres.GuestId
INNER JOIN Reservation res
ON gres.ReservationId = res.ReservationId
INNER JOIN RoomReservation rr
ON res.ReservationId = rr.ReservationId
INNER JOIN Room ro
ON rr.RoomId = ro.RoomId
INNER JOIN RoomAmenity ra
ON ro.RoomId = ra.RoomId
INNER JOIN Amenity a
ON ra.AmenityId = a.AmenityId
WHERE a.Name = 'Jacuzzi';

-- Karie	Yang	201	2023-03-06	2023-03-07
-- Bettyann	Seery	203	2023-02-05	2023-02-10
-- Karie	Yang	203	2023-09-13	2023-09-15
-- Dillian	Rhoades	205	2023-06-28	2023-07-02
-- Wilfred	Vise	207	2023-04-23	2023-04-24
-- Walter	Holaway	301	2023-04-09	2023-04-13
-- Mark	Simmer	301	2023-11-22	2023-11-25
-- Bettyann	Seery	303	2023-07-28	2023-07-29
-- Duane	Cullison	305	2023-02-22	2023-02-24
-- Bettyann	Seery	305	2023-08-30	2023-09-01
-- Dillian	Rhoades	307	2023-03-17	2023-03-20

-- Returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation.

SELECT
g.FirstName, 
g.LastName,  
ro.RoomNumber, 
res.StartDate, 
res.NumberOfAdults + res.NumberOfChildren totalPeople
FROM Guest g 
INNER JOIN GuestReservation gres
ON g.GuestId = gres.GuestId
INNER JOIN Reservation res
ON gres.ReservationId = res.ReservationId
INNER JOIN RoomReservation rr
ON res.ReservationId = rr.ReservationId
INNER JOIN Room ro
ON rr.RoomId = ro.RoomId
WHERE FirstName = 'Dillian';

-- Dillian	Rhoades	307	2023-03-17	2
-- Dillian	Rhoades	205	2023-06-28	2

-- Returns a list of rooms, reservation ID, and per-room cost for each reservation.

SELECT
ro.RoomNumber,
res.ReservationId,
res.TotalCost
FROM Room ro
LEFT JOIN RoomReservation rr
ON ro.RoomId = rr.RoomId
LEFT OUTER JOIN Reservation res
ON rr.ReservationId = res.ReservationId
ORDER BY RoomNumber ASC;

-- '201','4','199.99'
-- '202','7','349.98'
-- '203','2','999.95'
-- '203','21','399.98'
-- '204','16','184.99'
-- '205','15','699.96'
-- '206','12','599.96'
-- '206','23','449.97'
-- '207','10','174.99'
-- '208','13','599.96'
-- '208','20','149.99'
-- '301','9','799.96'
-- '301','24','599.97'
-- '302','6','924.95'
-- '302','25','699.96'
-- '303','18','199.99'
-- '304','14','184.99'
-- '305','3','349.98'
-- '305','19','349.98'
-- '306',NULL,NULL
-- '307','5','524.97'
-- '308','1','299.98'
-- '401','11','1199.97'
-- '401','17','1259.97'
-- '401','22','1199.97'
-- '402',NULL,NULL		

-- Returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.

SELECT
ro.RoomNumber
FROM Reservation res
INNER JOIN RoomReservation rr
ON res.ReservationId = rr.ReservationId
INNER JOIN Room ro
ON rr.RoomId = ro.RoomId
WHERE (res.NumberOfAdults + res.NumberOfChildren) > 2
AND res.StartDate > '2023-03-31'
AND res.EndDate < '2023-05-01';

-- RETURNS NOTHING


-- Returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.


SELECT 
g.FirstName,
g.LastName,
COUNT(gr.GuestId) TotalReservations
FROM Reservation r
INNER JOIN GuestReservation gr
ON r.ReservationId = gr.ReservationId
LEFT JOIN Guest g
ON gr.GuestId = g.GuestId
GROUP BY g.GuestId
ORDER BY TotalReservations DESC, g.LastName;

-- Mark	Simmer	4
-- Bettyann	Seery	3
-- Duane	Cullison	2
-- Walter	Holaway	2
-- Aurore	Lipton	2
-- Dillian	Rhoades	2
-- Maritza	Tilton	2
-- Joleen	Tison	2
-- Wilfred	Vise	2
-- Karie	Yang	2
-- Zachery	Luechtefeld	1

-- Displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)

SELECT 
g.FirstName,
g.LastName,
a.*,
p.PhoneNumber
FROM Guest g
INNER jOIN Address a
ON g.AddressId = a.AddressId
INNER JOIN Phone p
ON g.PhoneId = p.PhoneId
WHERE PhoneNumber = '7408045073';
















