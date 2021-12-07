####   1.Display the subject code,and total marks for every student.
```sql
select student_code,(sum(subject1)+sum(subject2)+sum(subject3))  as total_marks
from student_marks
group by student_code
order by student_code;
```
#### OUTPUT:
<img src="https://github.com/Umakant03/KPI-Partners/blob/main/Case_Study/Week_3/case1.png"   height="760" width="369">

#### 2.List the name and designations of the staff who have joined before Jan 2005.
```sql
select staff_master.staff_name,designation_master.design_name
from staff_master
join designation_master
on staff_master.design_code=designation_master.design_code
where staff_master.hiredate < '01-01-2005';
```
#### OUTPUT:
<img src="https://github.com/Umakant03/KPI-Partners/blob/main/Case_Study/Week_3/case2.png"   height="451" width="478">

#### 3.Display the employees for whom the manager is not allocated.
```sql
select * from emp
where mgr is null;
```
#### OUTPUT:
<img src="https://github.com/Umakant03/KPI-Partners/blob/main/Case_Study/Week_3/case3.png"   height="279" width="790">

#### 4.Display the details of the books that is not been returned and expected return date was monday.
```sql
SELECT EXTRACT(day FROM book_expected_return_date) "Month"
from book_transactions;
select * from book_transactions;
```
#### 5.check the date of birth of the students and display only those students who were born on saturday or sunday.
```sql
select student_name,to_char(student_dob,'fmDay') AS DOB
 from student_master
 where trim(to_char(student_dob,'Day'))='Saturday' or trim(to_char(student_dob,'Day'))='Sunday';
```
#### OUTPUT:
<img src="https://github.com/Umakant03/KPI-Partners/blob/main/Case_Study/Week_3/case5.png"   height="429" width="846">

#### 6.Display the staff name and hire date (through this date find out the day!).create a new column as DAY in the result nd sort it to start from monday.
```sql
SELECT ename, to_char(hiredate, 'fmDAY') AS "Day"
FROM emp
ORDER BY (hiredate - next_day(hiredate, 'MONDAY')
```
#### OUTPUT:
<img src="https://github.com/Umakant03/KPI-Partners/blob/main/Case_Study/Week_3/case6.png"   height="547" width="493">

#### 7. display manager name, manager code and salary of the lowest paid staff in that manager's group Exclude that group where the salary is less then 10k. Display other records in desc order.
```sql
select staff_name,mgr_code,staff_sal
from staff_master
where staff_sal>10000
order by staff_sal desc;
```
#### OUTPUT:
<img src="https://github.com/Umakant03/KPI-Partners/blob/main/Case_Study/Week_3/case7.png"   height="456" width="493">




