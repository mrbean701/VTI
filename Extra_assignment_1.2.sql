-- Exercise 1:
-- Question 1:
use Extra_assignment_1;
insert into trainee(full_name, birth_date, gender, et_iq,et_gmath,et_english,training_class) values
('as','2000/02/12','M',20,20,50,'1'),
('asd','2001/03/12','F',12,10,45,'3'),
('asdf','2002/04/20','F',11,19,39,'2'),
('asdfg','2000/03/10','M',20,12,50,'3'),
('asfgh','2000/06/19','M',11,12,37,'4'),
('asqwe','2001/09/11','M',20,20,45,'5'),
('kghjd','2000/12/12','M',12,20,49,'6'),
('kghdkr','2000/10/16','M',20,20,40,'6'),
('asadsads','2000/04/29','F',12,19,35,'5'),
('ghhdie','2001/04/13','M',11,09,34,'2');

-- Question 2:
select month(birth_date) as group_1, full_name, birth_date,gender
from trainee order by group_1 asc;

-- Question 3:
select * from trainee where length(full_name) = (select max(length(full_name)) from trainee);

-- Question 4:
select * from trainee where et_iq + ET_Gmath >= 20
and ET_IQ >= 8 and ET_Gmath >= 8 and ET_English >= 18;

-- Question 5:
delete from trainee where traineeid = 3;

-- Question 6:
update trainee set training_class = 2 where traineeid = 5;

-- Exercise 2:
-- Question 1:
create table Department(
     Department_Number      tinyint(20) primary key auto_increment ,
     Department_Name        varchar(50) not null
);

create table Employee_table(
     Employee_Number        tinyint(20) primary key auto_increment ,
     Employee_Name          varchar(50),
     Department_Number       tinyint(20) not null,
     foreign key (Department_Number) references department(Department_Number) on delete cascade
);

create table Employee_Skill_Table(
     Employee_Number        tinyint(20),
     Skill_code             varchar(30) not null,
     Date_registered        date,
     foreign key(Employee_Number) references Employee_table(Employee_number) on delete cascade
);
select * from Department;
drop table Employee_Skill_Table;
drop table Employee_Table;
drop table Department;
-- Question 2:
insert into Department(Department_Name) values("Maketing"),
											  ("Sale"),
                                              ("Security"),
                                              ("HR"),
                                              ("Technical"),
                                              ("Finance"),
                                              ("CEO"),
                                              ("Manager"),
                                              ("Secretary"),
                                              ("Business");
                                              
insert into Employee_Table(Employee_Name, Department_Number)values('Adam',1),
															      ('Emily','1'),
                                                                  ('Emma','1'),
                                                                  ('Dave','2'),
                                                                  ('John','3'),
                                                                  ('Jack','1'),
                                                                  ('Jimmy','5'),
                                                                  ('Kate','3'),
                                                                  ('Ivan','4'),
                                                                  ('Mark','5'),
                                                                  ('Richar','6'),
                                                                  ('Tommy','7'),
                                                                  ('Lucy','8'),
                                                                  ('Luke','8'),
                                                                  ('William','9'),
                                                                  ('Shady','7'),
                                                                  ('Wang','6'),
                                                                  ('Butcher','9');

insert into employee_skill_table(Employee_Number,Skill_Code,Date_Registered) values('1','java','2019/12/02'),
                                                                                   ('1','python','2020/03/05'),
                                                                                   ('1','c#','2020/05/04'),
                                                                                   ('2','c++','2019/05/06'),
                                                                                   ('2','php','2019/12/12'),
                                                                                   ('3','lang','2019/05/06'),
                                                                                   ('3','r','2019/02/19'),
                                                                                   ('4','css','2019/05/07'),
                                                                                   ('6','react','2020/12/30'),
                                                                                   ('6','java','2019/06/10'),
                                                                                   ('7','c++','2020/05/01'),
                                                                                   ('7','sql','2019/12/07'),
                                                                                   ('7','c#','2020/10/12'),
                                                                                   ('8','java','2019/05/01'),
                                                                                   ('8','python','2020/05/08'),
                                                                                   ('8','css','2019/09/20'),
                                                                                   ('9','python','2020/01/05'),
                                                                                  ('9','css','2019/05/29'),
                                                                                   ('9','java','2020/11/19');
-- Question 3:
select e.Employee_Name from Employee_Table e inner join Employee_Skill_Table es
on e.Employee_Number = es.Employee_Number where es.Skill_Code = 'java';
 select * from Department;
 
-- Question 4:
select d.Department_Name, count(e.Employee_Number) as Employees From Department d
inner join Employee_Table e on d.Department_Number = e.Department_Number
group by Department_Name having Employees > 3;

-- Question 5:
select d.Department_Name, group_concat(e.Employee_Name separator', ')
as Employees from Department d inner join Employee_Table e on d.Department_Number = e.Department_Number
group by d.Department_Name;

-- Question 6:
select distinct Employee_Name From Employee_Table
inner join Employee_Skill_Table es on es.Employee_Number = es.Employee_Number;
