create schema Threater;

use Threater;

create table movie(
MovieID int(11) not null,
Movie_Name varchar(30),
Distributor varchar(30),
Director varchar(30),
Genre varchar(30),
Rating varchar(10),
Year_of_Release date,
Rental_Cost double,
Rental_Duration varchar(20),
primary key(MovieID));

insert into movie(MovieID, Movie_Name, Distributor, Director, Genre, Rating, Year_of_Release, Rental_Cost, Rental_Duration) values
('1001', 'The War', 'Rio', 'Sanjeev', 'test', '5star', '2022-1-2', '5000.00', '2 months'),
('1002', 'Star War', 'Rio', 'dipak', 'test', '5star', '2010-5-9', '5000', '3 months'),
('1003', 'Jimbabo', 'Rio', 'Saroj', 'test', '5star', '2018-9-6', '5000', '1 months'),
('1004', 'Ma timro', 'Rio', 'Rekha', 'test', '1star', '2016-2-1', '500', '5 months'),
('1005', 'Mr Bin', 'Sao', 'Sanjeev', 'test', '5star', '2010-9-7', '5000', '2 months');

select * from movie;

create table rental(
RentalID int(11) not null,
MemberID int(11) not null,
Rental_Date date,
Rental_Expiry date,
Total_Cost int(11),
primary key (RentalID));

insert into rental(RentalID, MemberID, Rental_Date, Rental_Expiry, Total_Cost) values
('2001', '303', '2022-1-2', '2022-3-5', '500'),
('2002', '301', '2021-5-4', '2021-5-30', '400'),
('2003', '302', '2020-7-20', '2020-9-20', '300'),
('2004', '304', '2019-8-30', '2019-9-30', '200'),
('2005', '305', '2018-5-12', '2018-6-13', '100');

select * from rental;

create table movie_rental(
RentalID int,
MovieID int,
foreign key (RentalID) references rental(RentalID),
foreign key (MovieID) references movie(MovieID));

insert into movie_rental(RentalID, MovieID) values
('2001','1001'),
('2002','1002'),
('2003','1003'),
('2004','1004'),
('2005','1005');

select * from movie;
select * from rental;
select * from movie_rental;