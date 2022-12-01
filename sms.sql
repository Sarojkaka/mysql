create schema sms;
use sms;
create table addresses(
address_id int(15) not null auto_increment,
address_details varchar(25) not null,
primary key (address_id));

select * from addresses;

create table schools(
school_id int(15) not null auto_increment,
address_id int,
school_name varchar(25) not null,
school_principal varchar(25) not null,
other_school_details varchar(25) not null,
primary key (school_id),
foreign key(address_id) references addresses(address_id));

select * from schools;

create table teachers(
teacher_id int(15) not null auto_increment,
school_id int,
gender varchar(25) not null,
first_name varchar(25) not null,
middle_name varchar(25) not null,
last_name varchar(25) not null,
other_teacher_details varchar(25),
primary key(teacher_id),
foreign key(school_id) references schools(school_id));

select * from teachers;

create table subject(
subject_id int(15) not null auto_increment,
subject_name varchar(25) not null,
primary key(subject_id));

select * from subject;

create table classes(
class_id int(15) not null auto_increment,
subject_id int,
teacher_id int,
class_code varchar(25) not null,
class_name varchar(25) not null,
date_from date,
date_to date,
primary key(class_id),
foreign key(subject_id) references subject(subject_id),
foreign key(teacher_id) references teachers(teacher_id));

select * from classes;

create table parents(
parent_id int(15) not null auto_increment,
gender varchar(25) not null,
first_name varchar(25) not null,
middle_name varchar(25) not null,
last_name varchar(25) not null,
other_parent_details varchar(25) not null,
primary key(parent_id));

select * from parents;

create table students(
student_id int(15) not null auto_increment,
first_name varchar(25) not null,
middle_name varchar(25) not null,
last_name varchar(25) not null,
dete_of_birth date,
gender varchar(25) not null,
other_student_details varchar(50),
primary key(student_id));

select * from students;

create table homework(
homework_id int(15) not null auto_increment,
student_id int,
date_created date not null,
homework_content varchar(25) not null,
grade varchar(20) not null,
other_homework_details varchar(20), 
primary key(homework_id),
foreign key(student_id) references students(student_id));

select * from homework;

create table reports(
report_id int(20) not null auto_increment,
student_id int,
date_created date not null,
report_content varchar(50) not null,
teacher_comments varchar(50) not null,
other_report_details varchar(50) not null,
primary key(report_id),
foreign key(student_id) references students(student_id));

select * from reports;

create table parent_addresses(
parent_id int,
address_id int,
date_address_from int(15) not null auto_increment,
primary key(date_address_from),
foreign key(parent_id) references parents(parent_id),
foreign key(address_id) references addresses(address_id));

select * from parent_addresses;

create table student_parents(
student_id int,
parent_id int,
foreign key(student_id) references students(student_id),
foreign key(parent_id) references parents(parent_id));

select * from student_parents;

create table student_addresses(
student_id int,
address_id int,
date_from date not null,
date_to date not null,
address_details varchar(25) not null,
primary key(date_from),
foreign key(student_id) references students(student_id),
foreign key(address_id) references addresses(address_id));

select * from student_addresses;

create table families(
family_id int(20) not null auto_increment,
head_of_family_parent_id int,
family_name varchar(25) not null,
primary key(family_id),
foreign key(head_of_family_parent_id) references parents(parent_id));

select * from families;



create table family_members(
family_member_id int(15) not null auto_increment,
family_id int,
parents_of_student_memeber varchar(25),
parent_id int,
student_id int,
primary key(family_member_id),
foreign key(family_id) references families(family_id),
foreign key(parent_id) references parents(parent_id),
foreign key(student_id) references students(student_id));

select * from family_members;

create table student_classes(
student_id int,
class_id int,
date_from date not null,
date_to date,
primary key(date_from),
foreign key(student_id) references students(student_id),
foreign key(class_id) references classes(class_id));

select * from student_classes;
