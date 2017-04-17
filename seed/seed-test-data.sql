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
Insert into Service
	( ServiceCode , ServiceName, PublicID , Address , IsActive )
	Values
	('DTHHMOON','Double Tree Moon Twp.', 'Double Tree Moon Twp.','8402 University Blvd, Moon, PA 15108',TRUE),
	('LQInnPittAir','La Quinta Inn Pittsburgh Airport','La Quinta Inn Pittsburgh Airport','8507 University Blvd, Moon, PA 15108', True),
	('clarionshuttle','Clarion Shuttle Company','clarionshuttle', '840 Wood Street, Clarion, PA 16214', true);

Insert into public.User
	( ServiceID , FName , LName , UserName , "Password" , UserType )
	Values
	 (1, 'Jennifer', 'Olson', 'jolsonb', 'OsrHTfhkiFWN', 'DISPATCHER'),
	 (1, 'Katherine', 'Lopez', 'klopezg', 'JXVLvlBkMoC', 'DISPATCHER'),
	 (1, 'Kevin', 'Palmer', 'kpalmerk', 'bk03RkXWefc', 'DISPATCHER'),
	 (1, 'Amy', 'Barnes', 'abarnes0', '2LseBl0vPJ5o', 'DRIVER'),
	 (1, 'Nancy', 'Alvarez', 'nalvareza', 'MTyDwGmudyWc', 'DRIVER'),
	 (2, 'Matthew', 'Gutierrez', 'mgutierrez5', '5vVIJCsearh', 'DISPATCHER'),
	 (2, 'Evelyn', 'Armstrong', 'earmstronge', 'hexi8bCZP6wC', 'DISPATCHER'),
	 (2, 'Pamela', 'Johnson', 'pjohnsonm', 'hlQY4sdXcbZJ', 'DISPATCHER'),
	 (2, 'Wanda', 'Griffin', 'wgriffino', '8DhEhQ', 'DISPATCHER'),
	 (2, 'Dennis', 'Anderson', 'danderson2', 'nDOhno1e6r', 'DRIVER'),
	 (2, 'Wanda', 'Graham', 'wgraham4', 'b4pdWPNoMtBH', 'DRIVER'),
	 (2, 'Sarah', 'Wood', 'swood6', 'HvDZROSZZrng', 'DRIVER'),
	 (2, 'Christopher', 'Spencer', 'cspencer8', 'oCb182kmNmf', 'DRIVER'),
	 (2, 'Shirley', 'Carpenter', 'scarpenteri', 'DofRXlUWDVo', 'DRIVER'),
	 (2, 'Barbara', 'Roberts', 'brobertsj', 'x6DMIvsDbJ5r', 'DRIVER'),
	 (2, 'Diana', 'Morgan', 'dmorganl', 'jaCbH9O4', 'DRIVER'),
	 (2, 'Kevin', 'Rivera', 'kriveran', 'Aqtu3v9YDy', 'DRIVER'),
	 (3, 'Ronald', 'Wallace', 'rwallace9', 'zBD64wDjPQEc', 'DISPATCHER'),
	 (3, 'Mildred', 'Murphy', 'mmurphyc', 'J4lviq', 'DISPATCHER'),
	 (3, 'Barbara', 'Ross', 'brossd', 'yWxcMY', 'DISPATCHER'),
	 (3, 'Anne', 'Martin', 'amartinf', 'MtjOwHpyT', 'DISPATCHER'),
	 (3,'Travis','Caro','tcaro','password1','DISPATCHER'),
	 (3, 'Melissa', 'Torres', 'mtorres1', 'm8JdFqrtNR0', 'DRIVER'),
	 (3, 'Adam', 'Matthews', 'amatthews3', 'dyKntavpwfW', 'DRIVER'),
	 (3, 'Ralph', 'Gardner', 'rgardnerh', '6AsjdEliH1LD', 'DRIVER'),
	 (3, 'Amy', 'Greene', 'agreene7', 'jgLl3jszgE', 'DRIVER'),
	 (3,'Travis','Caro','tcaro_driver','password1','DRIVER');

Insert into Driver
	( ServiceID , "ID" , IsActive , IsArchived )
	Values
	(1,4,TRUE,FALSE),
	(1,5,TRUE,FALSE),
	(2,10,TRUE,FALSE),
	(2,11,TRUE,FALSE),
	(2,12,TRUE,FALSE),
	(2,13,TRUE,FALSE),
	(2,14,TRUE,FALSE),
	(2,15,TRUE,FALSE),
	(2,16,TRUE,FALSE),
	(2,17,TRUE,FALSE),
	(3,23,TRUE,FALSE),
	(3,24,TRUE,FALSE),
	(3,25,TRUE,FALSE),
	(3,26,TRUE,FALSE),
	(3,27,TRUE,FALSE);

Insert into Shuttle
	( ServiceID, "Name",IconColor, IsActive, IsArchived)
	Values
	(1,'Shuttle','#BADA55',True,False),
	(1,'Shuttle2','#6033ff',True,False),
	(2,'Bus1','#DAD151',True,False),
	(2,'Bus2','#FA3489',True,False),
	(3,'Truck1','#FFD151',True,False),
	(3,'Truck2','#003489',True,False);

Insert into Stop
	( ServiceID , "Name" , Address , Latitude , Longitude , IsArchived )
	Values
	('1','Robert Morris University','6001 University Blvd, Moon, PA 15108', 40.519426, -80.216499,False),
	('1','David L Lawerence Convention Center','1000 Fort Duquesne Blvd, Pittsburgh, PA 15222',40.444927, -79.995739, False),
	('1','Point State Park','',40.441254, -80.007201,False),
	('1','The Art Institute','420 Boulevard of the Allies, Pittsburgh, PA 15219',40.437416, -79.999350,False),
	('2', 'Heinz Field','100 Art Rooney Ave, Pittsburgh, PA 15212',40.445217, -80.013759,False),
	('2', 'PNC Park','115 Federal St, Pittsburgh, PA 15212', 40.447758, -80.006909, False),
	('2', 'Cedar Avenue','', 40.453391, -80.001700, False),
	('1', 'Double Tree Moon','8402 University Blvd, Moon, PA 15108',40.509330, -80.224024,False),
	('1', 'Pitt Airport','1000 Airport Blvd, Pittsburgh, PA 15231',40.495799, -80.255695,False),
	('2', 'La Quinta Inn Pittsburgh Airport', '8507 University Blvd, Moon, PA 15108', 40.508156, -80.222922,False),
	('2', 'Pitt Airport','1000 Airport Blvd, Pittsburgh, PA 15231',40.495799, -80.255695,False);

Insert into Route
	( ServiceID , "Name" , IsArchived)
	Values
	('1','DLL Con Center',False),
	('1','Airport',False),
	('2','North Shore',False);

Insert into Route_Stop
	( RouteID , StopID ,"Index")
	Values
	('1','8','1'),
	('1','2','2'),
	('1','3','3'),
	('1','4','4'),
	('2','8','1'),
	('2','9','2'),
	('2','8','3'),
	('2','8','4'),
	('2','9','5'),
	('2','8','6'),
	('3','10','1'),
	('3','11','2'),
	('3','10','3');

-- Insert into Shuttle_Activity
-- 	(ShuttleID, Latitude, Longitude, Status, heading)
-- 	Values
-- 	  ('1',40.503018, -80.222190,'ACTIVE', 0),
-- 	  ('2',40.496026, -80.255678,'DRIVING', 90),
-- 	  ('4',40.512778, -80.276555,'AT_STOP', 180);

Insert into public.Assignment
	(ServiceID, DriverID, ShuttleID, RouteID, StartTime, RouteName, Status, isarchived)
	Values
	  (1,1,1,1,'2017-01-28 05:30:00','Convention Center','SCHEDULED',false),
	  (1,2,2,2,'2017-01-28 05:30:00','Airport','SCHEDULED',false),
	  (1,2,2,1,'2017-01-28 07:30:00','Convention Center','SCHEDULED',false),
		(2,10,3,NULL,'2017-01-28 07:30:00','2017-01-28 07:45:00','SCHEDULED',false);

Insert into Assignment_Stop
	(AssignementID, EstimatedTimeofArrival, EstimatedTimeofDeparture, TimeofArrival, TimeofDeparture, StopID, Address, Longitude, Latitude)
	Values
	(4,'2017-01-28 4:30','2017-01-28 4:35',NULL,NULL,'1','',NULL,NULL),
	(4,'2017-01-28 4:45','2017-01-28 4:55',NULL,NULL,NULL,'8508 Univ Blvd, Moon, PA 15108',NULL,NULL),
	(4,'2017-01-28 4:45','2017-01-28 4:55',NULL,NULL,NULL,'7500 University Blvd, Moon, PA 15108,',NULL,NULL),
	(4,'2017-01-28 5:05','2017-01-28 5:20',NULL,NULL,NULL,'',40.495799, -80.255695),
	(4,'2017-01-28 5:30','2017-01-28 5:35',NULL,NULL,'1','',NULL,NULL);
