
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
-- length(���ڿ� �Ǵ� �÷���) : ���ڿ� ���� ��ȯ
-- instr(���ڿ�, �˻�����, ���۹���, Ƚ��) : ������ ������ ��ġ�� ��ȯ 
-- ltrim(���ڿ� �Ǵ� �÷���, '������ ����'), ltrim(���ڿ� �Ǵ� �÷���, '������ ����') : ������ ���� ����
-- lpad(���ڿ� �Ǵ� �÷���, �ڸ���, 'ä�﹮��'), rpad(���ڿ� �Ǵ� �÷���, �ڸ���, 'ä�﹮��') : ���鿡 Ư���� ���� ä���

----------------

