-- ===========================
-- 1. Customers
-- ===========================
CREATE TABLE Customers
(
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100) NOT NULL,
    gender VARCHAR2(10),
    age NUMBER,
    city VARCHAR2(50),
    email VARCHAR2(100),
    phone NUMBER
);

-- ===========================
-- 2. Categories
-- ===========================

CREATE TABLE Categories
(
    category_id NUMBER PRIMARY KEY,
    category_name VARCHAR2(50) NOT NULL
);

-- ===========================
-- 3. Suppliers
-- ===========================

CREATE TABLE Suppliers
(
    supplier_id NUMBER PRIMARY KEY,
    supplier_name VARCHAR2(100) NOT NULL,
    city VARCHAR2(50),
    phone NUMBER
);

-- ===========================
-- 4. Products
-- ===========================

CREATE TABLE Products
(
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL,
    category_id NUMBER,
    supplier_id NUMBER,
    price NUMBER(10,2),
    stock_quantity NUMBER,

    CONSTRAINT fk_product_category
    FOREIGN KEY(category_id)
    REFERENCES Categories(category_id),

    CONSTRAINT fk_product_supplier
    FOREIGN KEY(supplier_id)
    REFERENCES Suppliers(supplier_id)
);

-- ===========================
-- 5. Employees
-- ===========================

CREATE TABLE Employees
(
    employee_id NUMBER PRIMARY KEY,
    employee_name VARCHAR2(100) NOT NULL,
    designation VARCHAR2(50),
    city VARCHAR2(50),
    salary NUMBER(10,2)
);

-- ===========================
-- 6. Regions
-- ===========================

CREATE TABLE Regions
(
    region_id NUMBER PRIMARY KEY,
    region_name VARCHAR2(50)
);

-- ===========================
-- 7. Sales Orders
-- ===========================

CREATE TABLE Sales_Orders
(
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    employee_id NUMBER,
    region_id NUMBER,
    order_date DATE,

    CONSTRAINT fk_order_customer
    FOREIGN KEY(customer_id)
    REFERENCES Customers(customer_id),

    CONSTRAINT fk_order_employee
    FOREIGN KEY(employee_id)
    REFERENCES Employees(employee_id),

    CONSTRAINT fk_order_region
    FOREIGN KEY(region_id)
    REFERENCES Regions(region_id)
);

-- ===========================
-- 8. Sales Order Details
-- ===========================

CREATE TABLE Sales_Order_Details
(
    order_detail_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    product_id NUMBER,
    quantity NUMBER,
    unit_price NUMBER(10,2),

    CONSTRAINT fk_detail_order
    FOREIGN KEY(order_id)
    REFERENCES Sales_Orders(order_id),

    CONSTRAINT fk_detail_product
    FOREIGN KEY(product_id)
    REFERENCES Products(product_id)
);

-- ===========================
-- 9. Payments
-- ===========================

CREATE TABLE Payments
(
    payment_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    payment_date DATE,
    payment_mode VARCHAR2(30),
    amount NUMBER(10,2),

    CONSTRAINT fk_payment_order
    FOREIGN KEY(order_id)
    REFERENCES Sales_Orders(order_id)
);

-- ===========================
-- 10. Returns
-- ===========================

CREATE TABLE Returns
(
    return_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    product_id NUMBER,
    return_date DATE,
    quantity NUMBER,

    CONSTRAINT fk_return_order
    FOREIGN KEY(order_id)
    REFERENCES Sales_Orders(order_id),

    CONSTRAINT fk_return_product
    FOREIGN KEY(product_id)
    REFERENCES Products(product_id)
);   
