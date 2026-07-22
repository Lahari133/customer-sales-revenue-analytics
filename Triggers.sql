-- Prevent Negative Stock
CREATE OR REPLACE TRIGGER trg_negative_stock
BEFORE UPDATE OF stock_quantity
ON Products
FOR EACH ROW
BEGIN

    IF :NEW.stock_quantity < 0 THEN
        RAISE_APPLICATION_ERROR(-20001,'Stock cannot be negative');
    END IF;

END;
/

-- Employee Salary Audit

CREATE TABLE Employee_Audit
(
    audit_id NUMBER PRIMARY KEY,
    employee_id NUMBER,
    old_salary NUMBER(10,2),
    new_salary NUMBER(10,2),
    change_date DATE
);

CREATE SEQUENCE employee_audit_seq
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_salary_audit
AFTER UPDATE OF salary
ON Employees
FOR EACH ROW
BEGIN

    INSERT INTO Employee_Audit
    VALUES
    (
        employee_audit_seq.NEXTVAL,
        :OLD.employee_id,
        :OLD.salary,
        :NEW.salary,
        SYSDATE
    );

END;
/
