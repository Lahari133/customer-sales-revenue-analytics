-- Total Customer Spending
CREATE OR REPLACE FUNCTION total_customer_spending
(
    p_customer NUMBER
)
RETURN NUMBER
IS
    total_amount NUMBER;
BEGIN

    SELECT SUM(amount)
    INTO total_amount
    FROM Payments p
    JOIN Sales_Orders so
        ON p.order_id = so.order_id
    WHERE so.customer_id = p_customer;

    RETURN NVL(total_amount,0);

END;
/

SELECT total_customer_spending(5)
FROM dual;


-- Total Orders by Customer
CREATE OR REPLACE FUNCTION total_orders
(
    p_customer NUMBER
)
RETURN NUMBER
IS
    total_order NUMBER;
BEGIN

    SELECT COUNT(*)
    INTO total_order
    FROM Sales_Orders
    WHERE customer_id = p_customer;

    RETURN total_order;

END;
/

SELECT total_orders(5)
FROM dual;
