-- Khởi tạo
create database Testing_system_assignment_1;
use Testing_system_assignment_1;
-- Assignment 1 & Question 1:
-- create tables with constraints and data types
create table Department(
     Department_id     int(10) auto_increment primary key,
     Department_name   varchar(100)
);
create table Positions(
     Position_id       int(10)auto_increment primary key,
     Position_name     varchar(100) not null
);
create table Accountt(
     Account_id        int(10) auto_increment primary key,
     Email             varchar(50),
     Username          varchar(50),
     Fullname          varchar(100),
     Department_id     int(10),
     Position_id       int(10),
     Create_date       date,
     foreign key (Department_id) references Department(Department_id),
     foreign key (Position_id) references   Positions(Position_id)
);
create table Groupp(
     Group_id          int(10) auto_increment primary key,
     Group_name        varchar(100) not null,
     Creator_id        int(10) not null,
     Create_date       date
);
create table Group_account(
	 Group_id          int(10) primary key auto_increment,
     Account_id        int(10),
     Joindate          date,
     foreign key (Group_id) references Groupp(Group_id),
     foreign key (Account_id) references Accountt(Account_id)
);
create table Type_question(
     Type_id            int(10) auto_increment primary key,
     Type_name          varchar(100) not null
);
create table Category_question(
     Category_id        int(10) auto_increment primary key,
     Category_Name      varchar(100) not null
);
create table Question(
     Question_id        int(10) auto_increment primary key,
     Content            varchar(500)not null,
     Category_id        int(10),
     Type_id            int(10),
     Creator_id         int(10),
     Create_date        date,
     foreign key(Category_id)references Category_question(Category_id),
     foreign key(Type_id)references Type_question(Type_id),
     foreign key(Creator_id)references Accountt(Account_id)
);

create table Answer(
     Answer_id          int(10)auto_increment primary key,
     Content            varchar(500)not null,
     Question_id        int(10),
     isCorrect          boolean,
     foreign key(Question_id)references Question(Question_id)
);

create table Exam(
     Exam_id            int(10) auto_increment primary key,
     Code               int(10)not null ,
     Title              varchar(50),
     Category_id        int(10),
     Duration           time,
     Create_id          int(10),
     Create_date        date,
     foreign key(Category_id) references Category_question(Category_id),
     foreign key(Create_id)references Accountt(Account_id)
);

create table ExamQuestion(
     Exam_id            int(10) primary key not null,
     Question_id        int(10),
     foreign key(Question_id)references Question(Question_id),
     foreign key(Exam_id)references Exam(Exam_id)
);

-- Question2: 
-- Question3: nhập dữ liệu
insert into Department(Department_name) values("Maketing"),
											  ("Sale"),
                                              ("Security"),
                                              ("HR"),
                                              ("Technical"),
                                              ("Finance"),
                                              ("CEO"),
                                              ("Manager"),
                                              ("Secretary"),
                                              ("Business");
insert into Positions(Position_name)values("Marketing staff"),
                                          ("Salesman"),
                                          ("Guard"),
                                          ("HR staff"),
                                          ("Engineer"),
                                          ("Finance staff"),
                                          ("CEO"),
                                          ("Manager"),
                                          ("Secretary"),
                                          ("Business");
insert into Accountt(Email,Username,Fullname,Create_date)values("lasdj@gmail.com","a","dkjsa","2000/11/21"),
                                                   ("saff@gmail.com","b","asgf","2000/02/12"),
                                                   ("safsf@gamil.com","c","safgfg","2000/02/04"),
                                                   ("safojdofj@gmail.com","d","asdwg","2000/04/02"),
                                                   ("sdfasdgi@gamil.com","e","asdwyhgd","2000/05/06"),
                                                   ("dsoigflg@gmail.com","f","feofkg","2000/06/02"),
                                                   ("iudhfd@gmail.com","g","gorjfjr","2000/05/05"),
                                                   ("doi0r@gamil.com","h","hkioeu","2000/06/07"),
                                                   ("idoufhdu@gmail.mom","i","igojhdje","2000/10/04"),
                                                   ("dkshdha@gmail.com","j","jofjj","2000/12/20");
insert into Groupp(Group_name,Creator_id,Create_date)values("gr1","1","2019/10/20"),
                                                           ("gr2","2","2019/02/20"),
                                                           ("gr3","3","2019/05/20"),
                                                           ("gr4","4","2019/05/10"),
                                                           ("gr5","5","2019/06/02"),
                                                           ("gr6","6","2019/06/09"),
                                                           ("gr7","7","2019/08/09"),
                                                           ("gr8","8","2019/02/06"),
                                                           ("gr9","9","2019/05/07"),
                                                           ("gr10","10","2019/09/02");
insert into Group_account(Joindate)values("2000/02/05"),
                                         ("2000/05/06"),
                                         ("2000/07/20"),
                                         ("2000/06/03"),
                                         ("2009/02/07"),
                                         ("2006/06/20"),
                                         ("2002/06/07"),
                                         ("2006/06/21"),
                                         ("2005/06/02"),
                                         ("2009/02/04");
insert into Type_question(Type_name)values("Essay"),
                                          ("Multiple-Choice"),
                                          ("Hard"),
                                          ("Insane"),
                                          ("Newbie"),
                                          ("Simple"),
                                          ("Veryhard"),
                                          ("Godmode"),
                                          ("Instinct"),
                                          ("Pay to win");
-- sao cái này nhiều thế 🙂                                          
insert into Category_question(Category_name)values("C++"),
                                                  ("Java"),
                                                  ("C#"),
                                                  (".Net"),
                                                  ("SQL"),
                                                  ("Postman?"),
                                                  ("Ruby"),
                                                  ("Python"),
                                                  ("Angular"),
                                                  ("R");
                                                  
insert into Question(Content,Create_date)values("ct1","2020/02/10"),
                                               ("ct2","2020/02/10"),
                                               ("ct3","2020/02/10"),
                                               ("ct4","2020/02/10"),
                                               ("ct5","2020/02/10"),
                                               ("ct6","2020/02/10"),
                                               ("ct7","2020/02/10"),
                                               ("ct8","2020/02/10"),
                                               ("ct9","2020/02/10"),
                                               ("ct10","2020/02/10");
                                               
insert into Answer(Content)values("A1"),
								 ("A2"),
                                 ("A3"),
                                 ("A4"),
                                 ("A5"),
                                 ("A6"),
                                 ("A7"),
                                 ("A8"),
                                 ("A9"),
                                 ("A10");
                                 
insert into Exam(Code,Title,Duration,Create_date)values("101","c1","11:20","2019/05/04"),
													   ("102","c2","11:20","2019/05/04"),
                                                       ("103","c3","11:20","2019/05/04"),
                                                       ("104","c4","11:20","2019/05/04"),
                                                       ("105","c5","11:20","2019/05/04"),
                                                       ("106","c6","11:20","2019/05/04"),
                                                       ("107","c7","11:20","2019/05/04"),
                                                       ("108","c8","11:20","2019/05/04"),
                                                       ("109","c9","11:20","2019/05/04"),
                                                       ("110","c10","11:20","2019/05/04");
                                                       