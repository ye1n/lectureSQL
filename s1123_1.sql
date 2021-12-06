
-- �� �μ��� �ִ� �޿��� �޴� ����� �μ��ڵ�, �̸�, �޿��� ���(�μ��ڵ� ������� ��������)
select department_id, first_name, salary
from employees e1
where (e1.department_id, e1.salary) in (select department_id, max(salary)
                                        from employees
                                       group by department_id)
order by e1.department_id;

-- �� Ŀ���� ��� Ŀ���� �ٲپ� ���ÿ�. ���� ���� �߿� !!! !!
select department_id, first_name, salary
from employees e1
where salary = (select max(salary) from employees e2
                where e1.department_id = e2.department_id)
order by department_id;

-- employees ���̺��� �޿��� ������� 5���� ���
select first_name, salary
from employees e1
where 5 > (select count(*) from employees e2
            where e2.salary > e1.salary)
order by salary desc;

-- ����� �Ѹ��̶� �ִ� �μ��� ���
-- ��� 1
select department_name
from departments d
where EXISTS (select 1 from employees
            where department_id = d.department_id);
--  ��� 2            
select department_name
from departments d
where 1 <= (select count(department_id) 
            from employees e
            where e.department_id = d.department_id);

-- ����� �Ѹ��̶� ���� �μ��� ���
select department_name
from departments d
where NOT EXISTS (select 1 from employees
            where department_id = d.department_id);

select 1
from dual;

select first_name, last_name
from employees
order by 1;

-- �ǽ��ϱ� 1
-- Allan�� �޿��� ���� ������� �˻��Ѵ�.
select department_id, salary
from employees
where salary = (select salary
                        from employees
                        where first_name = 'Allan')
AND first_name <> 'Allan';

-- 100�� �μ��� ����麸�� �Ի簡 ���� ������� ������ �˻��Ѵ�.
select first_name, hire_date
from employees
where hire_date > ALL(select hire_date
                        from employees
                        where department_id = 100)
AND department_id <> 100;

-- �� �μ����� �μ��� ��� �޿��� ���� �޿��� �޴� ������� ������ �˻��Ѵ�.
select department_id, employee_id, first_name, salary
from employees
where (department_id, salary) IN (select department_id, round(avg(salary))
                                    from employees
                                    group by department_id);
                                    
-- �� �μ����� �޿��� ���� ��� 2�� ����Ѵ�.
select department_id, first_name, salary �޿�
from employees A
where 2 > (select count(*)
            from employees
            where salary > A.salary
            and department_id = a.department_id)
order by department_id, salary desc;