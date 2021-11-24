
--11월 16일 데프 수업 정리

select last_name, salary 
from employees
where salary > (select salary
                from employees
                where last_name = 'Abel');

-- 미완성
select *
from departments
where department_id > (select department_id
                from employees
                where last_name = 'Abel');
                
-- 20번 부서에 근무하는 사원의 관리자가 관리하는 다른 부서의 사원 검색
select employee_id, first_name
from employees
where manager_id IN
(select manager_id
from employees
where department_id = 20);

-- 직업코드가 'ST_MAN'인 사원의 급여 중 하나보다 낮은 급여를 받는 사원 검색
select salary, first_name
from employees
where salary < any
(select salary
from employees
where job_id = 'ST_MAN');

-- 이름이 'Bruce'인 사원과 직업코드, 상사번호가 같은 사원 겁색 (이름이 'Bruce'인 사원 제외)
select employee_id, first_name, last_name, job_id, salary, manager_id
from employees
where (manager_id, job_id) IN (select manager_id, job_id
                                from employees
                                where first_name = 'Bruce')
and first_name <> 'Bruce';

-- 이건 뭔지 모름
select *
from employees A
where (A.job_id, A.salary) IN (
    select job_id, MIN(salary)
    from employees
    group by job_id)
order by A.salary desc;
                
