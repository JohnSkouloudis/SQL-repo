insert into AGENCY values(1,'OASA','Europe/Athens','http://www.oasa.gr',3021082009,'el');

//1η γραμμη
insert into ROUTES values('T3-20','http://www.T3-20.gr','T3','ΝΕΟ ΦΑΛΗΡΟ-ΑΣΚΛΗΠΕΙΟ ΒΟΥΛΑ',NULL,2,'3FFF19','000000',1);

//2η γραμμη
insert into ROUTES values('M2-20','http://www.M2-20.gr','M2','ΑΝΘΟΥΠΟΛΗ-ΣΤ.ΕΛΛΗΝΙΚΟ',NULL,1,'D81A13','000000',1);

alter session set NLS_DATE_FORMAT='DD/MM/YYYY HH24:MI:SS';

insert into CALENDAR values('CALEND-021-Καθημερινή-06',1,1,1,1,1,0,0,'01-12-2016','30-06-2017');
insert into CALENDAR values('CALEND-021-Κυριακή-05',0,0,0,0,0,0,1,'04-12-2016','25-06-2017');
insert into CALENDAR values('CALEND-021-Σάββατο-06',0,0,0,0,0,1,0,'03-12-2016','01-07-2017');


//δρομολογια για 1η γραμμη
insert into TRIPS values('T3-20','CALEND-021-Καθημερινή-06','9803638-CALEND-021-Καθημερινή-06','ΝΕΟ ΦΑΛΗΡΟ - AΣΚΛΗΠΕΙΟ ΒΟΥΛΑ','D0BS1M',0,2184458);
insert into TRIPS values('T3-20','CALEND-021-Κυριακή-05','9803639-CALEND-021-Κυριακή-05','ΝΕΟ ΦΑΛΗΡΟ - AΣΚΛΗΠΕΙΟ ΒΟΥΛΑ','E01HL8',0,2184460);
insert into TRIPS values('T3-20','CALEND-021-Σάββατο-06','9803640-CALEND-021-Σάββατο-06','ΝΕΟ ΦΑΛΗΡΟ - AΣΚΛΗΠΕΙΟ ΒΟΥΛΑ','F4GX1P',0,2184459);

//δρομολογια για 2η γραμμη
insert into TRIPS values('M2-20','CALEND-021-Καθημερινή-06','9076959-CALEND-021-Καθημερινή-06','ΑΝΘΟΥΠΟΛΗ - ΣΤ.ΕΛΛΗΝΙΚΟ','A6U810',0,2036919);
insert into TRIPS values('M2-20','CALEND-021-Κυριακή-05','9076960-CALEND-021-Κυριακή-05','ΑΝΘΟΥΠΟΛΗ - ΣΤ.ΕΛΛΗΝΙΚΟ','B76150',0,2036921);
insert into TRIPS values('M2-20','CALEND-021-Σάββατο-06','9076961-CALEND-021-Σάββατο-06','ΑΝΘΟΥΠΟΛΗ - ΣΤ.ΕΛΛΗΝΙΚΟ','C9D1J5',0,2036923);

//Στασεις απο τις οποίες  περνανε τα δρομολόγια

//T3-20 καθημερινη και Σαββατο Κυριακη
insert into STOPS values(010001,010001,'ΣΤΡΟΦΗ','Επί της ΕΛ.ΒΕΝΙΖΕΛΟΥ','37.9986082641367','23.6649846246733',0);

//T3-20 καθημερινη και Σαββατο
insert into STOPS values(010002,010002,'ΚΟΛΩΝΕΣ','Επί της ΛΕΩΦ.ΕΛ.ΒΕΝΙΖΕΛΟΥ','37.996719436997','23.6631823242898',0);
insert into STOPS values(010003,010003,'ΑΓ.ΒΑΡΒΑΡΑ','Επί της ΛΕΩΦ.ΕΛ.ΒΕΝΙΖΕΛΟΥ','37.9946947354979','23.6611529618238',0);

//T3-20 καθημερινη
insert into STOPS values(010004,010004,'ΔΗΜΑΡΧΕΙΟ','Επί της ΗΠΕΙΡΟΥ','37.9928326565131','23.6592710105915',0);
insert into STOPS values(010005,010005,'ΚΡΗΤΗΣ','Επί της ΠΑΛΑΙΩΝ ΠΟΛΕΜΙΣΤΩΝ','37.9904261625749','23.6561503633519',0);

//T3-20 Σαββατο
insert into STOPS values(010006,010006,'ΚΟΥΝΤΟΥΡΙΩΤΟΥ','Επί της ΠΑΛΑΙΩΝΠΟΛΕΜΙΣΤΩΝ','37.9880007445562','23.6558200457878',0);
insert into STOPS values(010007,010007,'ΔΗΜΑΡΧΕΙΟ ΑΓ.ΒΑΡΒΑΡΑΣ','Επί της ΛΕΩΦ.ΕΛ.ΒΕΝΙΖΕΛΟΥ','37.9899667799348','23.6593412065609',0);

//T3-20 Κυριακη
insert into STOPS values(010008,010008,'1Η ΑΓ. ΜΑΡΙΝΑΣ','Επί της ΑΓ.ΜΑΡΙΝΑΣ','37.9959735237703','23.6671036000934',0);
insert into STOPS values(010011,010011,'ΘΕΜΙΣΤΟΚΛΕΟΥΣ','Επί της ΠΑΛ.ΠΑΤΡΩΝ ΓΕΡMΑΝΟΥ','37.9884921024649','23.6543373126933',0);
insert into STOPS values(010012,010012,'ΠΑΛ.ΤΕΡΜΑ','Επί της ΠΑΛ.ΠΑΤΡΩΝ ΓΕΡMΑΝΟΥ','37.9904348568098','23.6529729919302',0);
insert into STOPS values(010013,010013,'ΒΕΝΕΤΙΑ','Επί της ΛΕΩΦ.ΜΕΓ.ΑΛΕΞΑΝΔΡΟΥ','37.9876471761163','23.6582017585986',0);

//M2-20 Καθημερινη Σαββατο Κυριακη
insert into STOPS values(061095,061095,'ΠΑΓΚΡΑΤΙ','Επί της ΕΥΤΥΧΙΔΟΥ','37.9674709069047','23.7490317504757',0);

//M2-20 Καθημερινη
insert into STOPS values(061096,061096,'ΠΛ.ΠΑΓΚΡΑΤΙΟΥ','Επί της ΦΡΥΝΗΣ','37.967287019662','23.7473360515995',0);
insert into STOPS values(061098,061098,'ΠΑΓΚΡΑΤΙ','Επί της ΕΥΤΥΧΙΔΟΥ','37.9676697714795','23.7493043085289',0);
insert into STOPS values(061100,061100,'ΠΡΟΦ.ΗΛΙΑΣ','Επί της ΕΥΦΡΑΝΟΡΟΣ','37.9660853728759','23.7459740239062',0);
insert into STOPS values(061101,061101,'ΝΕΟΠΤΟΛΕΜΟΥ','Επί της ΥΜΗΤΤΟΥ','37.9649932462521','23.7452491862296',0);

//Μ2-20 Σαββατο Κυριακη
insert into STOPS values(061102,061102,'ΕΛΤΑ','Επί της ΥΜΗΤΤΟΥ','37.9637174615826','23.7429653738261',0);
insert into STOPS values(061104,061104,'ΑΡΥΒΒΟΥ','Επί της ΦΙΛΟΛΑΟΥ','37.9636009224931','23.7474169867192',0);
insert into STOPS values(061105,061105,'ΥΜΗΤΤΟΥ','Επί της ΑΛΚΕΤΟΥ','37.9655118852336','23.747524285556',0);
insert into STOPS values(061106,061106,'ΠΡΟΦ.ΗΛΙΑΣ','Επί της ΕΥΦΡΑΝΟΡΟΣ','37.9663019017213','23.7460757391434',0);
insert into STOPS values(061108,061108,'ΠΕΤΡΟΥ ΡΑΛΛΗ','Επί της ΠΕΙΡΑΙΩΣ','37.9743533330938','23.7084634260154',0);

alter session set NLS_DATE_FORMAT='DD/MM/YYYY HH24:MI:SS';

//αφιξη  δρομολογίων στις στάσεις τους

////T3-20 καθημερινη
insert into STOP_TIMES values('9803638-CALEND-021-Καθημερινή-06',010001,'01-12-2016 05:30:00','01-12-2016 05:30:00',1,0,0);
insert into STOP_TIMES values('9803638-CALEND-021-Καθημερινή-06',010002,'01-12-2016 05:31:00','01-12-2016 05:31:00',2,0,0);
insert into STOP_TIMES values('9803638-CALEND-021-Καθημερινή-06',010003,'01-12-2016 05:33:00','01-12-2016 05:33:00',3,0,0);
insert into STOP_TIMES values('9803638-CALEND-021-Καθημερινή-06',010004,'01-12-2016 05:35:00','01-12-2016 05:35:00',4,0,0);
insert into STOP_TIMES values('9803638-CALEND-021-Καθημερινή-06',010005,'01-12-2016 05:40:00','01-12-2016 05:40:00',5,0,0);


////T3-20 Σαββατο
insert into STOP_TIMES values('9803640-CALEND-021-Σάββατο-06',010001,'03-12-2016 05:30:00','03-12-2016 05:30:00',1,0,0);
insert into STOP_TIMES values('9803640-CALEND-021-Σάββατο-06',010002,'03-12-2016 05:31:00','03-12-2016 05:31:00',2,0,0);
insert into STOP_TIMES values('9803640-CALEND-021-Σάββατο-06',010003,'03-12-2016 05:33:00','03-12-2016 05:33:00',3,0,0);
insert into STOP_TIMES values('9803640-CALEND-021-Σάββατο-06',010006,'03-12-2016 05:37:00','03-12-2016 05:37:00',4,0,0);
insert into STOP_TIMES values('9803640-CALEND-021-Σάββατο-06',010007,'03-12-2016 05:45:00','03-12-2016 05:45:00',5,0,0);

//Τ3-20 Κυριακη
insert into STOP_TIMES values('9803639-CALEND-021-Κυριακή-05',010001,'04-12-2016 05:30:00','04-12-2016 05:30:00',1,0,0);
insert into STOP_TIMES values('9803639-CALEND-021-Κυριακή-05',010008,'04-12-2016 05:31:00','04-12-2016 05:31:00',2,0,0);
insert into STOP_TIMES values('9803639-CALEND-021-Κυριακή-05',010011,'04-12-2016 05:36:00','04-12-2016 05:36:00',3,0,0);
insert into STOP_TIMES values('9803639-CALEND-021-Κυριακή-05',010012,'04-12-2016 05:40:00','04-12-2016 05:40:00',4,0,0);
insert into STOP_TIMES values('9803639-CALEND-021-Κυριακή-05',010013,'04-12-2016 05:45:00','04-12-2016 05:45:00',5,0,0);

//M2-20 Καθημερινη
insert into STOP_TIMES values('9076959-CALEND-021-Καθημερινή-06',061095,'01-12-2016 06:30:00','01-12-2016 06:30:00',1,0,0);
insert into STOP_TIMES values('9076959-CALEND-021-Καθημερινή-06',061096,'01-12-2016 06:31:00','01-12-2016 06:31:00',2,0,0);
insert into STOP_TIMES values('9076959-CALEND-021-Καθημερινή-06',061098,'01-12-2016 06:35:00','01-12-2016 06:35:00',3,0,0);
insert into STOP_TIMES values('9076959-CALEND-021-Καθημερινή-06',061100,'01-12-2016 06:39:00','01-12-2016 06:39:00',4,0,0);
insert into STOP_TIMES values('9076959-CALEND-021-Καθημερινή-06',061101,'01-12-2016 06:41:00','01-12-2016 06:41:00',5,0,0);

//Μ2-20 Σαββατο
insert into STOP_TIMES values('9076961-CALEND-021-Σάββατο-06',061095,'03-12-2016 06:30:00','03-12-2016 06:30:00',1,0,0);
insert into STOP_TIMES values('9076961-CALEND-021-Σάββατο-06',061102,'03-12-2016 06:31:00','03-12-2016 06:31:00',2,0,0);
insert into STOP_TIMES values('9076961-CALEND-021-Σάββατο-06',061104,'03-12-2016 06:35:00','03-12-2016 06:35:00',3,0,0);
insert into STOP_TIMES values('9076961-CALEND-021-Σάββατο-06',061105,'03-12-2016 06:39:00','03-12-2016 06:39:00',4,0,0);
insert into STOP_TIMES values('9076961-CALEND-021-Σάββατο-06',061106,'03-12-2016 06:41:00','03-12-2016 06:41:00',5,0,0);
insert into STOP_TIMES values('9076961-CALEND-021-Σάββατο-06',061108,'03-12-2016 06:45:00','03-12-2016 06:45:00',6,0,0);

//Μ2-20 Κυριακη
insert into STOP_TIMES values('9076960-CALEND-021-Κυριακή-05',061095,'03-12-2016 06:30:00','03-12-2016 06:30:00',1,0,0);
insert into STOP_TIMES values('9076960-CALEND-021-Κυριακή-05',061102,'03-12-2016 06:31:00','03-12-2016 06:31:00',2,0,0);
insert into STOP_TIMES values('9076960-CALEND-021-Κυριακή-05',061104,'03-12-2016 06:35:00','03-12-2016 06:35:00',3,0,0);
insert into STOP_TIMES values('9076960-CALEND-021-Κυριακή-05',061105,'03-12-2016 06:39:00','03-12-2016 06:39:00',4,0,0);
insert into STOP_TIMES values('9076960-CALEND-021-Κυριακή-05',061106,'03-12-2016 06:41:00','03-12-2016 06:41:00',5,0,0);
insert into STOP_TIMES values('9076960-CALEND-021-Κυριακή-05',061108,'03-12-2016 06:45:00','03-12-2016 06:45:00',6,0,0);


//Ερωτησεις

//Α) Ποιες στάσεις έχει το 1ο δρομολόγιο της 1ης γραμμής που καταχωρήσατε (δώσετε τα αντίστοιχα routeid και trip_id για να τα προσδιορίσετε);

SELECT t.stop_id,t.stop_name
FROM STOP_TIMES st JOIN STOPS t on st.stop_id=t.stop_id
join TRIPS ts on st.trip_id=ts.trip_id
WHERE ts.route_id='T3-20' AND ts.trip_id='9803638-CALEND-021-Καθημερινή-06';

//B) Τι ώρα περνά από την τελευταία στάση το 1ο δρομολόγιο της 1ης γραμμής Κυριακές;

SELECT b.trip_id,b.route_id,TO_CHAR(a.arrival_time, 'HH24:MI:SS') as arrival_time
FROM STOP_TIMES a JOIN TRIPS b on a.trip_id=b.trip_id JOIN TRIPS_STOPCOUNTER c on c.trip_id=a.trip_id
WHERE b.route_id='T3-20' and b.trip_id='9803639-CALEND-021-Κυριακή-05' and a.stop_sequence=5;

//Γ) Πόσες στάσεις έχει κάθε δρομολόγιο κάθε γραμμής;

CREATE VIEW TRIPS_STOPCOUNTER(trip_id,stops) AS
SELECT trip_id, MAX(stop_sequence)
FROM STOP_TIMES 
GROUP BY trip_id;

SELECT a.trip_id,b.route_id,a.stops
FROM TRIPS_STOPCOUNTER a JOIN TRIPS b on a.trip_id=b.trip_id;

//Δ) Ποιο δρομολόγιο, ποιας γραμμής περνά από μια συγκεκριμένη στάση της επιλογής σας τις Κυριακές (επιλέξτε μια συγκεκριμένη τιμή για το stop_name);

CREATE VIEW TRIPS_ROUTES_STOPS_SUNDAY(trip_id,route_id,stop_id) AS
SELECT t.trip_id ,t.route_id,st.stop_id
FROM TRIPS t JOIN CALENDAR c on t.service_id=c.service_id
JOIN STOP_TIMES st on st.trip_id=t.trip_id
WHERE SUNDAY=1;

SELECT trip_id,route_id
FROM TRIPS_ROUTES_STOPS_SUNDAY a JOIN STOPS b on a.stop_id=b.stop_id
WHERE b.stop_name='ΥΜΗΤΤΟΥ';

//Ε) Ποια εταιρία έχει το δρομολόγιο της επιλογής σας (επιλέξτε μια συγκεκριμένη τιμή για το trip_short_name);

SELECT a.agency_id,a.agency_name
FROM TRIPS t JOIN ROUTES r on t.route_id=r.route_id JOIN AGENCY a on a.agency_id=r.agency_id
WHERE t.trip_short_name='F4GX1P';

//Πινακες
SELECT *FROM CALENDAR;
SELECT *FROM ROUTES;
SELECT *FROM TRIPS;
SELECT *FROM AGENCY;
SELECT *FROM STOP_TIMES;
SELECT *FROM STOPS;