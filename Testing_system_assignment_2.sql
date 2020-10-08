-- Assignment 2
use testing_system_assignment_1;
-- Question 1
select * from department;

-- Question 2
select department_id from department where departmentname = 'sale';

-- Question 3
select * from accountt where char_length(fullname) >= all(select char_length(fullname) from accountt);

-- Question 4
select group_name from groupp where datediff(create_date, '2019/12/20') <=0;

-- Question 5
select question_id from question where (
select count(answer_id)from answer where question.question_id = answer.question_id) >=4;

-- Question 6
select * from groupp order by create_date desc limit 5;

-- Question 8
delete from exam where datediff(create_id,'2019/12/20')<= 0; -- câu này bị lỗi em không hiểu sao :<

-- Question 9
update accountt set fullname ='Nguyen Ba Loc',
					email = 'loc.nguyenba@vti.com.vn'
where account_id = 5;

-- Question 10
select * from accountt a inner join department de on de.department_id = a.department_id;

-- Question 11 : Technical = dev :V
select * from accountt a inner join department de on de.department_id=a.department_id and department_name = 'Technical';

-- Question 12:
select de.department_id, de.department_name
from department de inner join (select department_id,count(account_id)
from accountt group by department_id having count(account_id)>3)
a on de.department_id= a.department_id;

-- Question 13:
select question_id,count(exam_id) from examquestion group by question_id
order by count(exam_id) desc limit 1;

-- Question 14:
select exam_id,count(question_id) from examquestion group by exam_id;

-- Question 15:
select question_id,count(answer_id) from answer group by question_id order by count(answer_id) desc limit 1;

-- Question 16:
select position_id,count(account_id)from accountt group by position_id order by count(account_id) asc limit 1;

-- Question 17:
select ac.department_id, ac.position_id,po.position_name,count(ac.position_id) as so_nv
from accountt ac inner join department de on de.department_id = ac.department_id
inner join positions po on po.position_id=ac.position_id
group by ac.department_id,po.position_name;

-- Question 18:
select * ,ans.content from question qu
inner join answer ans on ans.question_id= ans.question_id;

-- Question 19:
select q.category_id, cq.category_name,count(category_id)
from question q inner join category_question cq on q.category_id= cqcategory_id
group by category_id;