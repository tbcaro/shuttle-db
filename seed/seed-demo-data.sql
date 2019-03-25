-- Drop Table Section----------------------------------------------
/*
Drop Table Service CASCADE;
Drop Table public.User CASCADE;
Drop Table Driver CASCADE;
Drop TABLE Shuttle CASCADE;
Drop Table Stop CASCADE;
Drop Table Route CASCADE;
Drop Table Route_Stop CASCADE;
Drop TABLE Shuttle_Activity CASCADE;
Drop TABLE public.Assignment CASCADE;
Drop TABLE Assignment_Stop CASCADE;
Drop TABLE simulation_cycle CASCADE;
Drop type UserType;
Drop Type shuttle_status;
Drop Type Assignment_Status;
*/
-- Create Table Section-
-- Delete Data Section-
/*
DELETE FROM Shuttle_Activity;
DELETE FROM Assignment_Stop;
DELETE FROM Route_Stop;
DELETE FROM public.Assignment;
DELETE FROM Driver;
DELETE FROM Shuttle;
DELETE FROM Stop;
DELETE FROM Route;
DELETE FROM public.User;
DELETE FROM Service;
*/
-- Insert Table Section--------------------------------------------
INSERT INTO service (servicecode, servicename, publicid, address, isactive)
VALUES ('exampleshuttleco','Example Shuttle Company','exampleshuttle', '3103 Mackenzi Ln Apt 4, York, PA 17408', true)

INSERT INTO "public".user (serviceid, fname, lname, username, "password", usertype)
VALUES  (1, 'Test', 'Dispatcher', 'testdispatcher', 'a', 'DISPATCHER'),
        (1, 'Test', 'Driver', 'testdriver', 'a', 'DRIVER');

INSERT INTO driver (serviceid, "id", isactive, isarchived)
VALUES (1, 2, true, false);

INSERT INTO shuttle (serviceid, "name", iconcolor, isactive, isarchived)
VALUES  (1,'Shuttle 1A', '#00a1ff', true, false),
	    (1,'Shuttle 1B', '#ff00ee', true, false),
	    (1,'Shuttle 2A', '#ff0000', true, false),
	    (1,'Shuttle 3A', '#08ff00', true, false);