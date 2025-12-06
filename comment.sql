create or replace procedure p1(inp1 in nnumber,inp out sys_refcursor)
begin
open inp for 
select emp_id, emp_name from emp 
where dept_id = inp1;
end;
/