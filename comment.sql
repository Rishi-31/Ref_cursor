CREATE OR REPLACE FUNCTION fun1 (salary IN NUMBER)
RETURN NUMBER
IS
BEGIN
   RETURN ROUND(salary + 1000, 4);
END;
/

CREATE OR REPLACE PROCEDURE p1 (
    p_dept_id     IN NUMBER,
    p_dept_name   IN VARCHAR2,
    p_cursor      OUT SYS_REFCURSOR,
    p_pay         IN NUMBER
)
IS
    sal NUMBER;
BEGIN
    sal := fun1(p_pay);

    OPEN p_cursor FOR
        SELECT emp_id, emp_name
        FROM emp
        WHERE dept_id = p_dept_id
          AND dept_name = p_dept_name;
END;
/
DECLARE
    v_cursor SYS_REFCURSOR;
    v_emp_id   emp.emp_id%TYPE;
    v_emp_name emp.emp_name%TYPE;
BEGIN
    p1(
        p_dept_id   => 10,
        p_dept_name => 'SALES',
        p_cursor    => v_cursor,
        p_pay       => 20000
    );


    LOOP
        FETCH v_cursor INTO v_emp_id, v_emp_name;
        EXIT WHEN v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_emp_id || ' - ' || v_emp_name);
    END LOOP;

    CLOSE v_cursor;
END;
/
