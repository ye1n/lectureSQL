
--11�� 16�� ���� ���� ����

select last_name, salary 
from employees
where salary > (select salary
                from employees
                where last_name = 'Abel');

-- �̿ϼ�
select *
from departments
where department_id > (select department_id
                from employees
                where last_name = 'Abel');
                
-- 20�� �μ��� �ٹ��ϴ� ����� �����ڰ� �����ϴ� �ٸ� �μ��� ��� �˻�
select employee_id, first_name
from employees
where manager_id IN
(select manager_id
from employees
where department_id = 20);

-- �����ڵ尡 'ST_MAN'�� ����� �޿� �� �ϳ����� ���� �޿��� �޴� ��� �˻�
select salary, first_name
from employees
where salary < any
(select salary
from employees
where job_id = 'ST_MAN');

-- �̸��� 'Bruce'�� ����� �����ڵ�, ����ȣ�� ���� ��� �̻� (�̸��� 'Bruce'�� ��� ����)
select employee_id, first_name, last_name, job_id, salary, manager_id
from employees
where (manager_id, job_id) IN (select manager_id, job_id
                                from employees
                                where first_name = 'Bruce')
and first_name <> 'Bruce';

-- �̰� ���� ��
select *
from employees A
where (A.job_id, A.salary) IN (
    select job_id, MIN(salary)
    from employees
    group by job_id)
order by A.salary desc;
                
