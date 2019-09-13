.read 0.sql
.echo on

select 
  avg(point) over (order by class), 
  class, name, point 
  from student_grades;

select 
  count(*) filter(where 80<=point) over (order by class), 
  class, name, point 
  from student_grades;

select 
  count(*) filter(where 80<=point) over (partition by class order by point desc), 
  class, name, point 
  from student_grades;

select 
  count(*) 
    filter(where 80<=point) 
    over (
      partition by class 
      order by point desc 
      groups between unbounded preceding and unbounded following
    ), 
  class, name, point 
  from student_grades;

select 
  class, name, point, 
  group_concat(point) 
    over (
      partition by class 
      order by point desc
    )
  from student_grades;

create table T(id integer primary key, name text, parent integer);
insert into T values 
  (1, 'root', 0),
  (2, 'n1',   1),
  (3, 'n2',   1),
  (4, 'n11',  2);
select 
  id, name, 
  group_concat(name, '/') 
    over (order by id)
  from T;
select 
  id, name, 
  group_concat(name, '/') 
    filter (id = parent)
    over (order by id)
  from T;

select 
  max(point) over (partition by class order by point desc), 
  class, name, point 
  from student_grades;

select 
  min(point) over (partition by class order by point desc), 
  class, name, point 
  from student_grades;

select 
  min(point) 
    over (
      partition by class 
      order by point desc
      groups between unbounded preceding and unbounded following
    ), 
  class, name, point 
  from student_grades;

select 
  sum(point) over (partition by class order by point desc), 
  class, name, point 
  from student_grades;

select 
  sum(point) over (partition by class order by point desc), 
  class, name, point 
  from student_grades;

select 
  sum(point) 
    over (
      partition by class 
      order by point desc
      groups between unbounded preceding and unbounded following
    ), 
  class, name, point 
  from student_grades;

