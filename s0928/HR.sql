
--�μ��� ���� ��� ���

SELECT d.department_id �μ���ȣ, department_name �μ���, first_name �����
    FROM departments d, employees e
    WHERE d.department_id = e.department_id
    ORDER BY 1 DESC;

--right outer join 2���� ���

select d.department_id �μ���ȣ, department_name �μ���, first_name �����
    from departments d, employees e
    where d.department_id(+) = e.department_id
    order by d.department_id desc;

select d.department_id �μ���ȣ, department_name �μ���, first_name �����
    from departments d right outer join employees e
    on d.department_id = e.department_id
    order by d.department_id desc;

--left outer join 2���� ���

select d.department_id �μ���ȣ, department_name �μ���, first_name �����
    from departments d, employees e
    where d.department_id = e.department_id(+)
    order by d.department_id desc;
    
select d.department_id �μ���ȣ, department_name �μ���, first_name �����
    from departments d left outer join employees e
    on d.department_id = e.department_id
    order by d.department_id desc;

--1. �޿��� 10000 �̻��� ����� �� ����� ���ϴ� �μ��� �̸��� �˻��Ѵ�.

select e.first_name �����, e.salary �޿�, d.department_name �μ���
    from employees e , departments d
    where d.department_id = e.department_id
    and e.salary >= 10000
    order by e.salary desc;
    
--2. �� �μ��� ��ġ�ϰ� �ִ� ������ �̸��� �˻��Ѵ�.

select d.department_name, l.city
    from departments d, locations l
    where d.location_id = l.location_id;
    
select d.department_name, l.city
    from departments d, locations l
    where d.location_id(+) = l.location_id;
    
select d.department_name, l.city
    from departments d right outer join locations l
    on d.location_id = l.location_id;

--3. ���� 'Toronto', 'Munich' �� ��ġ�� �μ����� �̸��� �˻��Ѵ�.

select d.department_name, l.city
    from departments d inner join locations l
    on d.location_id = l.location_id
    where l.city in ('Toronto', 'Munich');
    
select d.department_name, l.city
    from departments d, locations l
    where d.location_id = l.location_id
    and l.city in ('Toronto', 'Munich');

--4. �� �μ��� ����(������, �Ŵ���)�� �˻��Ѵ�.

select d.department_name �μ��̸�, e.first_name ������
from departments d, employees e
where d.manager_id = e.employee_id;

--5. ��� �߿��� �ڽ��� ��纸�� �޿��� ���� ����� �޿� ������ �˻��Ѵ�.

select e.first_name �����, e.salary ����޿�, m.first_name ����, m.salary "��� �޿�"
from employees e, employees m
where e.manager_id = m.employee_id
and e.salary > m.salary;

select e.first_name �����, e.salary ����޿�, m.first_name ����, m.salary "��� �޿�"
from employees e inner join employees m
on e.manager_id = m.employee_id
where e.salary > m.salary;
    
--6. ����߿��� �̸��� ������ �����ȣ�� �ٸ� ���������� �˻��Ѵ�.

select e1.first_name, e1.employee_id, e2.first_name, e2.employee_id
from employees e1, employees e2
where e1.first_name = e2.first_name
and e1.employee_id <> e2.employee_id
order by 1, 2, 4;
    