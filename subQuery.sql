-- SQL09. ��������

-- 1. ��������(Sub Query)��?
-- ���� �� ���� ���� : ���� ������ �ϳ��� �÷����� �ϳ��� ���� �˻��Ѵ�.
-- ���� �� ���� ���� : ���� ������ �ϳ��� �÷����� ���� ���� ���� �˻��Ѵ�.
-- ���� �� ���� ���� : ���� ������ ���� ���� ���� �˻��Ѵ�.


-- 2. ���� �� ���� ����

select salary -- 11000
from employees
where last_name ='Abel';

select last_name, salary
from employees 
-- where salary > 11000
where salary > (select salary
                from employees
                where last_name ='Abel');
                
-- ���� �� ���� ���� ����
select last_name, salary
from employees
where salary > (select salary
                from employees);
-- ���� �� �����ڸ� ��� �� ���� �ݵ�� ��� ���� �� ���� �˻��Ǿ�� �Ѵ�.

-- ���� �� ���� ���� �� ���� ����
select employee_id, last_name, department_id, salary
from employees
where department_id != (select department_id
                        from employees
                        where last_name = 'Hunold')
and salary < (select salary
            from employees
            where last_name = 'Hunold');

-- HAVING���� ����� ���� ����
select department_id, min(salary)
from employees
where department_id is not null
group by department_id
having min(salary) > (select min(salary)
                        from employees
                        where department_id = 50);

-- �μ��� �޿��� ��� �߿��� ���� ���� �μ��� �˻��Ѵ�.
select department_id, max(avg(salary))
from employees
group by department_id; -- not a single-group group function

select department_id
from employees
group by department_id
having avg(salary) = (select max(avg(salary))
                        from employees
                        group by department_id);

-- ���� ������ ����Ͽ� �����ϱ�
select employee_id, first_name
from employees A
join departments B on A.department_id = B.department_id
and department_name = 'IT';

select employee_id, first_name
from employees
join departments using (department_id)
where department_name = 'IT';

-- 3. ���� �� ���� ����

--IN �����ڸ� ����� ���� �� ���� ����
select manager_id
from employees
where department_id = '20'; --100,201
                    
select employee_id, first_name, salary, department_id
from employees
where manager_id in (select manager_id
                    from employees
                    where department_id = '20')
and department_id <> '20';

--ANY �����ڸ� ����� ���� �� ���� ����
select salary
from employees
where job_id = 'ST_MAN'; -- 8000, 8200, 7900, 6500, 5800
                    
select employee_id, last_name, job_id, salary
from employees
where salary < any (select salary
                    from employees
                    where job_id = 'ST_MAN');

--ALL �����ڸ� ����� ���� �� ���� ����
select salary
from employees
where job_id = 'ST_MAN'; -- 8000, 8200, 7900, 6500, 5800
                    
select employee_id, last_name, job_id, salary
from employees
where salary < all (select salary
                    from employees
                    where job_id = 'ST_MAN')
and job_id <> 'ST_MAN';

-- 4. ���� �� ���� ����
select employee_id, last_name, job_id, salary
from employees
where (manager_id, job_id) in (select manager_id, job_id
                                from employees
                                where first_name='Bruce')
and first_name <> 'Bruce';

-- �� ������ ���� ������ �ٲٱ�

-- �� �μ��� �ּ� �޿��� �޴� ����� ������ �˻��Ѵ�.
select *
from employees
where (department_id, salary) in (select department_id, min(salary)
                                    from employees
                                    group by department_id);

-- 5. �������(currelated sub query)

-- �� �μ��� �ִ� �޿��� �޴� ����� �μ��ڵ�, �̸�, �޿��� ���(�μ��ڵ� ������ ��������)
select department_id, first_name, salary
from employees
where (department_id, salary) in (select department_id, max(salary)
            from employees
            group by department_id)
order by department_id;

-- �� Ŀ���� ��� Ŀ���� �ٲپ� ���ÿ�.
select department_id, first_name, salary
from employees e1
where salary = (select max(salary)
            from employees e2
            where e1.department_id = e2.department_id)
order by department_id;

-- EXISTS, NOT EXISTS

-- �� �μ��� �ִ� �޿��� �޴� ����� �μ��ڵ�, �̸�, �޿��� ���(�μ��ڵ� ������ ��������)


-- EMP ���̺��� �޿��� ���� ��� 5���� ���


-- ����� �Ѹ��̶� �ִ� �μ��� ���


-- ����� �Ѹ� ���� �μ��� ���

