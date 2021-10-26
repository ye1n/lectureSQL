-- 10/26 ���� ����

select *
from locations, regions; -- 23 * 4 ==> 92

select *
from locations cross join regions;

select first_name �̸�, e.department_id, d.department_name, department_name �μ���
from employees e join departments d
on e.department_id = d.department_id;

select first_name �̸�, department_id, department_name �μ���
from employees e join departments d
using (department_id);

select department_name �μ���, city ���ø�
from departments d join locations l
on d.location_id = l.location_id;

select department_name �μ���, location_id, city ���ø�
from departments d join locations l
using (location_id);

select l.city, d.department_name
from departments d join locations l
on d.location_id = l.location_id
where l.city in ('Toronto', 'Munich');

select l.city, d.department_name
from departments d join locations l
on d.location_id = l.location_id
where l.city in ('Toronto', 'Munich', 'Seattle');

select department_name, first_name
from departments d join employees e
on d.department_id = e.department_id
where d.manager_id = e.employee_id;

select department_name, first_name
from departments d join employees e
on d.department_id = e.department_id
where d.manager_id = e.employee_id
order by d.department_name desc;

select department_name, first_name
from departments d join employees e
on d.manager_id = e.employee_id
order by d.department_name desc;

select A.first_name ���, A.salary ����޿�, B.first_name ���, B.salary ���޿�
from employees A join employees B
on A.manager_id = B.employee_id
and A.salary > B.salary;

select A.employee_id �����ȣ1, B.employee_id �����ȣ2, A.first_name
from employees A join employees B
on A.first_name = B.first_name
and A.employee_id != B.employee_id;


-- ��������

select salary
from employees
where last_name = 'Abel';

select last_name, salary
from employees
where salary > 11000;

select last_name, salary
from employees
where salary > ( select salary
from employees
where last_name = 'Abel');

select last_name, salary
from employees
where salary >= (select max(salary)
                from employees);
                
-- 10/26 ����

SELECT first_name �̸�, department_name �μ��̸�, salary �޿�
FROM employees
JOIN departments USING (department_id)
WHERE salary > = 10000;

SELECT department_name �μ���,city ���ø�
FROM departments
JOIN locations USING (location_id);

SELECT city ���ø�, department_name �μ���
FROM departments
JOIN locations USING (location_id)
WHERE city IN ('Toronto','Munich');

SELECT department_name �μ�, first_name ����
FROM employees A JOIN departments B
on A.employee_id = B.manager_id;

SELECT A.first_name ���, A.salary ����޿�, B.first_name ���,
B.salary ���޿�
FROM employees A
JOIN employees B ON A.manager_id = B.employee_id
AND A.salary > B.salary;

SELECT A.employee_id �����ȣ1, B.employee_id �����ȣ2,
A.first_name �̸�1, B.first_name �̸�2
FROM employees A
JOIN employees B ON A.first_name = B.first_name
AND A.employee_id <> B.employee_id;
                