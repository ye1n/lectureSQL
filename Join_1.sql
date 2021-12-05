-- ����1 ���� ��� ����

-- 2. � ����, �� ����
-- � ���� ����
select employee_id �����ȣ, first_name �̸�, e.department_id  �μ���ȣ1,
        d.department_id �μ���ȣ2, department_name �μ��̸�
from employees e, departments d
where e.department_id = d.department_id;

select location_id, employee_id �����ȣ, first_name �̸�, e.department_id �μ���ȣ,
        department_name �μ��̸�
from employees e, departments d
where e.department_id = d.department_id
and location_id = 1700;

-- �����ȣ, �����, �μ���, ���ø��� �˻��Ѵ�. (employees, departments, locations)
select employee_id, first_name, d.department_name, city
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id;

-- ������ ����
select employee_id, first_name, salary, grade
from employees, salarygrade
where salary between losalary and hisalary;

-- 3. ��ü ����(self join)
select e1.employee_id �����ȣ, e1.first_name ����̸�, e1.manager_id ����ȣ,
        e2.employee_id �������ȣ, e2.first_name ����̸�
from employees e1, employees e2
where e1.manager_id = e2.employee_id;

-- 4. �ܺ� ����(outer join) - ��������
select d.department_id �μ���ȣ, department_name �μ���, first_name �����
from departments d, employees e
where d.department_id = e.department_id
order by 1 desc;

select d.department_id �μ���ȣ, department_name �μ���, first_name �����
from departments d, employees e
where d.department_id (+) = e.department_id
order by 1 desc;

select d.department_id �μ���ȣ, department_name �μ���, first_name �����
from departments d, employees e
where d.department_id = e.department_id (+)
order by 1 desc;

-- ����1 �ǽ��ϱ�
-- 1. �޿��� 10000�̻��� ����� �� ����� ���ϴ� �μ��� �̸��� �̻��Ѵ�.
select first_name, salary, department_name
from employees e, departments d
where e.department_id = d.department_id
and salary >= 10000;

-- 2. �� �μ��� ��ġ�ϰ� �ִ� ������ �̸��� �˻��Ѵ�.
select department_name �μ�, city ����
from departments d, locations l
where d.location_id = l.location_id;

-- 3. ���� 'Toronto', 'Munich'�� ��ġ�� �μ����� �̸��� �˻��Ѵ�.
select city, department_name �μ���
from departments d, locations l
where d.location_id = l.location_id
and city in ('Toronto', 'Munich');

-- 4. �� �μ��� ������ �˻��Ѵ�.
select first_name, department_name, d.manager_id
from employees e, departments d
where e.manager_id(+) = d.manager_id;

-- 5. ��� �߿��� �ڽ��� ��纸�� �޿��� ���� ����� �޿� ������ �˻��Ѵ�.
select e1.first_name, e1.salary, e2.first_name, e2.salary 
from employees e1, employees e2
where e1.manager_id = e2.employee_id
and e1.salary > e2.salary;

-- 6. ��� �߿��� �̸��� ������ �����ȣ�� �ٸ� ���������� �˻��Ѵ�.
select distinct e1.first_name, e1.employee_id
from employees e1, employees e2
where e1.first_name = e2.first_name
and e1.employee_id <> e2.employee_id;

