-- 서브 쿼리

--성이 Adel인 사원보다 급여가 높은 사원의 정보 출력

select *
from employees
where salary > (select salary from employees where last_name = 'Abel');

-- 부서명이 'IT' 인 사원의 정보

select *
from departments d join employees e
on d.department_id = e.department_id
where d.department_name = 'IT';

select *
from employees
where d.department_id = (
    select department_id
    from departments
    where department_name = 'IT' );
    
-- 성이 'hunold'인 사원보다 급여가 낮고 부서가 다른 사원 검색



-- 50번 부서의 최저 급여보다 높은 부서의 최저 급여 검색

select department_id, min(salary)
from employees 
where department_id is not null
group by department_id
having min(salary) > (
    select min(salary)
    from employees
    where department_id = 50);

-- 부서별 급여 평균이 가장 높은 부서 검색

select department_name
from departments
where department_id =
    ( select department_id
    from employees
    group by department_id
    having avg(salary) = ( select max(avg(salary))
        from employees
        group by department_id ));
        
-- 20번 부서에 근무하는 사원의 관리자가 관리하는 다른 부서의 사원 검색

select employee_id, first_name, salary, department_id
from employees
where manager_id in ( select manager_id
                    from employees
                    where department_id = '20')
and department_id <> '20';

-- 20번, 80번에 속하지 X
select employee_id, first_name, salary, department_id
from employees
where manager_id in ( select manager_id
                    from employees
                    where department_id in (20, 80))
and department_id not in (20, 80);

-- 직업코드가 'ST_MAN' 인 사원의 급여보다 낮은 급여를 받는 사원 검색

select employee_id, last_name, job_id, salary
from employees
where salary < any (
    select salary
    from employees
    where job_id = 'ST_MAN')
and job_id <> 'ST_MAN';
