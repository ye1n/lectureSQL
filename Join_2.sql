-- ������ SQL08. ����2 ����

-- 1. �ڿ� ����(Natural Join)
select department_id �μ���ȣ, department_name �μ��̸�, location_id ������ȣ, city ����
from departments
NATURAL JOIN locations
where city = 'Seattle';

select employee_id �����ȣ, first_name �̸�,
        d.department_id �μ���ȣ, department_name �μ���
from employees e, departments d
where e.department_id = d.department_id;

select employee_id �����ȣ, first_name �̸�,
    department_id �μ���ȣ, department_name �μ���
from employees
NATURAL JOIN departments;

-- 2. USING ���� ����� ����
select employee_id �����ȣ, first_name �̸�,
        department_id �μ���ȣ, department_name �μ���
from employees
join departments using (department_id);

select department_name, city, country_name
from departments
join locations using(location_id)
join countries using(country_id);

-- 3. ON ���� ����� ����
select employee_id �����ȣ, first_name �̸�,
        departments.department_id �μ���ȣ, department_name �μ���
from employees
join departments on employees.department_id = departments.department_id;

-- �˻� ���� �� ���� ���� ���
select department_id �μ���ȣ, department_name �μ��̸�, d.location_id ������ȣ, city ����
from departments d
join locations l ON d.location_id = l.location_id
where city = 'Seattle';

select department_id �μ���ȣ, department_name �μ��̸�, location_id ������ȣ, city ����
from departments d
join locations l using (location_id)
where city = 'Seattle';

select department_id �μ���ȣ, department_name �μ��̸�, d.location_id ������ȣ, city ����
from departments d
join locations l ON d.location_id = l.location_id
                and city = 'Seattle';

-- �� � ���� ���
-- ���� ..

-- ON ���� ����� ���� ���� (�����ȣ, �����, ����ȣ, ������ �˻��Ѵ�)
select e1.employee_id �����ȣ, e1.first_name �����, e2.manager_id ����ȣ, e2.first_name ����
from employees e1
join employees e2 on e1.manager_id = e2.employee_id;

-- 4. �ܺ� ����(Outer Join) - left, right, full
-- left : ���� ���̺��� �����ʹ� ��� �˻��� ���Եȴ�.
-- right : ������ ���̺��� �����ʹ� ��� �˻��� ���Եȴ�.
-- full : ���� ���̺��� �����ʹ� ��� �˻��� ���Եȴ�.

select last_name, department_id, department_name
from employees e
left join departments d using (department_id);

select last_name, department_id, department_name
from employees e
right join departments d using (department_id);

select last_name, department_id, department_name
from employees e
full join departments d using (department_id);

-- 5. ũ�ν� ����(Cross Join) - īƼ�� ��
select *
from departments; -- 27

select *
from locations; -- 23

select *
from departments
cross join locations; -- 621

-- ���� 2 �ǽ��ϱ�
-- 1. �޿��� 10000�̻��� ����� �� ����� ���ϴ� �μ��� �̸��� �˻��Ѵ�.
select first_name �̸�, salary �޿�, department_name �μ���
from employees
join departments using (department_id) 
where salary >= 10000;

-- 2. �� �μ��� ��ġ�ϰ� �ִ� ������ �̸��� �˻��Ѵ�.
select department_name �μ���, city ���ø�
from departments
join locations using (location_id);

-- 3. ���� 'Toronto','Munich'�� ��ġ�� �μ����� �̸��� �˻��Ѵ�.
select city ���ø�, department_name �μ���
from departments
join locations using (location_id)
where city in ('Toronto','Munich');

-- 4. �� �μ��� ������ �˻��Ѵ�
select department_name �μ���, first_name ����
from departments d
join employees e on d.manager_id = e.employee_id;

-- 5. ��� �߿��� �ڽ��� ��纸�� �޿��� ���� ����� �޿� ������ �˻��Ѵ�.
select e1.first_name ���, e1.salary ����޿�, e2.first_name ���, e2.salary ���޿�
from employees e1
join employees e2 on e1.employee_id = e2.manager_id
where e1.salary > e2.salary;

select e1.first_name ���, e1.salary ����޿�, e2.first_name ���, e2.salary ���޿�
from employees e1
join employees e2 on e1.manager_id = e2.employee_id
where e1.salary > e2.salary;

-- 6. ��� �߿��� �̸��� ������ �����ȣ�� �ٸ� ���������� �˻��Ѵ�.
select e1.first_name ���1, e1.employee_id �����ȣ1, e2.first_name ���2, e2.employee_id �����ȣ2
from employees e1
join employees e2 on e1.first_name = e2.first_name and e1.employee_id <> e2.employee_id;
