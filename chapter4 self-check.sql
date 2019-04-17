-- 1�� ����
select lpad(substr(phone_number, 4), 13, '(02)') 
from employees;

-- 2�� ����
select employee_id �����ȣ, emp_name �����, hire_date �Ի�����, �ټӳ�� 
from (select employee_id, emp_name, hire_date, 
    round(months_between(sysdate, hire_date) / 12) �ټӳ��
from employees)
where �ټӳ�� >= 10
order by 4;

-- 3�� ����
select replace(cust_main_phone_number, '-', '/')
from customers;

-- 4�� ����
select translate(cust_main_phone_number, '0123456789', '0937685124')
from customers;

-- 5�� ����
select cust_year_of_birth ����⵵,
    decode(����, 5, '50��',
                4, '40��',
                3, '30��',
                   '��Ÿ') ���ɴ�
from (select cust_year_of_birth, trunc((to_char(sysdate, 'yyyy') - cust_year_of_birth) / 10) ����
    from customers);
    
-- 6�� ����
select cust_year_of_birth ����⵵,
    case when ���� = 5 then '50��'
         when ���� = 4 then '40��'
         when ���� = 3 then '30��'
         else '��Ÿ'
    end ���ɴ�
from (select cust_year_of_birth, trunc((to_char(sysdate, 'yyyy') - cust_year_of_birth) / 10) ����
    from customers);