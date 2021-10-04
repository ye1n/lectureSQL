
-- ������ ���̽� 2�г� 2�б� 1�� ���� ��� ����

----------------
--1. select��

-- ���̺� ���� �˻�
desc employees;

-- ���� ��Ű���� ��� ���̺� ��� �˻�
select * from tab;

-- ������ ����� �˻�
select first_name Name , last_name "Name" from employees;

-- null�� ��ȯ������ ��ȯ (Ÿ�� ��ġ�ؾ���)
select nvl(commission_pct, 0) from employees;

-- ���Ῥ����
select last_name || ' is a ' || job_id "employees" from employees;

-- distinct(�ߺ�����), all(�⺻��, �ߺ��� �� ��� ���)

-- �ǽ�_1
desc employees;

-- �ǽ�_2
select * from employees;

--�ǽ�_3
select * from departments;

-- �ǽ�_4
select employee_id, last_name, job_id, hire_date "startdate", nvl(manager_id,0) 
from employees;

--�ǽ�_5
select employee_id, last_name, salary+200 "Salary"
from employees;

--�ǽ�_6
select first_name || '����� ������ $' || salary || '�Դϴ�.'
from employees;

--�ǽ�_7
select DISTINCT job_id from employees;

----------------
--2. where��

-- �� ������( = ����, <= �۰ų� ����, >= ũ�ų� ����, > ŭ, < ����, != ���� ����, <> ���� ����)

-- �� ���� �� ���� is null(�� ���� ����), is not null(���� �ƴ� ���� ����)

-- �������� (and, or, not(not in, not between, not like, not null))

-- ������ �켱���� �񱳿����� > not > and > or

-- between ������ ���� : �޿��� 5000���� 7000�̳��� ����� �̸�, �޿� �˻�
select first_name, salary 
from employees 
where salary between 5000 and 7000;

-- in ������ ���� : 10, 60�� �μ��� ���� �μ���ȣ, ����� �̸�, �޿� �˻�
select department_id, first_name, salary 
from employees 
where department_id in (10, 60);

-- like ������ ���� : �̸��� �ι�° ���ĺ��� 'O'�� ����� �̸�, �����ȣ, �μ���ȣ �˻�
select first_name, employee_id, department_id
from employees 
where first_name like '_o%';

-- �ǽ�_1
select employee_id, first_name, salary*12
from employees 
where salary * 12 <= 35000;

-- �ǽ�_2
select employee_id, first_name, department_id
from employees 
where commission_pct is not null;

-- �ǽ�_3
select *
from employees 
where hire_date >= '2006/01/01';

-- �ǽ�_4
select *
from employees
where hire_date between '05/01/01' and '07/12/31';

-- �ǽ�_5
select *
from employees
where department_id = 100 and last_name like 'S%';

-- �ǽ�_6
select *
from employees
where (job_id = 'SA_REP' or job_id = 'ST_CLERK') and salary not in (7000, 8000);

-- �ǽ�_7
select *
from employees
where commission_pct is null and first_name like '_____';

-- �ǽ�_8
select *
from employees
where department_id in (50,80) and commission_pct <= 0.2;

select *
from employees
where department_id in (50,80) and nvl(commission_pct, 0) <= 0.2;

-- �ǽ�_9
select first_name
from employees
where first_name like '%a%' and first_name like '%e%';

-- �ǽ�_10
select first_name || last_name ����� , '$' || salary �޿� , department_id �μ�ID
from employees
where (salary <= 2500 or salary >= 3000) and department_id = 90;

----------------
-- 3. ORDER BY ��

-- ASC : �⺻�� / ��������, DESC : ��������

-- �ǽ�_1
select *
from employees
where hire_date between '2005/01/01' and '2007/12/31'
order by hire_date;

-- �ǽ�_2
select employee_id, first_name, hire_date, salary
from employees
where job_id in ('SA_REP','AD_VP')
order by first_name;

-- �ǽ�_3
select first_name, salary, commission_pct
from employees
where commission_pct is not null
order by salary desc, commission_pct desc;

-- �ǽ�_4
select department_id, job_id, salary
from employees
where salary >= 7000
order by department_id, job_id, salary desc;

-- �ǽ�_5
select first_name, job_id, salary
from employees
where job_id in ('SA_REP','AD_PRES') and salary > 15000
order by job_id, first_name;

----------------
-- 4. ���� �� �Լ�

-- ��ҹ��� ���� �Լ�
-- lower : �ҹ��ڷ� ��ȯ
-- upper : �빮�ڷ� ��ȯ
-- initcap : ù���� �빮��, ������ �ҹ��ڷ� ��ȯ
select lower(first_name), upper(first_name), initcap(first_name)
from employees;

-- ���� ���� �Լ�
-- concat(���ڿ�1, ���ڿ�2) : �ΰ��� ���ڿ� ����
-- substr(���ڿ� �Ǵ� �÷���, ������ġ, ��¹��ڼ�) : Ư�� �κи� �߶󳻱�
select first_name, substr(first_name, -1,3)
from employees;
-- length(���ڿ� �Ǵ� �÷���) : ���ڿ� ���� ��ȯ
-- instr(���ڿ�, �˻�����, ���۹���, Ƚ��) : ������ ������ ��ġ�� ��ȯ 
select instr('HelloWorld', 'W')
from dual;
select instr('HelloToWorld', 'o', -5)
from dual;
-- ltrim(���ڿ� �Ǵ� �÷���, '������ ����'), ltrim(���ڿ� �Ǵ� �÷���, '������ ����') : ������ ���� ����
select ltrim('register','r')
from dual;
-- lpad(���ڿ� �Ǵ� �÷���, �ڸ���, 'ä�﹮��'), rpad(���ڿ� �Ǵ� �÷���, �ڸ���, 'ä�﹮��') : ���鿡 Ư���� ���� ä���
select first_name, lpad(first_name, 10, '#')
from employees;

-- ���� ġȯ �Լ�
-- replace(���ڿ� �Ǵ� �÷���, '����1', '����2') : ����1�� ����2�� �ٲپ� ���
select replace('Hello World', 'lo', '**')
from dual;

select replace(first_name, substr(first_name, 2, 3),'***')
from employees;

-- ���� �Լ�
-- round(m,n), trunc(m,n) : m�� n���� �ݿø�, ����
select round(12.345, 1)
from dual;
-- mod(m,n), power(m,n) : m�� n���� ���� ������, m�� n���
select mod(12,5), power(2,3)
from dual;
-- ceil(n), floor(n) : n���� ū ���� ���� ����, n���� ���� ���� ū ����
select ceil(12.34), floor(12.34)
from dual;
-- abs(n), sqrt(n) : n�� ����, ������
select abs(-5), sqrt(4)
from dual;

-- ��¥ �Լ�
-- sysdate : ���� �ð� & ��¥
select sysdate from dual;
-- months_between(��¥1, ��¥2) : �� ��¥ ������ ���� ��
-- add_months(��¥, n) : ��¥�� n�� ��ŭ�� �޼��� �߰�
-- next_day(��¥, ����) : ��¥�� �������� ���ƿ��� ���� �ֱ� ������ ��¥
-- last_day(��¥) : ��¥�� ������ ���� ������ ��¥
select sysdate, next_day(sysdate, '��'), last_day(sysdate)
from dual;
-- round(��¥), trunc(��¥) : ������ �������� �ݿø�, ������ ����

-- �������� ��ȯ �Լ�
--to_char, to_date, to_number
select first_name, hire_date, to_char(hire_date, 'yyyy')
from employees;

select to_date('2017/01/01') + 1, to_char(1234.56, '999.99')
from dual;

-- �Ϲ� �Լ�
-- nvl2(1,2,3) : 1�� ���� null�� �ƴ� ��� 2��, null�� ��� 3������ ��ü
-- decode, case �Լ�
select last_name, job_id, salary,
    decode(job_id, 'IT_PROG', salary * 1.1,
                    'ST_CLERK', salary * 1.2,
                    'SA_REP', salary * 1.3,
                    salary) �λ�޿�
from employees;

select last_name, job_id, salary,
    case job_id when 'IT_PROG' then salary * 1.1
                when 'ST_CLERK' then salary * 1.2
                when 'SA_REP' then salary * 1.3
                else salary
    end �λ�޿�
from employees;

-- �ǽ�_1
select upper(first_name) "Name", length(first_name)
from employees
where first_name like 'A%' or first_name like 'E%'
order by first_name;

-- �ǽ�_2
select first_name, last_name
from employees
where substr(last_name, 1, 2) = 'Ba';
--where last_name like 'Ba%';

-- �ǽ�_3
select last_name, substr(last_name, 1, length(last_name)-1)
from employees;

-- �ǽ�_4
select first_name, department_id, job_id, replace(job_id, 'AD_VP', 'SA_MAN')
from employees;

-- �ǽ�_5
select hire_date + 99, hire_date, add_months(hire_date, 36)
from employees
where department_id = 80;

-- �ǽ�_6
select salary * 12, trunc(salary * 12, -2)
from employees
where department_id = 30;

-- �ǽ�_7
select round(nvl(commission_pct, 0.1), 1)
from employees;

-- �ǽ�_8
select *
from employees
where hire_date >= '2002/01/01';

select *
from employees
where hire_date >= to_date('2002/01/01','yyyy/dd/mm');

-- �ǽ�_9
select hire_date
from employees
where to_char(hire_date,'mm') = '07';

-- �ǽ�_10
select salary,
    case trunc(salary/2000, 0) when 0 then 0.0
                    when 1 then 0.09
                    when 2 then 0.2
                    when 3 then 0.3
                    when 4 then 0.4
                    when 5 then 0.45
    end ������
from employees
where department_id = 80
order by salary desc;

-- �ǽ�_11
select job_id,
    case job_id when 'AD_PRES' then 'A'
                    when 'ST_MAN' then 'B'
                    when 'IT_PROG' then 'C'
                    when 'ST_CLERK' then 'D'
                    else '0'
    end ���
from employees;

----------------

-- 5. �׷� �Լ�

-- �׷� �Լ� 
-- count : ���� ���� ��� �Ѵ�.
-- max : �ִ밪 ��ȯ, min : �ּ� �� ��ȯ
-- avg : ��� �� ���, sum : �� �հ� ���
-- variance : �л��� ���, stddev : ǥ������ ���

-- ����_1
select max(salary), min(salary), trunc(avg(salary),0), sum(salary)
from employees;

-- ����_2
select count(*)
from employees
--where commission_pct is null;
where nvl(commission_pct, 0) = 0;

-- ����_3
select count( DISTINCT nvl2(department_id, department_id, 0)) 
--select count( DISTINCT nvl(department_id, 0)) 
from employees;

-- �ǽ�_1
select manager_id, avg(salary), variance(salary), stddev(salary)
from employees
where department_id = 50
group by manager_id;

-- �ǽ�_2
SELECT job_id,count(job_id)
FROM employees
WHERE MONTHS_BETWEEN(SYSDATE, hire_date) >= 72
GROUP BY job_id;

-- �ǽ�_3
select department_id, round(avg(salary),0)
from employees
where department_id != 100
group by department_id
having avg(salary) >= 7000;

-- �ǽ�_4
select job_id, department_id, sum(salary)
from employees
where department_id in (20, 50, 80, 90)
group by job_id, department_id;

SELECT job_id, department_id, sum(salary)
FROM employees
GROUP BY job_id, department_id
HAVING department_id IN(20, 50, 80 , 90); 

-- �ǽ�_5
select department_id, count(department_id)
from employees
group by department_id
having count(department_id) >= 4;

----------------
