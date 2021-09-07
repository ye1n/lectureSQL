select * 
    from locations;

select * 
    from regions;

--    크로스 (교차) 조인
select * 
    from locations, regions;
--    23행 * 4행 = 92행
    
--    등가 조인과 비등가 조인
--    사원번호, 사원명, 부서명을 검색한다 (ERD이용)
    select
        e.department_id, 
        e.first_name, 
        d.department_name 
    from employees e, departments d
    where e.department_id = d.department_id;
    
--    부서 위치 ID가 1700이고, 사원번호, 사원명, 부서명을 검색한다 (ERD이용)
    select
        e.department_id, 
        e.first_name, 
        d.department_name,
        d.location_id
    from employees e, departments d
    where e.department_id = d.department_id
    and location_id = 1700;
    
--    사원번호, 사원명, 부서명, 도시명을 검색한다 (ERD이용)
    select
        e.department_id, 
        e.first_name, 
        d.department_name,
        d.location_id,
        l.city
    from employees e, departments d, locations l
    where e.department_id = d.department_id
    and l.location_id = d.location_id;
    
--    salarygrade 테이블 생성
    CREATE TABLE HR.SALARYGRADE 
        (GRADE NUMBER NOT NULL ENABLE PRIMARY KEY, 
        LOSALARY NUMBER(8,2), 
        HISALARY NUMBER(8,2));
        
    drop TABLE HR.SALARYGRADE;
        
--     데이터 입력
    INSERT INTO SALARYGRADE (GRADE, LOSALARY, HISALARY) VALUES ('1', '0', '5000');
    INSERT INTO SALARYGRADE (GRADE, LOSALARY, HISALARY) VALUES ('2',   '5001',  '10000');
    INSERT INTO SALARYGRADE (GRADE, LOSALARY, HISALARY) VALUES ('3',  '10001',  '15000');
    
    select * from salarygrade;

    