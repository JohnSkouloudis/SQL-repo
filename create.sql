CREATE TABLE AGENCY (
agency_id NUMBER(5) NOT NULL,
agency_name VARCHAR(30) NOT NULL,
agency_timezone VARCHAR(30) NOT NULL,
agency_url VARCHAR(20) NOT NULL,
agency_phone NUMBER(10) NOT NULL,
agency_lang VARCHAR(20) NOT NULL,
CONSTRAINT pk_agency PRIMARY KEY(agency_id)
);
CREATE TABLE  ROUTES (
route_id VARCHAR(20) NOT NULL,
route_url VARCHAR(20),
short_name VARCHAR(30) NOT NULL,
long_name VARCHAR(50),
route_desc VARCHAR(20),
route_type NUMBER(2),
route_color VARCHAR(10),
route_text_color VARCHAR(20),
agency_id NUMBER(5), 
CONSTRAINT pk_Routes PRIMARY KEY(route_id),
CONSTRAINT fk_Routes_ag_id FOREIGN KEY(agency_id) REFERENCES AGENCY(agency_id)
);

CREATE TABLE CALENDAR(
service_id VARCHAR(50),
Monday NUMBER(1),
Tuesday NUMBER(1),
Wednesday NUMBER(1),
Thursday NUMBER(1),
Friday NUMBER(1),
Saturday NUMBER(1),
Sunday NUMBER(1),
start_date DATE,
end_date DATE,
CONSTRAINT pk_calendar PRIMARY KEY(service_id)
);

CREATE TABLE TRIPS(
route_id VARCHAR(20),
service_id VARCHAR(50),
trip_id VARCHAR(50) NOT NULL,
trip_headsign VARCHAR(60) NOT NULL,
trip_short_name VARCHAR(20),
direction_id NUMBER(1),
block_id NUMBER(10),
CONSTRAINT pk_Trip PRIMARY KEY(trip_id),
CONSTRAINT fk_Trips_Routes FOREIGN KEY(route_id) REFERENCES ROUTES(route_id),
CONSTRAINT fk_Trips_Calendar FOREIGN KEY(service_id) REFERENCES CALENDAR(service_id)
);

CREATE TABLE STOPS (
stop_id NUMBER(10),
stop_code NUMBER(10),
stop_name VARCHAR(40),
stop_desc VARCHAR(50),
stop_lat VARCHAR(30),
stop_lon VARCHAR(30),
location_type NUMBER(1),
CONSTRAINT pk_Stops PRIMARY KEY(stop_id)
);

CREATE TABLE STOP_TIMES (
trip_id VARCHAR(50),
stop_id NUMBER(10),
arrival_time DATE ,
departure_time DATE,
stop_sequence NUMBER(1),
pickup_type NUMBER(1),
drop_off_type NUMBER(1),
CONSTRAINT pk_Stop_times PRIMARY KEY(trip_id,stop_id),
CONSTRAINT fk_Stop_times_Trips FOREIGN KEY(trip_id) REFERENCES TRIPS(trip_id),
CONSTRAINT fk_StOP_times_Stops FOREIGN KEY(stop_id) REFERENCES STOPS(stop_id)
);

