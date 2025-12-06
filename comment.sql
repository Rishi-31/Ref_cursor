create or replace procedure p1(inp1 in nnumber,dept_name in varchar,inp out sys_refcursor)
begin
open inp for 
select emp_id, emp_name from emp 
where dept_id = inp1 and dept_name = dept_name;
end;
/
