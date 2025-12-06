create or replace procedure p1(inp1 in nnumber,dept_name in varchar,inp out sys_refcursor,pay in number)
declare
sal varchar;
begin
sal:= fun1(pay);
open inp for 
select emp_id, emp_name from emp 
where dept_id = inp1 and dept_name = dept_name;
end;
/
create or replace function fun1(salary in number)
return number
is begin
return round((salary+1000),4)
end;
/