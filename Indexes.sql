
-- Customer Index
CREATE INDEX idx_customer
ON Sales_Orders(customer_id);

-- Employee Index
CREATE INDEX idx_employee
ON Sales_Orders(employee_id);

-- Product Index
CREATE INDEX idx_product
ON Sales_Order_Details(product_id);

-- Order Index
CREATE INDEX idx_order
ON Sales_Order_Details(order_id);

-- Payment Mode Index
CREATE INDEX idx_payment_mode
ON Payments(payment_mode);

-- Product Category Index
CREATE INDEX idx_category
ON Products(category_id);

-- Supplier Index
CREATE INDEX idx_supplier
ON Products(supplier_id);

-- Region Index
CREATE INDEX idx_region
ON Sales_Orders(region_id);


SELECT index_name,
       table_name
FROM user_indexes
WHERE table_name IN
(
'SALES_ORDERS',
'SALES_ORDER_DETAILS',
'PRODUCTS',
'PAYMENTS'
);
