
-- Update Product Stock
CREATE OR REPLACE PROCEDURE update_stock
(
    p_product_id NUMBER,
    p_quantity NUMBER
)
AS
BEGIN

    UPDATE Products
    SET stock_quantity = stock_quantity - p_quantity
    WHERE product_id = p_product_id;

    COMMIT;

END;
/

EXEC update_stock(10,2);


-- Increase Employee Salary
CREATE OR REPLACE PROCEDURE increase_salary
(
    p_employee_id NUMBER,
    p_amount NUMBER
)
AS
BEGIN

    UPDATE Employees
    SET salary = salary + p_amount
    WHERE employee_id = p_employee_id;

    COMMIT;

END;
/

EXEC increase_salary(5,5000);


-- Update Product Price
CREATE OR REPLACE PROCEDURE update_price
(
    p_product_id NUMBER,
    p_new_price NUMBER
)
AS
BEGIN

    UPDATE Products
    SET price = p_new_price
    WHERE product_id = p_product_id;

    COMMIT;

END;
/

EXEC update_price(15,4999);
