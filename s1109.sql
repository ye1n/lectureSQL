-- ���� ����

--���� Adel�� ������� �޿��� ���� ����� ���� ���

select *
from employees
where salary > (select salary from employees where last_name = 'Abel');

-- �μ����� 'IT' �� ����� ����

select *
from departments d join employees e
on d.department_id = e.department_id
where d.department_name = 'IT';

select *
from employees
where d.department_id = (
    select department_id
    from departments
    where department_name = 'IT' );
    
-- ���� 'hunold'�� ������� �޿��� ���� �μ��� �ٸ� ��� �˻�



-- 50�� �μ��� ���� �޿����� ���� �μ��� ���� �޿� �˻�

select department_id, min(salary)
from employees 
where department_id is not null
group by department_id
having min(salary) > (
    select min(salary)
    from employees
    where department_id = 50);

-- �μ��� �޿� ����� ���� ���� �μ� �˻�

select department_name
from departments
where department_id =
    ( select department_id
    from employees
    group by department_id
    having avg(salary) = ( select max(avg(salary))
        from employees
        group by department_id ));
        
-- 20�� �μ��� �ٹ��ϴ� ����� �����ڰ� �����ϴ� �ٸ� �μ��� ��� �˻�

select employee_id, first_name, salary, department_id
from employees
where manager_id in ( select manager_id
                    from employees
                    where department_id = '20')
and department_id <> '20';

-- 20��, 80���� ������ X
select employee_id, first_name, salary, department_id
from employees
where manager_id in ( select manager_id
                    from employees
                    where department_id in (20, 80))
and department_id not in (20, 80);

-- �����ڵ尡 'ST_MAN' �� ����� �޿����� ���� �޿��� �޴� ��� �˻�

select employee_id, last_name, job_id, salary
from employees
where salary < any (
    select salary
    from employees
    where job_id = 'ST_MAN')
and job_id <> 'ST_MAN';
