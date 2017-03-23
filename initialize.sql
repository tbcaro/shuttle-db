-- Database: postgres
-- drop database mrshuttle
CREATE DATABASE mrshuttle
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE TABLE Service
	(
		ServiceID 									  serial Unique,
		ServiceCode 						character varying(25) NOT NULL Unique,
		PublicID 						character varying(50) NOT NULL Unique,
		Address 							character varying(50) NOT NULL,
		-- StopToleranceRadius 					 double precision NOT NULL,
		-- DefaultInitialLocationAddress 			 character varying(50),
		IsActive         		 boolean,
	 PRIMARY KEY ( ServiceID )
	);

CREATE TYPE UserType AS ENUM ('Driver', 'Dispatcher');

CREATE TABLE public.User
	(
		 "ID"              Serial Unique,
		ServiceID          Int NOT NULL,
		FName   character varying(50) NOT NULL,
		LName   character varying(50) NOT NULL,
		UserName  character varying(25) NOT NULL,
		"Password"  character varying(25),
		-- Phone   character varying(12),
		UserType  UserType NOT NULL,
	 PRIMARY KEY ( UserName , ServiceID ),
	 FOREIGN KEY ( ServiceID ) References public.Service ( ServiceID )
	);

CREATE TABLE Driver
	(
		ServiceID          INT NOT NULL,
		"ID"               INT NOT NULL,
		-- DriverLicenseExpiration   TimeStamp NOT NULL,
		IsActive  boolean,
		IsArchived boolean,
	 Unique( "ID" , ServiceID ),
	 Primary KEY ( ServiceID , "ID" ),
	 FOREIGN KEY ( "ID" ) References public.User ( "ID" ),
	 FOREIGN KEY ( ServiceID ) References public.Service ( ServiceID )
	);

CREATE TABLE Shuttle
	(
		ServiceID          Int NOT NULL,
		"ID"            serial NOT NULL Unique,
		-- VIN         character varying(17),
		"Name"        character varying(25),
		-- Make        character varying(25),
		-- Model        character varying(25),
		-- "Year"                 Int,
		IsActive  boolean,
		IsArchived boolean,
        Unique( "ID" , ServiceID ),
	 Primary KEY ( "ID" , ServiceID ),
	 FOREIGN KEY ( ServiceID ) References public.Service ( ServiceID )
	);

CREATE TABLE Stop
	(
		 ServiceID          		Int NOT NULL,
		 "ID" 						Serial NOT NULL Unique,
		 "Name" 					character varying(50),
		 Address  				 	character varying(50),
		 Latitude	 				decimal(16,13),
		 Longitude 					decimal(16,13),
		IsArchived boolean,
		Unique( "ID" , ServiceID ),
		Primary KEY ( "ID" , ServiceID ),
		Foreign Key ( ServiceID ) References public.Service ( ServiceID )
	);

CREATE TABLE Route
	(
	 ServiceID          		 Int NOT NULL,
	 "ID" 				 			  serial NOT NULL Unique,
	 "Name" 		 				 character varying(25),
		IsArchived boolean,
	 --DefaultStartTime 						 TIME,
	Primary Key ( ServiceID , "ID" ),
	Foreign Key ( ServiceID ) References public.Service ( ServiceID )
	);

CREATE TABLE Route_Stop
	(
		 RouteID 										 Int NOT NULL,
		 StopID 										 Int NOT NULL,
		 "Index" 									     Int NOT NULL,
		-- DefaultArriveOffset 		     Time NOT NULL,
		-- DefaultDepartOffset 			 Time NOT NULL,
		Primary Key ( RouteID , StopID , "Index" ),
		Foreign Key ( RouteID ) References public.Route ( "ID" ),
		Foreign Key ( StopID) References public.Stop ( "ID" )
	);

-- TODO : Create enum for Status
CREATE TABLE Shuttle_Activity
	(
		 ShuttleID				   INT NOT NULL Unique,
     AssignmentID    INT,
		 Latitude         Decimal(16,13) NOT NULL,
		 Longitude 		  Decimal(16,13) NOT NULL,
		 Status 			character varying (1),
		Primary Key ( ShuttleID ),
		Foreign Key ( ShuttleID ) References public.Shuttle ( "ID" ),
    Foreign Key ( AssignmentID ) References public.Assignment ( AssignmentID )
	);

-- reference assignment and make a current index
CREATE TABLE public.Assignment
	(
        AssignmentID 			 Serial NOT NULL,
        ServiceID          Int NOT NULL,
        DriverID           Int NOT NULL,
        ShuttleID          Int NOT NULL,
        RouteID 		           Int,
        "TimeStamp"           TimeStamp,
        RouteName     character varying(25),
        Primary Key ( AssignmentID ),
        Foreign Key ( DriverID ) References public.User ( "ID" ),
        Foreign Key ( ShuttleID ) References public.Shuttle ( "ID" ),
        Foreign Key ( RouteID ) References public.Route ( "ID" ),
        Foreign Key ( ServiceID ) References public.Service ( ServiceID )
    );

-- TODO : Make legitimate PK
CREATE TABLE Assignment_Stop
	(
	 EstimatedTimeofArrival 	TimeStamp,
	 EstimatedTimeofDeparture TimeStamp,
	 TimeofArrival 						TimeStamp,
	 TimeofDeparture 					TimeStamp,
	 StopID 								  Int,
	 Address 				character varying(25),
	 Longitude 						Decimal(16,13),
	 Latitude 						Decimal(16,13),
		Primary Key ( EstimatedTimeofArrival ),
		Foreign Key ( StopID ) References public.Stop ( "ID" )
	);
