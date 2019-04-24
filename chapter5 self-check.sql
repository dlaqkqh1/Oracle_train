-- 1�� ����
select hire_year, count(*)
from (select to_char(hire_date, 'yyyy') hire_year
    from employees)
group by hire_year
order by 1;

-- 2�� ����
select PERIOD, REGION, SUM(LOAN_JAN_AMT) 
from kor_loan_status
GROUP BY GROUPING SETS (PERIOD, REGION);

-- 3�� ����
SELECT PERIOD, GUBUN, SUM(LOAN_JAN_AMT) TOTL_JAN
FROM KOR_LOAN_STATUS
WHERE PERIOD LIKE '2013%'
GROUP BY GROUPING SETS (PERIOD, (PERIOD, GUBUN), null);

-- 4�� ����
SELECT PERIOD,
    CASE WHEN GUBUN = '���ô㺸����' THEN SUM(LOAN_JAN_AMT) ELSE 0 END ���ô㺸�����,
    CASE WHEN GUBUN = '��Ÿ����' THEN SUM(LOAN_JAN_AMT) ELSE 0 END ��Ÿ�����
FROM KOR_LOAN_STATUS
WHERE PERIOD = '201311'
GROUP BY PERIOD, GUBUN;

-- ��°���� ���� �����ڸ� �̿��ؼ� ������ ����� ����ϴ� ����
SELECT PERIOD, 0 AS ���ô㺸�����, SUM(LOAN_JAN_AMT) ��Ÿ�����
FROM KOR_LOAN_STATUS
WHERE PERIOD = '201311' AND GUBUN = '���ô㺸����'
GROUP BY PERIOD
UNION
SELECT PERIOD, SUM(LOAN_JAN_AMT) ���ô㺸�����, 0 AS ��Ÿ�����
FROM KOR_LOAN_STATUS
WHERE PERIOD = '201311' AND GUBUN = '���ô㺸����'
GROUP BY PERIOD
ORDER BY 2 DESC;

-- 5������
SELECT REGION, PERIOD, SUM(LOAN_JAN_AMT)
FROM KOR_LOAN_STATUS
GROUP BY REGION, PERIOD;