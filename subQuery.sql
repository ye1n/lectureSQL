-- SQL09. 서브쿼리

-- 1. 서브쿼리(Sub Query)란?
-- 단일 행 서브 쿼리 : 서브 쿼리가 하나의 컬럼에서 하나의 행을 검색한다.
-- 다중 행 서브 쿼리 : 서브 쿼리가 하나의 컬럼에서 여러 개의 행을 검색한다.
-- 다중 열 서브 쿼리 : 서브 쿼리가 여러 개의 열을 검색한다.


-- 2. 단일 행 서브 쿼리

select salary -- 11000
from employees
where last_name ='Abel';

select last_name, salary
from employees 
-- where salary > 11000
where salary > (select salary
                from employees
                where last_name ='Abel');
                
-- 단일 행 서브 쿼리 에러
select last_name, salary
from employees
where salary > (select salary
                from employees);
-- 단일 행 연산자를 사용 할 때는 반드시 결과 값은 한 개만 검색되어야 한다.

-- 여러 번 사용된 단일 행 서브 쿼리
select employee_id, last_name, department_id, salary
from employees
where department_id != (select department_id
                        from employees
                        where last_name = 'Hunold')
and salary < (select salary
            from employees
            where last_name = 'Hunold');

-- HAVING절에 사용한 서브 쿼리
select department_id, min(salary)
from employees
where department_id is not null
group by department_id
having min(salary) > (select min(salary)
                        from employees
                        where department_id = 50);

-- 부서별 급여의 평균 중에서 가장 높은 부서를 검색한다.
select department_id, max(avg(salary))
from employees
group by department_id; -- not a single-group group function

select department_id
from employees
group by department_id
having avg(salary) = (select max(avg(salary))
                        from employees
                        group by department_id);

-- 조인 문장을 사용하여 질의하기
select employee_id, first_name
from employees A
join departments B on A.department_id = B.department_id
and department_name = 'IT';

select employee_id, first_name
from employees
join departments using (department_id)
where department_name = 'IT';

-- 3. 다중 행 서브 쿼리

--IN 연산자를 사용한 다중 행 서브 쿼리
select manager_id
from employees
where department_id = '20'; --100,201
                    
select employee_id, first_name, salary, department_id
from employees
where manager_id in (select manager_id
                    from employees
                    where department_id = '20')
and department_id <> '20';

--ANY 연산자를 사용한 다중 행 서브 쿼리
select salary
from employees
where job_id = 'ST_MAN'; -- 8000, 8200, 7900, 6500, 5800
                    
select employee_id, last_name, job_id, salary
from employees
where salary < any (select salary
                    from employees
                    where job_id = 'ST_MAN');

--ALL 연산자를 사용한 다중 행 서브 쿼리
select salary
from employees
where job_id = 'ST_MAN'; -- 8000, 8200, 7900, 6500, 5800
                    
select employee_id, last_name, job_id, salary
from employees
where salary < all (select salary
                    from employees
                    where job_id = 'ST_MAN')
and job_id <> 'ST_MAN';

-- 4. 다중 열 서브 쿼리
select employee_id, last_name, job_id, salary
from employees
where (manager_id, job_id) in (select manager_id, job_id
                                from employees
                                where first_name='Bruce')
and first_name <> 'Bruce';

-- 위 쿼리를 서브 쿼리로 바꾸기

-- 각 부서별 최소 급여를 받는 사원의 정보를 검색한다.
select *
from employees
where (department_id, salary) in (select department_id, min(salary)
                                    from employees
                                    group by department_id);

-- 5. 상관쿼리(currelated sub query)

-- 각 부서의 최대 급여를 받는 사원의 부서코드, 이름, 급여를 출력(부서코드 순으로 오름차순)
select department_id, first_name, salary
from employees
where (department_id, salary) in (select department_id, max(salary)
            from employees
            group by department_id)
order by department_id;

-- 위 커리를 상관 커리로 바꾸어 보시오.
select department_id, first_name, salary
from employees e1
where salary = (select max(salary)
            from employees e2
            where e1.department_id = e2.department_id)
order by department_id;

-- EXISTS, NOT EXISTS

-- 각 부서의 최대 급여를 받는 사원의 부서코드, 이름, 급여를 출력(부서코드 순으로 오름차순)


-- EMP 테이블에서 급여가 높은 사원 5명을 출력


-- 사원이 한명이라도 있는 부서명 출력


-- 사원이 한명도 없는 부서명 출력

