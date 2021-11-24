
-- 각 부서의 최대 급여를 받는 사원의 부서코드, 이름, 급여를 출력(부서코드 순서대로 오름차순)
select department_id, first_name, salary
from employees e1
where (e1.department_id, e1.salary) in (select department_id, max(salary)
                                        from employees
                                       group by department_id)
order by e1.department_id;

-- 위 커리를 상관 커리로 바꾸어 보시오. 실행 순서 중요 !!! !!
select department_id, first_name, salary
from employees e1
where salary = (select max(salary) from employees e2
                where e1.department_id = e2.department_id)
order by department_id;

-- employees 테이블에서 급여가 높은사원 5명을 출력
select first_name, salary
from employees e1
where 5 > (select count(*) from employees e2
            where e2.salary > e1.salary)
order by salary desc;

-- 사원이 한명이라도 있는 부서명 출력
-- 방법 1
select department_name
from departments d
where EXISTS (select 1 from employees
            where department_id = d.department_id);
--  방법 2            
select department_name
from departments d
where 1 <= (select count(department_id) 
            from employees e
            where e.department_id = d.department_id);

-- 사원이 한명이라도 없는 부서명 출력
select department_name
from departments d
where NOT EXISTS (select 1 from employees
            where department_id = d.department_id);

select 1
from dual;

select first_name, last_name
from employees
order by 1;

-- 실습하기 1
-- Allan과 급여가 같은 사원들을 검색한다.
select department_id, salary
from employees
where salary = (select salary
                        from employees
                        where first_name = 'Allan')
AND first_name <> 'Allan';

-- 100번 부서의 사원들보다 입사가 늦은 사원들의 정보를 검색한다.
select first_name, hire_date
from employees
where hire_date > ALL(select hire_date
                        from employees
                        where department_id = 100)
AND department_id <> 100;

-- 각 부서에서 부서의 평균 급여와 같은 급여를 받는 사원들의 정보를 검색한다.
select department_id, employee_id, first_name, salary
from employees
where (department_id, salary) IN (select department_id, round(avg(salary))
                                    from employees
                                    group by department_id);
                                    
-- 각 부서별로 급여가 높은 사람 2명씩 출력한다.
select department_id, first_name, salary 급여
from employees A
where 2 > (select count(*)
            from employees
            where salary > A.salary
            and department_id = a.department_id)
order by department_id, salary desc;