-- 1�� ����
select hire_year, count(*)
from (select to_char(hire_date, 'yyyy') hire_year
    from employees)
group by hire_year
order by 1;

-- 2�� ����