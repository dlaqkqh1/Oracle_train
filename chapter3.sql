CREATE TABLE EX3_3 (
    EMPLOYEE_ID NUMBER,
    BONUS_AMT NUMBER DEFAULT 0
);

INSERT INTO EX3_3 (EMPLOYEE_ID)
SELECT E.EMPLOYEE_ID
    FROM EMPLOYEES E, SALES S
    WHERE E.EMPLOYEE_ID = S.EMPLOYEE_ID
    AND S.SALES_MONTH BETWEEN '200010' AND '200012'
    GROUP BY E.EMPLOYEE_ID;
    
select * from ex3_3;

select employee_id, manager_id, salary, salary * 0.001
from employees
where employee_id not in (select employee_id from ex3_3)
and manager_id = 146;

merge into ex3_3 d
    using (select employee_id, salary, manager_id
            from employees
            where manager_id = 146) b
        on (d.employee_id = b.employee_id)
    when matched then
        update set d.bonus_amt = d.bonus_amt + b.salary * 0.01
    when not matched then
        insert (d.employee_id, d.bonus_amt) values (b.employee_id, b.salary * 0.001)
        where (b.salary < 8000);

TRUNCATE table ex3_3;

select partition_name
    from user_tab_partitions;