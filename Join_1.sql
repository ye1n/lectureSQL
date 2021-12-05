-- 조인1 수행 대비 복습

-- 2. 등가 조인, 비등가 조인
-- 등가 조인 예제
select employee_id 사원번호, first_name 이름, e.department_id  부서번호1,
        d.department_id 부서번호2, department_name 부서이름
from employees e, departments d
where e.department_id = d.department_id;

select location_id, employee_id 사원번호, first_name 이름, e.department_id 부서번호,
        department_name 부서이름
from employees e, departments d
where e.department_id = d.department_id
and location_id = 1700;

-- 사원번호, 사원명, 부서명, 도시명을 검색한다. (employees, departments, locations)
select employee_id, first_name, d.department_name, city
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id;

-- 비등가조인 예제
select employee_id, first_name, salary, grade
from employees, salarygrade
where salary between losalary and hisalary;

-- 3. 자체 조인(self join)
select e1.employee_id 사원번호, e1.first_name 사원이름, e1.manager_id 상사번호,
        e2.employee_id 상사사원번호, e2.first_name 상사이름
from employees e1, employees e2
where e1.manager_id = e2.employee_id;

-- 4. 외부 조인(outer join) - 포괄조인
select d.department_id 부서번호, department_name 부서명, first_name 사원명
from departments d, employees e
where d.department_id = e.department_id
order by 1 desc;

select d.department_id 부서번호, department_name 부서명, first_name 사원명
from departments d, employees e
where d.department_id (+) = e.department_id
order by 1 desc;

select d.department_id 부서번호, department_name 부서명, first_name 사원명
from departments d, employees e
where d.department_id = e.department_id (+)
order by 1 desc;

-- 조인1 실습하기
-- 1. 급여가 10000이상인 사원과 이 사원이 일하는 부서의 이름을 겁색한다.
select first_name, salary, department_name
from employees e, departments d
where e.department_id = d.department_id
and salary >= 10000;

-- 2. 각 부서가 위치하고 있는 도시의 이름을 검색한다.
select department_name 부서, city 도시
from departments d, locations l
where d.location_id = l.location_id;

-- 3. 도시 'Toronto', 'Munich'에 위치한 부서들의 이름을 검색한다.
select city, department_name 부서명
from departments d, locations l
where d.location_id = l.location_id
and city in ('Toronto', 'Munich');

-- 4. 각 부서의 부장을 검색한다.
select first_name, department_name, d.manager_id
from employees e, departments d
where e.manager_id(+) = d.manager_id;

-- 5. 사원 중에서 자신의 상사보다 급여가 높은 사원의 급여 정보를 검색한다.
select e1.first_name, e1.salary, e2.first_name, e2.salary 
from employees e1, employees e2
where e1.manager_id = e2.employee_id
and e1.salary > e2.salary;

-- 6. 사원 중에서 이름은 같지만 사원번호가 다른 동명이인을 검색한다.
select distinct e1.first_name, e1.employee_id
from employees e1, employees e2
where e1.first_name = e2.first_name
and e1.employee_id <> e2.employee_id;

