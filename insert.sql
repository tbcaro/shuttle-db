-- Drop Table Section----------------------------------------------
/*	Drop Table Service CASCADE;
Drop Table public.User CASCADE;
Drop Table Driver CASCADE;
Drop TABLE Shuttle CASCADE;
Drop Table Stop CASCADE;
Drop Table Route CASCADE;
Drop Table Route_Stop CASCADE;
Drop TABLE Shuttle_Activity CASCADE;
Drop TABLE public.Assignment CASCADE;
Drop TABLE Assignment_Stop CASCADE; */
-- Create Table Section--------------------------------------------
-- Insert Table Section--------------------------------------------

Insert into Service
	( ServiceCode , PublicID , Address , StopToleranceRadius , DefaultInitialLocationAddress , IsActive )
	Values
	('DTHHMOON','Double Tree Moon Twp.','8402 University Blvd, Moon, PA 15108','20.6','8402 University Blvd, Moon, PA 15108','Y'),
	('LQInnPittAir','La Quinta Inn Pittsburgh Airport','8507 University Blvd, Moon, PA 15108',15.12,'8507 University Blvd, Moon, PA 15108','Y'),
	('SheratonPittAir','Sheraton Pittsburgh Airport','1160 Thorn Run Rd, Coraopolis, PA 15108',30.7,'1160 Thorn Run Rd, Coraopolis, PA 15108','Y'),
	('RenPitt','Renaissance Pittsburgh Hotel','107 6th St, Pittsburgh, PA 15222',12.2,'107 6th St, Pittsburgh, PA 15222','N');

Insert into public.User
	( ServiceID , FName , LName , UserName , "Password" , Phone , UserType )
	Values
	(1,'Zachary','Kruise','zkruise','bigboy','124-987-3338','Driver'),
	(1,'Bachary','Bruise','bkruise','bigboy1','224-987-3338','Driver'),
	(2,'Cachary','Cruise','ckruise','','324-987-3338','Dispatcher'),
	(2,'Dachary','Druise','dkruise','bigboy2','424-987-3338','Driver'),
	(1,'Eachary','Eruise','ekruise','bigboy3','524-987-3338','Dispatcher'),
	(1,'Fachary','Fruise','fkruise','bigboy4','624-987-3338','Driver'),
	(2,'Gachary','Gruise','gkruise','','724-987-3338','Driver'),
	(2,'Hachary','Hruise','hkruise','bigboy5','824-987-3338','Driver');

Insert into Driver
	( ServiceID , "ID" , DriverLicenseExpiration , IsActive , IsArchived )
	Values
	(1,1,'11-26-2020','Y','N'),
	(1,2,'1-27-2020','Y','N'),
	(2,4,'1-27-2020','Y','N'),
	(1,6,'9-28-2018','Y','N'),
	(2,7,'9-28-2018','Y','N'),
	(2,8,'9-28-2018','Y','N');

Insert into Shuttle
	( ServiceID, VIN, "Name", Make, Model, "Year", IsActive, IsArchived)
	Values
	(1,'12345678911234567','BigBoyBus','Chevrolet','Express','2017','Y','N'),
	(1,'22345678911234568','BigBoyBus2','Chevrolet','Express','2017','Y','N'),
	(2,'32345678911234567','Bus1','GMC','Savana','2011','Y','N'),
	(2,'42345678911234567','Bus2','GMC','Savana','2015','Y','N');

Insert into Stop
	( ServiceID , "Name" , Address , Latitude , Longitude , IsArchived )
	Values
	('1','Robert Morris University','6001 University Blvd, Moon, PA 15108', 40.519426, -80.216499,'N'),
	('1','David L Lawerence Convention Center','1000 Fort Duquesne Blvd, Pittsburgh, PA 15222',40.444927, -79.995739, 'N'),
	('1','Point State Park','',40.441254, -80.007201,'N'),
	('1','The Art Institute','420 Boulevard of the Allies, Pittsburgh, PA 15219',40.437416, -79.999350,'N'),
	('2', 'Heinz Field','100 Art Rooney Ave, Pittsburgh, PA 15212',40.445217, -80.013759,'N'),
	('2', 'PNC Park','115 Federal St, Pittsburgh, PA 15212', 40.447758, -80.006909, 'N'),
	('2', 'Cedar Avenue','', 40.453391, -80.001700, 'N'),
	('1', 'Double Tree Moon','8402 University Blvd, Moon, PA 15108',NULL,NULL,'N'),
	('1', 'Pitt Airport','1000 Airport Blvd, Pittsburgh, PA 15231',40.495799, -80.255695,'N'),
	('2', 'La Quinta Inn Pittsburgh Airport', '8507 University Blvd, Moon, PA 15108', NULL, NULL,'N'),
	('2', 'Pitt Airport','1000 Airport Blvd, Pittsburgh, PA 15231',40.495799, -80.255695,'N');

Insert into Route
	( ServiceID , "Name" , IsArchived , DefaultStartTime )
	Values
	('1','DLL Con Center','N','4:30'),
	('1','Airport','N','4:30'),
	('2','North Shore','N','10:30'),

Insert into Route_Stop
	( RouteID , StopID ,"Index", DefaultArriveOffset , DefaultDepartOffset)
	Values
	('1','8','1','0:00','0:30'),
	('1','2','2','0:23', '0:15'),
	('1','3','3','0:05', '0:02'),
	('1','4','4','0:05', '0:02'),
	('2','8','1','0:29', '0:15'),
	('2','9','2','0:29', '0:15'),
	('2','8','3','0:29', '0:15'),
	('2','8','4','0:29', '0:15'),
	('2','9','5','0:29', '0:15'),
	('2','8','6','0:29', '0:15'),
	('3','10','1','0:14', '0:30'),
	('3','11','2','0:14', '0:30'),
	('3','10','3','0:14', '0:30');

Insert into Shuttle_Activity
  	("ID", Latitude, Longitude, Status)
		Values
		('1',40.503018, -80.222190,'D')
		('2',40.496026, -80.255678,'S')
		('4',40.512778, -80.276555,'D')

Insert into public.Assignment
	(ServiceID, DriverID, ShuttleID, RouteID, "TimeStamp", RouteName)
	Values
	(1,1,1,1,'5:30','Convention Center'),
	(1,2,2,2,'6:45','Airport'),
	(1,2,2,1,'7:30','Convention Center');

Insert into Assignment_Stop
	(EstimatedTimeofArrival, EstimatedTimeofDeparture, TimeofArrival, TimeofDeparture, StopID, Address, Longitude, Latitude)
	Values
	('4:30','4:35','','','1','','',''),
	('4:45','4:55','','','','8508 University Blvd, Moon, PA 15108'),
	('5:05','5:20','','','','',40.495799, -80.255695),
	('5:30','5:35','','','1','','','');
-- Select Statements Section --------------------------------------
Select * from Service;
Select * from public.User;
Select * from Driver;
Select * from Shuttle;
Select * from Stop;
Select * from Route;
Select * from Route_Stop;
Select * from Shuttle_Activity;
Select * from public.Assignment;
Select * from Assignment_Stop;
