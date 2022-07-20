Create database IRCTC_project;
use IRCTC_project;
create table train_db(
  train_name varchar(200) not null,
  train_no int primary key not null,
  source varchar(200) not null,
  destination varchar(200) not null,
  start_time varchar(200) not null,
  reach_time varchar(200) not null,
  train_type varchar(200) not null,
  train_halts int not null
);
create table train_route_db(
  train_route_id int primary key not null,
  train_no int not null,
  train_source varchar(200) not null,
  train_destination varchar(200) not null,
  arrival_time varchar(200) not null,
  reach_time varchar(200) not null,
  foreign key (train_no) references train_db(train_no)
);
create table train_fare_db(
  train_fare_id int primary key not null,
  -- train_no int, [ref: > train_db.train_no]
  class_id int not null,
  train_fare int not null,
  train_route_id int not null,
  foreign key (class_id) references train_db(train_no),
  foreign key (train_route_id) references train_route_db(train_route_id)
);

create table transaction_db(
  transaction_id int primary key not null,
  transaction_time varchar(200) not null,
  transaction_type varchar(200) not null,
  transaction_status varchar(200) not null
);
create table user_details_db(
  user_id varchar(200) primary key not null,
  password varchar(200) not null,
  first_name varchar(200) not null,
  last_name varchar(200) not null,
  mobile_number int not null,
  email_id varchar(200) not null,
  date_of_birth varchar(200) not null,
  gender varchar(200) not null,
  city varchar(200) not null,
  state varchar(200) not null,
  pincode int not null,
  aadhar bigint not null
);


create table coach_db(
  coachId int primary key not null,
  coach_name varchar(200) not null,
  totalSeats int not null,
  train_fare int not null
);
create table class_db(
  id int primary key not null,
  type varchar(200) not null,
  coach_id int not null,
  foreign key (coach_id) references coach_db(coachId)
);
create table booking_db(
  booking_id int primary key not null,
  train_no int not null,
  no_of_passengers int not null,
  ticket_fare_id int not null,
  transaction_id int not null,
  date varchar(200) not null,
  user_id varchar(200) not null,
  foreign key (transaction_id) references transaction_db(transaction_id),
  foreign key (user_id) references user_details_db(user_id)
);
-- drop table booking_db;
create table schedule_db(
  schedule_id int primary key not null,
  train_id int not null,
  day varchar(200) not null
);
create table cancel_ticket_db(
  id int primary key not null,
  booking_id int not null,
  refund_status varchar(200) not null,
  transaction_id int not null,
  foreign key (booking_id) references booking_db(booking_id),
  foreign key (transaction_id) references transaction_db(transaction_id)
);
-- drop table cancel_ticket_db;

create table seat_status_db(
  status_id int primary key not null,
  ticket_fare_id int not null,
  date varchar(200) not null,
  booked_status varchar(200) not null,
  waiting_seats int not null,
  foreign key (ticket_fare_id) references train_fare_db(train_fare_id)
);

insert into user_details_db values ('ui1','uipwd1','Akshay','Aswani',9000001,'aswaniakshay@gmail.com','1998-09-09','M','Jaipur','Rajasthan',302016,7418529631);
insert into user_details_db values ('ui2','uipwd2','Sarosh','Sharma',9000002,'sarosh.mahendru@gmail.com','1998-06-15','M','Chandigarh','Punjab',140413,7418529632);
insert into user_details_db values ('ui3','uipwd3','Ritik','Raj',9000003,'ui3@g.com','1998-11-19','M','Delhi','Delhi',314278,7418529633);
insert into user_details_db values ('ui4','uipwd4','Abhishek','Singh',9000004,'ui4@g.com','1999-10-10','M','Manipur','Manipur',302016,7418529634);
insert into user_details_db values ('ui5','uipwd5','Nitin','Agarwal',9000005,'ui5@g.com','2000-01-19','M','Hyderabad','Telagana',124587,7418529635);
insert into user_details_db values ('ui6','uipwd6','Mayank','Aggarwal',9000006,'ui6@g.com','2000-02-29','M','Ahemdabad','Gujrat',308926,7418529636);
insert into user_details_db values ('ui7','uipwd7','Harpreet','Kaur',9000007,'ui7@g.com','1999-03-09','M','Jammu','Jammu',307896,7418529637);
insert into user_details_db values ('ui8','uipwd8','Vishal','Bajaj',9000008,'ui8@g.com','1998-04-17','M','Dharmshala','Himachal',301616,7418529638);
insert into user_details_db values ('ui9','uipwd9','Varun','Goyal',9000009,'ui9@g.com','1999-05-29','M','Surat','Gujrat',307216,7418529639);
insert into user_details_db values ('ui10','uipwd10','Lovish','Verma',9000010,'ui10@g.com','2000-06-20','M','Ranchi','Jharkhand',302016,7418529610);
insert into user_details_db values ('ui11','uipwd11','Anjali','Das',90000011,'ui11@g.com','1999-07-09','M','Vijayvada','Andhra Pradesh',302016,7418529611);
insert into user_details_db values ('ui12','uipwd12','Paras','Nath',90000012,'ui12@g.com','1998-08-06','M','Vizag','Andhra Pradesh',307814,7418529612);
insert into user_details_db values ('ui13','uipwd13','Bharti','Atwal',9000013,'ui13@g.com','1999-12-12','F','Tamil Nadu','Tamil Nadu',374658,7418529613);
insert into user_details_db values ('ui14','uipwd14','Komal','Singh',9000014,'ui14@g.com','2000-11-29','F','Pune','Maharastra',312321,7418529614);
insert into user_details_db values ('ui15','uipwd15','Deepak','Chhabra',9000015,'ui15@g.com','1999-07-02','M','Chennai','Chennai',302020,7418529615);
insert into user_details_db values ('ui16','uipwd16','Niharika','Verma',9000016,'ui16@g.com','1999-11-16','F','Bangalore','Karnataka',254698,7418529616);
insert into user_details_db values ('ui17','uipwd17','Muskan','Goyal',9000017,'ui17@g.com','2000-06-19','F','Delhi','Delhi',374985,7418529617);
insert into user_details_db values ('ui18','uipwd18','Ridhi','Soni',9000018,'ui18@g.com','1999-03-22','M','Chandigarh','Punjab',140413,7418529618);
insert into user_details_db values ('ui19','uipwd19','Avneet','Singh',9000019,'ui19@g.com','1999-10-06','F','Jaipur','Rajasthan',302016,7418529619);
insert into user_details_db values ('ui20','uipwd20','Renish','Sen',9000020,'ui20@g.com','2000-01-12','M','Kolkata','West Bengal',451278,7418529620);
select * from user_details_db;

