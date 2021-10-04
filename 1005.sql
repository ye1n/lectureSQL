
-- 데이터 베이스 2학년 2학기 1차 수행 대비 정리

----------------
--1. select문

-- 테이블 구조 검색
desc employees;

-- 현재 스키마의 모든 테이블 목록 검색
select * from tab;

-- 별명을 사용한 검색
select first_name Name , last_name "Name" from employees;

-- null값 변환값으로 변환 (타입 일치해야함)
select nvl(commission_pct, 0) from employees;

-- 연결연산자
select last_name || ' is a ' || job_id "employees" from employees;

-- distinct(중복제거), all(기본값, 중복된 값 모두 출력)

-- 실습_1
desc employees;

-- 실습_2
select * from employees;

--실습_3
select * from departments;

-- 실습_4
select employee_id, last_name, job_id, hire_date "startdate", nvl(manager_id,0) 
from employees;

--실습_5
select employee_id, last_name, salary+200 "Salary"
from employees;

--실습_6
select first_name || '사원의 월급은 $' || salary || '입니다.'
from employees;

--실습_7
select DISTINCT job_id from employees;

----------------
--2. where문

-- 비교 연산자( = 같음, <= 작거나 같음, >= 크거나 같음, > 큼, < 작음, != 같지 않음, <> 같지 않음)

-- 널 값의 비교 연산 is null(널 값을 선택), is not null(널이 아닌 값을 선택)

-- 논리연산자 (and, or, not(not in, not between, not like, not null))

-- 연산자 우선순위 비교연산자 > not > and > or

-- between 연산자 예시 : 급여가 5000에서 7000이내인 사원의 이름, 급여 검색
select first_name, salary 
from employees 
where salary between 5000 and 7000;

-- in 연산자 예시 : 10, 60번 부서에 속한 부서번호, 사원의 이름, 급여 검색
select department_id, first_name, salary 
from employees 
where department_id in (10, 60);

-- like 연산자 예시 : 이름의 두번째 알파벳이 'O'인 사원의 이름, 사원번호, 부서번호 검색
select first_name, employee_id, department_id
from employees 
where first_name like '_o%';

-- 실습_1
select employee_id, first_name, salary*12
from employees 
where salary * 12 <= 35000;

-- 실습_2
select employee_id, first_name, department_id
from employees 
where commission_pct is not null;

-- 실습_3
select *
from employees 
where hire_date >= '2006/01/01';

-- 실습_4
select *
from employees
where hire_date between '05/01/01' and '07/12/31';

-- 실습_5
select *
from employees
where department_id = 100 and last_name like 'S%';

-- 실습_6
select *
from employees
where (job_id = 'SA_REP' or job_id = 'ST_CLERK') and salary not in (7000, 8000);

-- 실습_7
select *
from employees
where commission_pct is null and first_name like '_____';

-- 실습_8
select *
from employees
where department_id in (50,80) and commission_pct <= 0.2;

select *
from employees
where department_id in (50,80) and nvl(commission_pct, 0) <= 0.2;

-- 실습_9
select first_name
from employees
where first_name like '%a%' and first_name like '%e%';

-- 실습_10
select first_name || last_name 사원명 , '$' || salary 급여 , department_id 부서ID
from employees
where (salary <= 2500 or salary >= 3000) and department_id = 90;

----------------
-- 3. ORDER BY 절

-- ASC : 기본값 / 오름차순, DESC : 내림차순

-- 실습_1
select *
from employees
where hire_date between '2005/01/01' and '2007/12/31'
order by hire_date;

-- 실습_2
select employee_id, first_name, hire_date, salary
from employees
where job_id in ('SA_REP','AD_VP')
order by first_name;

-- 실습_3
select first_name, salary, commission_pct
from employees
where commission_pct is not null
order by salary desc, commission_pct desc;

-- 실습_4
select department_id, job_id, salary
from employees
where salary >= 7000
order by department_id, job_id, salary desc;

-- 실습_5
select first_name, job_id, salary
from employees
where job_id in ('SA_REP','AD_PRES') and salary > 15000
order by job_id, first_name;

----------------
-- 4. 단일 행 함수

-- 대소문자 조작 함수
-- lower : 소문자로 변환
-- upper : 대문자로 변환
-- initcap : 첫문자 대문자, 나머지 소문자로 변환
select lower(first_name), upper(first_name), initcap(first_name)
from employees;

-- 문자 조작 함수
-- concat(문자열1, 문자열2) : 두개의 문자열 연결
-- substr(문자열 또는 컬럼명, 시작위치, 출력문자수) : 특정 부분만 잘라내기
-- length(문자열 또는 컬럼명) : 문자열 길이 반환
-- instr(문자열, 검색문자, 시작문자, 횟수) : 지정된 문자의 위치를 반환 
-- ltrim(문자열 또는 컬럼명, '제거할 문자'), ltrim(문자열 또는 컬럼명, '제거할 문자') : 지정된 문자 제거
-- lpad(문자열 또는 컬럼명, 자리수, '채울문자'), rpad(문자열 또는 컬럼명, 자리수, '채울문자') : 공백에 특정한 문자 채우기

----------------

