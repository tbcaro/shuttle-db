CREATE TABLE Service
(
	ServiceID 									  serial Unique,
	ServiceCode 						character varying(50) NOT NULL Unique,
	ServiceName					character varying(50) NOT NULL,
	PublicID 						character varying(50) NOT NULL Unique,
	Address 							character varying(50) NOT NULL,
	-- StopToleranceRadius 					 double precision NOT NULL,
	-- DefaultInitialLocationAddress 			 character varying(50),
	IsActive         		 boolean NOT NULL,
	PRIMARY KEY ( ServiceID )
);

CREATE TYPE UserType AS ENUM ('DRIVER', 'DISPATCHER');

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
	"ID"               INT NOT NULL UNIQUE,
	-- DriverLicenseExpiration   TimeStamp NOT NULL,
	IsActive  boolean NOT NULL,
	IsArchived boolean NOT NULL,
	Primary KEY ( ServiceID , "ID" ),
	FOREIGN KEY ( "ID" ) References public.User ( "ID" ),
	FOREIGN KEY ( ServiceID ) References public.Service ( ServiceID )
);

CREATE TABLE Shuttle
(
	ServiceID          Int NOT NULL,
	"ID"            serial NOT NULL Unique,
	-- VIN         character varying(17),
	"Name"        character varying(50),
	IconColor     character varying(7),
	-- Make        character varying(25),
	-- Model        character varying(25),
	-- "Year"                 Int,
	IsActive  boolean NOT NULL,
	IsArchived boolean NOT NULL,
	Unique( "ID" , ServiceID ),
	Primary KEY ( "ID" , ServiceID ),
	FOREIGN KEY ( ServiceID ) References public.Service ( ServiceID )
);

CREATE TABLE Stop
(
	ServiceID          		Int NOT NULL,
	"ID" 									Serial NOT NULL Unique,
	"Name" 								character varying(50),
	Address  				 			character varying(50),
	Latitude	 							decimal(16,13) NOT NULL,
	Longitude 							decimal(16,13) NOT NULL,
	IsArchived boolean,
	Unique( "ID" , ServiceID ),
	Primary KEY ( "ID" , ServiceID ),
	Foreign Key ( ServiceID ) References public.Service ( ServiceID )
);

CREATE TABLE Route
(
	ServiceID          		 Int NOT NULL,
	"ID" 				 			     serial NOT NULL Unique,
	"Name" 		 				     character varying(50),
	IsArchived boolean  NOT NULL,
	-- DefaultStartTime 						 TIME,
	Primary Key ( ServiceID , "ID" ),
	Foreign Key ( ServiceID ) References public.Service ( ServiceID )
);

CREATE TABLE Route_Stop
(
	RouteID 										 Int NOT NULL,
	StopID 										 Int NOT NULL,
	"Index" 									   Int NOT NULL,
	-- DefaultArriveOffset 		   Time NOT NULL,
	-- DefaultDepartOffset 			 Time NOT NULL,
	Primary Key ( RouteID , StopID , "Index" ),
	Foreign Key ( RouteID ) References public.Route ( "ID" ),
	Foreign Key ( StopID) References public.Stop ( "ID" )
);

-- reference assignment and make a current index
--starttime split between date and time
CREATE TYPE Assignment_Status AS ENUM ('SCHEDULED', 'UNFINISHED', 'IN_PROGRESS', 'COMPLETED');

CREATE TABLE public.Assignment
(
	AssignmentID 			 Serial NOT NULL, -- done
	ServiceID          Int NOT NULL,
	DriverID           Int NOT NULL,
	ShuttleID          Int NOT NULL,
	RouteID 		       Int,
	StartTime          Time,
	StartDate					 Date,
	RouteName     		 character varying(50),
	Status						Assignment_Status NOT NULL,
	IsArchived boolean NOT NULL,
	Primary Key ( AssignmentID ), -- done
	Foreign Key ( DriverID ) References public.Driver ( "ID" ),
	Foreign Key ( ShuttleID ) References public.Shuttle ( "ID" ),
	Foreign Key ( RouteID ) References public.Route ( "ID" ),
	Foreign Key ( ServiceID ) References public.Service ( ServiceID )
);

CREATE TABLE Assignment_Stop
(
	Assignment_Stop_ID				Serial Not Null,
	AssignmentID									Int,
	"Index"											Int,
	EstimatedTimeofArrival				TimeStamp,
	EstimatedTimeofDeparture			TimeStamp,
	TimeofArrival						TimeStamp,
	TimeofDeparture 					TimeStamp,
	StopID 								  Int,
	Address 				character varying(50),
	Longitude						Decimal(16,13),
	Latitude 						Decimal(16,13),
	Primary Key (Assignment_Stop_ID),
	Foreign Key ( StopID ) References public.Stop ( "ID" ),
	Foreign Key ( AssignmentID ) References public.Assignment (AssignmentID)
);

CREATE TYPE Shuttle_Status AS ENUM ('ACTIVE', 'DRIVING', 'AT_STOP');

CREATE TABLE Shuttle_Activity
(
	ShuttleID		  	INT NOT NULL Unique,
	DriverID					INT,
	AssignmentID     INT,
	"Index"					INT,
	Latitude         Decimal(16,13) NOT NULL,
	Longitude 		    Decimal(16,13) NOT NULL,
	Heading					Decimal(16,13) NOT NULL,
	Status 			Shuttle_Status NOT NULL,
	Primary Key ( ShuttleID ),
	-- 	Foreign Key (Assignment_Stop_ID) References public.Assignment_Stop (Assignment_Stop_ID),
	-- Foreign Key ("Index") References public.Assignment_Stop ("Index")
	Foreign Key ( DriverID ) References public.Driver ( "ID" ),
	Foreign Key ( ShuttleID ) References public.Shuttle ( "ID" ),
	Foreign Key ( AssignmentID ) References public.Assignment ( AssignmentID )
);