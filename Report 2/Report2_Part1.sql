-- 3-1 --
select name 
from student natural join department 
where building = 'Taylor' and tot_cred > 50
limit 5;

-- 3-2 --
select course_id, title
from course
where course_id in (select course_id 
					from takes 
                    where ID = '10033')
limit 5;

-- 3-3 --
select ID, name, count(course_id)
from student natural join takes
group by ID
having count(course_id) >= 2
limit 5;

-- 3-4 --
with courseCounts (ID, course_count) as (
	select ID, count(course_id) as course_count
	from student natural join takes
	group by ID
	having count(course_id) >= 2)
select ID, course_count 
from courseCounts
where course_count = (select min(course_count) from courseCounts);

select distinct t1.ID
from takes t1
where not exists(
	select t2.course_id
	from takes t2
	where t2.ID = '63039'
	and t2.course_id not in (select course_id 
							from takes t3
							where t3.ID = t1.ID));

-- 3-5 --
select S1.ID from student as S1
where (S1.tot_cred > (select min(S2.tot_cred) 
					from student as S2
                    where S2.dept_name = 'Comp. Sci.'))
limit 5;

-- 3-6 --
select distinct name 
from student natural join takes
where (course_id not in (select course_id
						from course
						where dept_name = 'Elec. Eng.'))
limit 5;

-- 3-7 --
select distinct name 
from student natural join takes
where (course_id = any (select course_id
						from course
                        where dept_name = 'Comp. Sci.'))
limit 5;

-- 3-8 --
select student.ID
from student natural join takes natural join course
where course.dept_name = 'Comp. Sci.'
group by student.ID
having count(takes.course_id) <= 1
limit 5;

-- 3-9 --
with dept_tot_cred (dept_name, total_credit) as (
	select dept_name, sum(credits) as total_credit
    from course
    group by dept_name
)
select dept_name
from dept_tot_cred
where total_credit = (select min(total_credit) from dept_tot_cred);

-- 3-10 --
with failingStudents as (
	select id
    from takes natural join course
    where dept_name = 'Comp. Sci.' and grade = 'F')
delete from takes
where id in (select id from failingStudents);
