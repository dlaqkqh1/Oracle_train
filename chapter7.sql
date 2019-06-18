-- 계층형 쿼리
select department_id, lpad(' ', 3 * (level-1)) || department_name, level
from departments
start with parent_id is null -- 최상위 계층의 로우를 식별하는 조건
connect by prior department_id = parent_id; -- 구조가 어떤 식으로 연결되는지를 기술하는 부분

select department_id, lpad(' ', 3 * (level-1)) || department_name, level
from departments
start with parent_id is null
connect by prior department_id = parent_id
order by department_name; -- 계층형 쿼리에서 order by 절을 사용하면 계층형 구조가 사라진다.

select department_id, lpad(' ', 3 * (level-1)) || department_name, level
from departments
start with parent_id is null
connect by prior department_id = parent_id
order siblings by department_name; -- order siblings by 절을 이용하면 레벨이 같은 로우에 한해서 정렬이 수행된다.

/*
connect_by_root 컬럼명 -> 최상위 계층의 값 출력
connect_by_isleaf -> 최하위 계층이면 1을 아니면 0을 반환
sys_connect_by_path(colm, char) -> 최상위 계층부터 현재 계층의 값까지 구분 문자로 구분해서 출력
컬럼 값에 포함된 문자는 구분자로 사용할 수 없다.
connect_by_iscycle -> 현재 로우에서 루프가 발생하면 1을 아니면 0을 반환
*/

-- connect by로 예제 데이터 생성
create table ex7_1 as
select rownum seq, 
    '2014' || lpad(ceil(rownum/1000), 2, '0') month,
    round(dbms_random.value(100, 1000)) amt
from dual
connect by level <= 12000;

select * from ex7_1;