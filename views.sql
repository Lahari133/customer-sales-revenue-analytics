
-- 1. Customer Order History
CREATE VIEW vw_customer_order_history AS
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date
FROM Customers c
INNER JOIN Sales_Orders o
ON c.customer_id = o.customer_id;

-- 2. Product Sales
CREATE VIEW vw_product_sales AS
SELECT
    p.product_id,
    p.product_name,
    SUM(sod.quantity) AS total_quantity_sold
FROM Products p
INNER JOIN Sales_Order_Details sod
ON p.product_id = sod.product_id
GROUP BY p.product_id, p.product_name;

-- 3. Employee Performance
CREATE VIEW vw_employee_performance AS
SELECT
    e.employee_id,
    e.employee_name,
    COUNT(so.order_id) AS total_orders
FROM Employees e
INNER JOIN Sales_Orders so
ON e.employee_id = so.employee_id
GROUP BY e.employee_id, e.employee_name;

-- 4. Category Revenue
CREATE VIEW vw_category_revenue AS
SELECT
    c.category_name,
    SUM(sod.quantity * sod.unit_price) AS revenue
FROM Categories c
INNER JOIN Products p
ON c.category_id = p.category_id
INNER JOIN Sales_Order_Details sod
ON p.product_id = sod.product_id
GROUP BY c.category_name;

-- 5. Supplier Revenue
CREATE VIEW vw_supplier_revenue AS
SELECT
    s.supplier_name,
    SUM(sod.quantity * sod.unit_price) AS revenue
FROM Suppliers s
INNER JOIN Products p
ON s.supplier_id = p.supplier_id
INNER JOIN Sales_Order_Details sod
ON p.product_id = sod.product_id
GROUP BY s.supplier_name;

-- 6. Monthly Sales
CREATE VIEW vw_monthly_sales AS
SELECT
    TO_CHAR(so.order_date,'Mon YYYY') AS month_name,
    SUM(sod.quantity * sod.unit_price) AS revenue
FROM Sales_Orders so
INNER JOIN Sales_Order_Details sod
ON so.order_id = sod.order_id
GROUP BY TO_CHAR(so.order_date,'Mon YYYY');

-- 7. Payment Summary
CREATE VIEW vw_payment_summary AS
SELECT
    payment_mode,
    SUM(amount) AS total_amount
FROM Payments
GROUP BY payment_mode;

-- 8. Returned Products
CREATE VIEW vw_returned_products AS
SELECT
    p.product_name,
    COUNT(r.return_id) AS total_returns
FROM Returns r
INNER JOIN Products p
ON r.product_id = p.product_id
GROUP BY p.product_name;


SELECT * FROM vw_customer_order_history;
SELECT * FROM vw_product_sales;
SELECT * FROM vw_employee_performance;
SELECT * FROM vw_category_revenue;
SELECT * FROM vw_supplier_revenue;
SELECT * FROM vw_monthly_sales;
SELECT * FROM vw_payment_summary;
SELECT * FROM vw_returned_products;
