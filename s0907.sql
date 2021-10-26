--palette_a 
create table palette_a(
    id int primary key,
    color varchar2 (100) not null
);

insert into palette_a (id, color) values (1, 'Red');
insert into palette_a (id, color) values (2, 'Green');
insert into palette_a (id, color) values (3, 'Blue');
insert into palette_a (id, color) values (4, 'Purple');

--palette_b
create table palette_b(
    id int primary key,
    color varchar2 (100) not null
);

insert into palette_b (id, color) values (1, 'Green');
insert into palette_b (id, color) values (2, 'Red');
insert into palette_b (id, color) values (3, 'Cyan');
insert into palette_b (id, color) values (4, 'Brown');

select * from palette_a;
select * from palette_b;

--1. InnerJoin
select 
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_a
from 
    palette_a a
inner join palette_b b on a.color = b.color;

--2. leftOuterJoin
select 
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_a
from 
    palette_a a
left join palette_b b on a.color = b.color;

--3. Null표현 leftOuterJoin
select 
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_a
from 
    palette_a a
left join palette_b b on a.color = b.color
where b.id is null;

--4. rightOuterJoin
select 
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_a
from 
    palette_a a
right join palette_b b on a.color = b.color;

--5. Null표현 rightOuterJoin
select 
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_a
from 
    palette_a a
right join palette_b b on a.color = b.color
where a.id is null;

--6. fullOuterJoin
select 
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_a
from 
    palette_a a
full outer join palette_b b on a.color = b.color;

--7. Null표현 fullOuterJoin
select 
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_a
from 
    palette_a a
full outer join palette_b b on a.color = b.color
where a.id is null or b.id is null;

--8. CrossJoin
--select count(*)
select *
from 
    palette_a a
cross join palette_b b;

--9. selfJoin
select 
    e1.hire_date,
    e1.employee_id,
    (e1.first_name || ' ' || e1.last_name) employee1,
    e2.employee_id,
    (e2.first_name || ' ' || e2.last_name) employee2
from 
    employees e1
inner join employees e2 on
    e1.employee_id > e2.employee_id
    and e1.hire_date = e2.hire_date
order by 
    e1.hire_date desc, employee1, employee2;