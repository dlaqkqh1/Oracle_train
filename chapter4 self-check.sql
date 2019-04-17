-- 1번 문제
select lpad(substr(phone_number, 4), 13, '(02)') 
from employees;

-- 2번 문제
select employee_id 사원번호, emp_name 사원명, hire_date 입사일자, 근속년수 
from (select employee_id, emp_name, hire_date, 
    round(months_between(sysdate, hire_date) / 12) 근속년수
from employees)
where 근속년수 >= 10
order by 4;

-- 3번 문제
select replace(cust_main_phone_number, '-', '/')
from customers;

-- 4번 문제
select translate(cust_main_phone_number, '0123456789', '0937685124')
from customers;

-- 5번 문제
select cust_year_of_birth 출생년도,
    decode(연령, 5, '50대',
                4, '40대',
                3, '30대',
                   '기타') 연령대
from (select cust_year_of_birth, trunc((to_char(sysdate, 'yyyy') - cust_year_of_birth) / 10) 연령
    from customers);
    
-- 6번 문제
select cust_year_of_birth 출생년도,
    case when 연령 = 5 then '50대'
         when 연령 = 4 then '40대'
         when 연령 = 3 then '30대'
         else '기타'
    end 연령대
from (select cust_year_of_birth, trunc((to_char(sysdate, 'yyyy') - cust_year_of_birth) / 10) 연령
    from customers);