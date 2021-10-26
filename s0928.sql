
--부서별 직원 명부 출력

SELECT d.department_id 부서번호, department_name 부서명, first_name 사원명
    FROM departments d, employees e
    WHERE d.department_id = e.department_id
    ORDER BY 1 DESC;

--right outer join 2가지 방법

select d.department_id 부서번호, department_name 부서명, first_name 사원명
    from departments d, employees e
    where d.department_id(+) = e.department_id
    order by d.department_id desc;

select d.department_id 부서번호, department_name 부서명, first_name 사원명
    from departments d right outer join employees e
    on d.department_id = e.department_id
    order by d.department_id desc;

--left outer join 2가지 방법

select d.department_id 부서번호, department_name 부서명, first_name 사원명
    from departments d, employees e
    where d.department_id = e.department_id(+)
    order by d.department_id desc;
    
select d.department_id 부서번호, department_name 부서명, first_name 사원명
    from departments d left outer join employees e
    on d.department_id = e.department_id
    order by d.department_id desc;

--1. 급여가 10000 이상인 사원과 이 사원이 일하는 부서의 이름을 검색한다.

select e.first_name 사원명, e.salary 급여, d.department_name 부서명
    from employees e , departments d
    where d.department_id = e.department_id
    and e.salary >= 10000
    order by e.salary desc;
    
--2. 각 부서가 위치하고 있는 도시의 이름을 검색한다.

select d.department_name, l.city
    from departments d, locations l
    where d.location_id = l.location_id;
    
select d.department_name, l.city
    from departments d, locations l
    where d.location_id(+) = l.location_id;
    
select d.department_name, l.city
    from departments d right outer join locations l
    on d.location_id = l.location_id;

--3. 도시 'Toronto', 'Munich' 에 위치한 부서들의 이름을 검색한다.

select d.department_name, l.city
    from departments d inner join locations l
    on d.location_id = l.location_id
    where l.city in ('Toronto', 'Munich');
    
select d.department_name, l.city
    from departments d, locations l
    where d.location_id = l.location_id
    and l.city in ('Toronto', 'Munich');

--4. 각 부서의 부장(관리자, 매니저)을 검색한다.

select d.department_name 부서이름, e.first_name 관리자
from departments d, employees e
where d.manager_id = e.employee_id;

--5. 사원 중에서 자신의 상사보다 급여가 높은 사원의 급여 정보를 검색한다.

select e.first_name 사원명, e.salary 사원급여, m.first_name 상사명, m.salary "상사 급여"
from employees e, employees m
where e.manager_id = m.employee_id
and e.salary > m.salary;

select e.first_name 사원명, e.salary 사원급여, m.first_name 상사명, m.salary "상사 급여"
from employees e inner join employees m
on e.manager_id = m.employee_id
where e.salary > m.salary;
    
--6. 사원중에서 이름은 같지만 사원번호가 다른 동명이인을 검색한다.

select e1.first_name, e1.employee_id, e2.first_name, e2.employee_id
from employees e1, employees e2
where e1.first_name = e2.first_name
and e1.employee_id <> e2.employee_id
order by 1, 2, 4;
    