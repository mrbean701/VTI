use testing_system_assignment_1;
-- Question 1:

create view list_sale as
select ac.account_id, ac.fullname from accountt ac
where ac.department_id in (select de.department_id
from department de where department_name ='sale');

-- question 2:
create view list_group as
select ac.* from accountt ac inner join(select account_id, count(group_id)
from group_account ac1 group by account_id having count(group_id)=(select max(mycount)
from (select account_id,count(group_id) mycount from group_account ac2 group by account_id)a3))
gpa on gpa.account_id=ac.account_id;

-- Question 3: question has a longest content
create view question_1 as
select * from question where char_length(content)>300;
drop view question_1;

-- Question 4:
create view department_1 as
select de.* from department de inner join(
select department_id,count(account_id) from accountt ac1
group by department_id having count(account_id)= (select max(mycount)
from (select department_id,count(account_id) mycount
from accountt ac2 group by department_id)ac3))
ac on de.department_id=ac.department_id;

-- Question 5: 
insert into Accountt(Email,Username,Fullname,Create_date)values("lasdj@gmail.com","a","dkjsa","2000/11/21"),
                                                   ("saff@gmail.com","b","nguyen","2000/02/12"),
                                                   ("safsf@gamil.com","c","safgfg","2000/02/04"),
                                                   ("safojdofj@gmail.com","d","asdwg","2000/04/02"),
                                                   ("sdfasdgi@gamil.com","e","asdwyhgd","2000/05/06"),
                                                   ("dsoigflg@gmail.com","f","feofkg","2000/06/02"),
                                                   ("iudhfd@gmail.com","g","gorjfjr","2000/05/05"),
                                                   ("doi0r@gamil.com","h","hkioeu","2000/06/07"),
                                                   ("idoufhdu@gmail.mom","i","igojhdje","2000/10/04"),
                                                   ("dkshdha@gmail.com","j","jofjj","2000/12/20");
create view question_2 as select question.* from question
inner join accountt on question.creator_id=account_id
where fullname like concat('nguyen');