-- 수행대비 SQL08. 조인2 정리

-- 1. 자연 조인(Natural Join)
select department_id 부서번호, department_name 부서이름, location_id 지역번호, city 도시
from departments
NATURAL JOIN locations
where city = 'Seattle';

select employee_id 사원번호, first_name 이름,
        d.department_id 부서번호, department_name 부서명
from employees e, departments d
where e.department_id = d.department_id;

select employee_id 사원번호, first_name 이름,
    department_id 부서번호, department_name 부서명
from employees
NATURAL JOIN departments;

-- 2. USING 절을 사용한 조인
select employee_id 사원번호, first_name 이름,
        department_id 부서번호, department_name 부서명
from employees
join departments using (department_id);

select department_name, city, country_name
from departments
join locations using(location_id)
join countries using(country_id);

-- 3. ON 절을 사용한 조인
select employee_id 사원번호, first_name 이름,
        departments.department_id 부서번호, department_name 부서명
from employees
join departments on employees.department_id = departments.department_id;

-- 검색 조건 두 가지 쓰는 방법
select department_id 부서번호, department_name 부서이름, d.location_id 지역번호, city 도시
from departments d
join locations l ON d.location_id = l.location_id
where city = 'Seattle';

select department_id 부서번호, department_name 부서이름, location_id 지역번호, city 도시
from departments d
join locations l using (location_id)
where city = 'Seattle';

select department_id 부서번호, department_name 부서이름, d.location_id 지역번호, city 도시
from departments d
join locations l ON d.location_id = l.location_id
                and city = 'Seattle';

-- 비 등가 조인 방법
-- 생략 ..

-- ON 절을 사용한 셀프 조인 (사원번호, 사원명, 상사번호, 상사명을 검색한다)
select e1.employee_id 사원번호, e1.first_name 사원명, e2.manager_id 상사번호, e2.first_name 상사명
from employees e1
join employees e2 on e1.manager_id = e2.employee_id;

-- 4. 외부 조인(Outer Join) - left, right, full
-- left : 왼쪽 테이블의 데이터는 모두 검색에 포함된다.
-- right : 오른쪽 테이블의 데이터는 모두 검색에 포함된다.
-- full : 양쪽 테이블의 데이터는 모두 검색에 포함된다.

select last_name, department_id, department_name
from employees e
left join departments d using (department_id);

select last_name, department_id, department_name
from employees e
right join departments d using (department_id);

select last_name, department_id, department_name
from employees e
full join departments d using (department_id);

-- 5. 크로스 조인(Cross Join) - 카티션 곱
select *
from departments; -- 27

select *
from locations; -- 23

select *
from departments
cross join locations; -- 621

-- 조인 2 실습하기
-- 1. 급여가 10000이상인 사원과 이 사원이 일하는 부서의 이름을 검색한다.
select first_name 이름, salary 급여, department_name 부서명
from employees
join departments using (department_id) 
where salary >= 10000;

-- 2. 각 부서가 위치하고 있는 도시의 이름을 검색한다.
select department_name 부서명, city 도시명
from departments
join locations using (location_id);

-- 3. 도시 'Toronto','Munich'에 위치한 부서들의 이름을 검색한다.
select city 도시명, department_name 부서명
from departments
join locations using (location_id)
where city in ('Toronto','Munich');

-- 4. 각 부서의 부장을 검색한다
select department_name 부서명, first_name 부장
from departments d
join employees e on d.manager_id = e.employee_id;

-- 5. 사원 중에서 자신의 상사보다 급여가 높은 사원의 급여 정보를 검색한다.
select e1.first_name 사원, e1.salary 사원급여, e2.first_name 상사, e2.salary 상사급여
from employees e1
join employees e2 on e1.employee_id = e2.manager_id
where e1.salary > e2.salary;

select e1.first_name 사원, e1.salary 사원급여, e2.first_name 상사, e2.salary 상사급여
from employees e1
join employees e2 on e1.manager_id = e2.employee_id
where e1.salary > e2.salary;

-- 6. 사원 중에서 이름은 같지만 사원번호가 다른 동명이인을 검색한다.
select e1.first_name 사원1, e1.employee_id 사원번호1, e2.first_name 사원2, e2.employee_id 사원번호2
from employees e1
join employees e2 on e1.first_name = e2.first_name and e1.employee_id <> e2.employee_id;
