--1. display the subject code,  and total marks for every student.
 select student_code,(sum(subject1)+sum(subject2)+sum(subject3))  as total_marks
from student_marks
group by student_code
order by student_code;

 --2. List the name and designations of the staff who have joined before Jan 2005.
 
select staff_master.staff_name,designation_master.design_name
from staff_master
join designation_master
on staff_master.design_code=designation_master.design_code
where staff_master.hiredate < '01-01-2005';


--3. Display the employees for whom the manager is not allocated.
select * from emp
where mgr is null;

--4. display the details of the books that is not been returned and expected return date was monday.
 select b.book_code,b.book_name, t.book_expected_return_date, t.book_actual_return_date 
from book_transactions t 
join book_master b 
on b.book_code=t.book_code 
where to_char(book_expected_return_date, 'fmday')='monday' and book_actual_return_date is null;

 
--5. check the date of birth of the students and display only those students who were born on saturday or sunday.
 select student_name,to_char(student_dob,'fmDay') AS DOB
 from student_master
 where trim(to_char(student_dob,'Day'))='Saturday' or trim(to_char(student_dob,'Day'))='Sunday';
 
 

--6. display the staff name and hire date (through this date find out the day!).create a new column as DAY in the result nd sort it to start from monday.
 select ename, to_char(hiredate,'fmDay') as "HireDay" 
  from emp
 order by mod(to_char(hiredate, 'D') + 5, 7)
 
 --OR
 
SELECT ename, to_char(hiredate, 'fmDAY') AS "Day" 
FROM emp
ORDER BY (next_day(hiredate, 'MONDAY') - hiredate) DESC

--OR
SELECT ename, to_char(hiredate, 'fmDAY') AS "Day"
FROM emp
ORDER BY (hiredate - next_day(hiredate, 'MONDAY'))

--OR

SELECT ename, TO_CHAR(hiredate,'Day')
FROM emp
ORDER BY TO_CHAR(hiredate -1,'d') ;
 
 
 
--7. display manager name, manager code and salary of the lowest paid staff in that manager's group
--Exclude that group where the salary is less then 10k. Display other records in desc order.

select s.staff_name as manager, m.mgr_code, min(s.staff_sal)
from staff_master s 
join staff_master m 
on s.staff_code=m.mgr_code 
where s.staff_sal>10000 
group by m.mgr_code, s.staff_name, s.staff_sal 
order by s.staff_sal desc;
 

 
 