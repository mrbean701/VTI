-- bai 1 (1/10)

create database Extra_Assignment_1;
use Extra_Assignment_1;
-- Exercise 1:
create table trainee(
TraineeID         int primary key not null auto_increment,
Full_Name         nvarchar(100),
Birth_Date        date,
Gender            enum('male','female','unknow'),
ET_IQ             int(20),
ET_Gmath          int(20),
ET_English        int(50),
Training_Class    varchar(20),
Evaluation_Notes  nvarchar(500)
);

alter table trainee
add         VTI_Account varchar(50) not null
after       TraineeID;

-- Exercise 2:
create table DataTypes(
ID 	            mediumint 	auto_increment	primary key , 
NAME            varchar(30),
CODE 			char(5), 
MODIFIED_DATE 	datetime
);

-- Exercise 3:
create table DataTypes2(
ID 				mediumint auto_increment not null primary key ,
Name 			varchar(50), 
BirthDate 		date, 
Gender 			enum('male','female','unknow'), 
IsDeletedFlag 	enum('0 active','1 deleted') 
);
