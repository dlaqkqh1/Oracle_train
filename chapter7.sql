-- ������ ����
select department_id, lpad(' ', 3 * (level-1)) || department_name, level
from departments
start with parent_id is null -- �ֻ��� ������ �ο츦 �ĺ��ϴ� ����
connect by prior department_id = parent_id; -- ������ � ������ ����Ǵ����� ����ϴ� �κ�

select department_id, lpad(' ', 3 * (level-1)) || department_name, level
from departments
start with parent_id is null
connect by prior department_id = parent_id
order by department_name; -- ������ �������� order by ���� ����ϸ� ������ ������ �������.

select department_id, lpad(' ', 3 * (level-1)) || department_name, level
from departments
start with parent_id is null
connect by prior department_id = parent_id
order siblings by department_name; -- order siblings by ���� �̿��ϸ� ������ ���� �ο쿡 ���ؼ� ������ ����ȴ�.

/*
connect_by_root �÷��� -> �ֻ��� ������ �� ���
connect_by_isleaf -> ������ �����̸� 1�� �ƴϸ� 0�� ��ȯ
sys_connect_by_path(colm, char) -> �ֻ��� �������� ���� ������ ������ ���� ���ڷ� �����ؼ� ���
�÷� ���� ���Ե� ���ڴ� �����ڷ� ����� �� ����.
connect_by_iscycle -> ���� �ο쿡�� ������ �߻��ϸ� 1�� �ƴϸ� 0�� ��ȯ
*/

-- connect by�� ���� ������ ����
create table ex7_1 as
select rownum seq, 
    '2014' || lpad(ceil(rownum/1000), 2, '0') month,
    round(dbms_random.value(100, 1000)) amt
from dual
connect by level <= 12000;

select * from ex7_1;