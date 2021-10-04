
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
select first_name, substr(first_name, -1,3)
from employees;
-- length(문자열 또는 컬럼명) : 문자열 길이 반환
-- instr(문자열, 검색문자, 시작문자, 횟수) : 지정된 문자의 위치를 반환 
select instr('HelloWorld', 'W')
from dual;
select instr('HelloToWorld', 'o', -5)
from dual;
-- ltrim(문자열 또는 컬럼명, '제거할 문자'), ltrim(문자열 또는 컬럼명, '제거할 문자') : 지정된 문자 제거
select ltrim('register','r')
from dual;
-- lpad(문자열 또는 컬럼명, 자리수, '채울문자'), rpad(문자열 또는 컬럼명, 자리수, '채울문자') : 공백에 특정한 문자 채우기
select first_name, lpad(first_name, 10, '#')
from employees;

-- 문자 치환 함수
-- replace(문자열 또는 컬럼명, '문자1', '문자2') : 문자1을 문자2로 바꾸어 출력
select replace('Hello World', 'lo', '**')
from dual;

select replace(first_name, substr(first_name, 2, 3),'***')
from employees;

-- 숫자 함수
-- round(m,n), trunc(m,n) : m을 n까지 반올림, 버림
select round(12.345, 1)
from dual;
-- mod(m,n), power(m,n) : m을 n으로 나눈 나머지, m의 n계승
select mod(12,5), power(2,3)
from dual;
-- ceil(n), floor(n) : n보다 큰 가장 작은 정수, n보다 작은 가장 큰 정수
select ceil(12.34), floor(12.34)
from dual;
-- abs(n), sqrt(n) : n의 절댓값, 제곱근
select abs(-5), sqrt(4)
from dual;

-- 날짜 함수
-- sysdate : 현재 시간 & 날짜
select sysdate from dual;
-- months_between(날짜1, 날짜2) : 두 날짜 사이의 개월 수
-- add_months(날짜, n) : 날짜에 n달 만큼의 달수를 추가
-- next_day(날짜, 요일) : 날짜를 기준으로 돌아오는 가장 최근 요일의 날짜
-- last_day(날짜) : 날짜를 포함한 달의 마지막 날짜
select sysdate, next_day(sysdate, '월'), last_day(sysdate)
from dual;
-- round(날짜), trunc(날짜) : 정오를 기준으로 반올림, 무조건 당일

-- 데이터형 변환 함수
--to_char, to_date, to_number
select first_name, hire_date, to_char(hire_date, 'yyyy')
from employees;

select to_date('2017/01/01') + 1, to_char(1234.56, '999.99')
from dual;

-- 일반 함수
-- nvl2(1,2,3) : 1의 값이 null이 아닌 경우 2값, null인 경우 3값으로 대체
-- decode, case 함수
select last_name, job_id, salary,
    decode(job_id, 'IT_PROG', salary * 1.1,
                    'ST_CLERK', salary * 1.2,
                    'SA_REP', salary * 1.3,
                    salary) 인상급여
from employees;

select last_name, job_id, salary,
    case job_id when 'IT_PROG' then salary * 1.1
                when 'ST_CLERK' then salary * 1.2
                when 'SA_REP' then salary * 1.3
                else salary
    end 인상급여
from employees;

-- 실습_1
select upper(first_name) "Name", length(first_name)
from employees
where first_name like 'A%' or first_name like 'E%'
order by first_name;

-- 실습_2
select first_name, last_name
from employees
where substr(last_name, 1, 2) = 'Ba';
--where last_name like 'Ba%';

-- 실습_3
select last_name, substr(last_name, 1, length(last_name)-1)
from employees;

-- 실습_4
select first_name, department_id, job_id, replace(job_id, 'AD_VP', 'SA_MAN')
from employees;

-- 실습_5
select hire_date + 99, hire_date, add_months(hire_date, 36)
from employees
where department_id = 80;

-- 실습_6
select salary * 12, trunc(salary * 12, -2)
from employees
where department_id = 30;

-- 실습_7
select round(nvl(commission_pct, 0.1), 1)
from employees;

-- 실습_8
select *
from employees
where hire_date >= '2002/01/01';

select *
from employees
where hire_date >= to_date('2002/01/01','yyyy/dd/mm');

-- 실습_9
select hire_date
from employees
where to_char(hire_date,'mm') = '07';

-- 실습_10
select salary,
    case trunc(salary/2000, 0) when 0 then 0.0
                    when 1 then 0.09
                    when 2 then 0.2
                    when 3 then 0.3
                    when 4 then 0.4
                    when 5 then 0.45
    end 세금율
from employees
where department_id = 80
order by salary desc;

-- 실습_11
select job_id,
    case job_id when 'AD_PRES' then 'A'
                    when 'ST_MAN' then 'B'
                    when 'IT_PROG' then 'C'
                    when 'ST_CLERK' then 'D'
                    else '0'
    end 등급
from employees;

----------------

-- 5. 그룹 함수

-- 그룹 함수 
-- count : 행의 수를 계산 한다.
-- max : 최대값 반환, min : 최소 값 반환
-- avg : 평균 값 계산, sum : 총 합계 계산
-- variance : 분산을 계산, stddev : 표준편차 계산

-- 예제_1
select max(salary), min(salary), trunc(avg(salary),0), sum(salary)
from employees;

-- 예제_2
select count(*)
from employees
--where commission_pct is null;
where nvl(commission_pct, 0) = 0;

-- 예제_3
select count( DISTINCT nvl2(department_id, department_id, 0)) 
--select count( DISTINCT nvl(department_id, 0)) 
from employees;

-- 실습_1
select manager_id, avg(salary), variance(salary), stddev(salary)
from employees
where department_id = 50
group by manager_id;

-- 실습_2
SELECT job_id,count(job_id)
FROM employees
WHERE MONTHS_BETWEEN(SYSDATE, hire_date) >= 72
GROUP BY job_id;

-- 실습_3
select department_id, round(avg(salary),0)
from employees
where department_id != 100
group by department_id
having avg(salary) >= 7000;

-- 실습_4
select job_id, department_id, sum(salary)
from employees
where department_id in (20, 50, 80, 90)
group by job_id, department_id;

SELECT job_id, department_id, sum(salary)
FROM employees
GROUP BY job_id, department_id
HAVING department_id IN(20, 50, 80 , 90); 

-- 실습_5
select department_id, count(department_id)
from employees
group by department_id
having count(department_id) >= 4;

----------------
