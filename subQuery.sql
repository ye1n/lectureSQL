-- 서브쿼리 실습하기

-- Bruce와 같은 부서에서 일하는 사원들의 이름, 입사일을 검색한다.
SELECT first_name, hire_date
FROM employees
WHERE department_id IN ( SELECT department_id
                        FROM employees
                        WHERE first_name = 'Bruce')
AND first_name <> 'Bruce';

-- 인원 수가 가장 많은 부서 번호를 검색한다.
SELECT department_id, count(department_id) 인원수
FROM employees
GROUP BY department_id
HAVING count(department_id) = ( SELECT MAX(count(department_id))
                                FROM employees
                                GROUP BY department_id);

-- Daniel과 같은 부서에서 일하는 사원 중에서 급여가 Jack보다 낮은 사원을 검색한다.
SELECT department_id , first_name
FROM employees
WHERE department_id = (SELECT department_id

FROM employees
WHERE first_name='Daniel')

AND salary < (SELECT salary
FROM employees
WHERE first_name = 'Jack');

-- Shipping 부서에서 일하는 사원 중 2007년도에 입사한 사원들의 이름과 입사일을 검색한다.
SELECT first_name, hire_date
FROM employees
WHERE department_id = (SELECT department_id

FROM departments
WHERE department_name ='Shipping')

AND TO_CHAR(hire_date,'yyyy') = '2007';

-- 전 사원 중 급여가 가장 낮은 사원이 일하고 있는 부서는 어디 도시에 위치하고 있는지 검색한다.
SELECT first_name, department_name, city
FROM employees
JOIN departments USING (department_id)
JOIN locations USING (location_id)
WHERE salary = (SELECT MIN(salary) FROM employees);

-- Allan과 급여가 같은 사원들을 검색한다.
SELECT employee_id, salary
FROM employees
WHERE salary = ( SELECT salary
FROM employees
WHERE first_name = 'Allan')

AND first_name <> 'Allan';

-- 100번 부서의 사원들보다 입사가 늦은 사원들의 정보를 검색한다.
SELECT first_name, hire_date
FROM employees
WHERE hire_date > ALL(SELECT hire_date
FROM employees
WHERE department_id = 100)

AND department_id <> 100;

-- 각 부서에서 부서의 평균급여와 같은 급여를 받는 사원들의 정보를 검색한다.
SELECT department_id, employee_id, first_name, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, round(avg(salary))

FROM employees
GROUP BY department_id);

-- 각 부서별로 급여가 높은 사람 2명씩 출력한다.
SELECT department_id, first_name, salary 급여
FROM employees A
WHERE 2 > (SELECT COUNT(*)
FROM employees
WHERE salary > A.salary
AND department_id = A.department_id)

ORDER BY department_id, salary DESC;

-- ‘IT_PROG’ 직급 중 가장 많이 받는 사원의 급여보다, 더 많은 급여를 받는
-- ‘FI_ACCOUNT’ 또는 ‘SA_REP’ 직급 직원들을 조회하시오.
-- 조건1) 급여순으로 내림 차순 정렬 하시오.
-- 조건2) 타이틀은 사원명, 업무ID, 급여로 표시하시오.

SELECT first_name 사원명, job_id 업무ID, salary 급여
FROM employees
WHERE (job_id = 'FI_ACCOUNT' OR job_id = 'SA_REP')
AND salary > (SELECT MAX(salary)

FROM employees
WHERE job_id = 'IT_PROG')

ORDER BY 3 DESC;