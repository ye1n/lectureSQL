select * 
    from locations;

select * 
    from regions;

--    ũ�ν� (����) ����
select * 
    from locations, regions;
--    23�� * 4�� = 92��
    
--    � ���ΰ� �� ����
--    �����ȣ, �����, �μ����� �˻��Ѵ� (ERD�̿�)
    select
        e.department_id, 
        e.first_name, 
        d.department_name 
    from employees e, departments d
    where e.department_id = d.department_id;
    
--    �μ� ��ġ ID�� 1700�̰�, �����ȣ, �����, �μ����� �˻��Ѵ� (ERD�̿�)
    select
        e.department_id, 
        e.first_name, 
        d.department_name,
        d.location_id
    from employees e, departments d
    where e.department_id = d.department_id
    and location_id = 1700;
    
--    �����ȣ, �����, �μ���, ���ø��� �˻��Ѵ� (ERD�̿�)
    select
        e.department_id, 
        e.first_name, 
        d.department_name,
        d.location_id,
        l.city
    from employees e, departments d, locations l
    where e.department_id = d.department_id
    and l.location_id = d.location_id;
    
--    salarygrade ���̺� ����
    CREATE TABLE HR.SALARYGRADE 
        (GRADE NUMBER NOT NULL ENABLE PRIMARY KEY, 
        LOSALARY NUMBER(8,2), 
        HISALARY NUMBER(8,2));
        
    drop TABLE HR.SALARYGRADE;
        
--     ������ �Է�
    INSERT INTO SALARYGRADE (GRADE, LOSALARY, HISALARY) VALUES ('1', '0', '5000');
    INSERT INTO SALARYGRADE (GRADE, LOSALARY, HISALARY) VALUES ('2',   '5001',  '10000');
    INSERT INTO SALARYGRADE (GRADE, LOSALARY, HISALARY) VALUES ('3',  '10001',  '15000');
    
    select * from salarygrade;

    