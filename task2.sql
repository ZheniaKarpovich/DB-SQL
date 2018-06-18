select *
from `students`
where `status`= 1;


select *
from `trainings`
where `country` = 'China';

select *
from `trainings`
where year(`date_start`) = 2018 and month(`date_start`) = 04;

select `name`, datediff(`date_end`, `date_start`) as `course_duration`, `country`, `describe`
from `trainings`;

select `idTeachers`, `f_name`, `s_name`, `m_name`, `position`, `company`, `name` as `training_name`, `contact_number`
from `teachers` left join `trainings` 
on `idTeachers` = `head`
where `name` is not null;

select `idStudents`, `f_name`, `s_name`, `m_name`, `group` as `group_id`, `studentresults`.`idTask`, `name` as `task_name`, `mark`
from `students` left outer join `studentresults` 
on `idStudents` = `Students_idStudents`
left outer join `tasks`
on `studentresults`.`idTask` = `tasks`.`idTask`;

select `idTeachers`, `f_name`, `s_name`, `m_name`, `position`, `company`, `name` as `training_name`, `contact_number`
from `teachers` left outer join `trainings` 
on `idTeachers` = `head`
where `name` is not null
group by `idTeachers`
having count(idTeachers) >= 2;

select `group`, count(`group`)
from `students`
group by `group`
union all
select `idGroup` as `group`, count(`idGroup`)
from `lessons`
group by `idGroup`;

select *
from `groups`
where `number_of_students` > (select avg(`number_of_students`) from `groups`);

select *
from `groups`
where (select count(`idStudents`)
	from `students`
    where `students`.`group` = `groups`.`idGroups`) > 2

