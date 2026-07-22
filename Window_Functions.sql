-- 1. ROW_NUMBER() - Top 5 Customers by Spending
SELECT *
FROM
(
    SELECT
        c.customer_name,
        SUM(p.amount) AS total_spending,
        ROW_NUMBER() OVER(ORDER BY SUM(p.amount) DESC) AS rn
    FROM Customers c
    JOIN Sales_Orders so
        ON c.customer_id = so.customer_id
    JOIN Payments p
        ON so.order_id = p.order_id
    GROUP BY c.customer_name
)
WHERE rn <= 5;


-- 2. RANK() - Employee Revenue Ranking
SELECT
    e.employee_name,
    SUM(sod.quantity * sod.unit_price) AS revenue,
    RANK() OVER(ORDER BY SUM(sod.quantity * sod.unit_price) DESC) AS employee_rank
FROM Employees e
JOIN Sales_Orders so
    ON e.employee_id = so.employee_id
JOIN Sales_Order_Details sod
    ON so.order_id = sod.order_id
GROUP BY e.employee_name;


-- 3. DENSE_RANK() - Product Revenue Ranking
SELECT
    p.product_name,
    SUM(sod.quantity * sod.unit_price) AS revenue,
    DENSE_RANK() OVER(ORDER BY SUM(sod.quantity * sod.unit_price) DESC) AS product_rank
FROM Products p
JOIN Sales_Order_Details sod
    ON p.product_id = sod.product_id
GROUP BY p.product_name;


-- 4. LAG() - Previous Month Sales
SELECT
    month_name,
    revenue,
    LAG(revenue) OVER(ORDER BY month_name) AS previous_month_sales
FROM vw_monthly_sales;


-- 5. LEAD() - Next Month Sales
SELECT
    month_name,
    revenue,
    LEAD(revenue) OVER(ORDER BY month_name) AS next_month_sales
FROM vw_monthly_sales;


-- 6. NTILE() - Customer Spending Groups
SELECT
    customer_name,
    total_spending,
    NTILE(4) OVER(ORDER BY total_spending DESC) AS spending_group
FROM
(
    SELECT
        c.customer_name,
        SUM(p.amount) AS total_spending
    FROM Customers c
    JOIN Sales_Orders so
        ON c.customer_id = so.customer_id
    JOIN Payments p
        ON so.order_id = p.order_id
    GROUP BY c.customer_name
);
