-- 10/26 수업 내용

select *
from locations, regions; -- 23 * 4 ==> 92

select *
from locations cross join regions;

select first_name 이름, e.department_id, d.department_name, department_name 부서명
from employees e join departments d
on e.department_id = d.department_id;

select first_name 이름, department_id, department_name 부서명
from employees e join departments d
using (department_id);

select department_name 부서명, city 도시명
from departments d join locations l
on d.location_id = l.location_id;

select department_name 부서명, location_id, city 도시명
from departments d join locations l
using (location_id);

select l.city, d.department_name
from departments d join locations l
on d.location_id = l.location_id
where l.city in ('Toronto', 'Munich');

select l.city, d.department_name
from departments d join locations l
on d.location_id = l.location_id
where l.city in ('Toronto', 'Munich', 'Seattle');

select department_name, first_name
from departments d join employees e
on d.department_id = e.department_id
where d.manager_id = e.employee_id;

select department_name, first_name
from departments d join employees e
on d.department_id = e.department_id
where d.manager_id = e.employee_id
order by d.department_name desc;

select department_name, first_name
from departments d join employees e
on d.manager_id = e.employee_id
order by d.department_name desc;

select A.first_name 사원, A.salary 사원급여, B.first_name 상사, B.salary 상사급여
from employees A join employees B
on A.manager_id = B.employee_id
and A.salary > B.salary;

select A.employee_id 사원번호1, B.employee_id 사원번호2, A.first_name
from employees A join employees B
on A.first_name = B.first_name
and A.employee_id != B.employee_id;


-- 서브쿼리

select salary
from employees
where last_name = 'Abel';

select last_name, salary
from employees
where salary > 11000;

select last_name, salary
from employees
where salary > ( select salary
from employees
where last_name = 'Abel');

select last_name, salary
from employees
where salary >= (select max(salary)
                from employees);
                
-- 10/26 과제

SELECT first_name 이름, department_name 부서이름, salary 급여
FROM employees
JOIN departments USING (department_id)
WHERE salary > = 10000;

SELECT department_name 부서명,city 도시명
FROM departments
JOIN locations USING (location_id);

SELECT city 도시명, department_name 부서명
FROM departments
JOIN locations USING (location_id)
WHERE city IN ('Toronto','Munich');

SELECT department_name 부서, first_name 부장
FROM employees A JOIN departments B
on A.employee_id = B.manager_id;

SELECT A.first_name 사원, A.salary 사원급여, B.first_name 상사,
B.salary 상사급여
FROM employees A
JOIN employees B ON A.manager_id = B.employee_id
AND A.salary > B.salary;

SELECT A.employee_id 사원번호1, B.employee_id 사원번호2,
A.first_name 이름1, B.first_name 이름2
FROM employees A
JOIN employees B ON A.first_name = B.first_name
AND A.employee_id <> B.employee_id;
                