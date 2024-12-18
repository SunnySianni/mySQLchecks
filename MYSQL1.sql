--  Create a new database named "ecommerce".
CREATE DATABASE ecommerce;

--  Select the newly created database for use.
USE ecommerce;

--  Create a table named "customers" to store customer details.
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each customer.
    first_name VARCHAR(50) NOT NULL,            -- Customer's first name (required).
    last_name VARCHAR(50) NOT NULL,             -- Customer's last name (required).
    email VARCHAR(100) UNIQUE NOT NULL,         -- Customer's email (required and must be unique).
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp of record creation (default is current time).
);

-- Create a table named "products" to store product details.
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID for each product.
    name VARCHAR(100) NOT NULL,                 -- Product name (required).
    description TEXT,                           -- Product description (optional).
    price DECIMAL(10, 2) NOT NULL,              -- Product price with 2 decimal places (required).
    stock_quantity INT NOT NULL,                -- Number of items in stock (required).
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp of record creation.
);

--  Create a table named "orders" to store order details.
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique ID for each order.
    customer_id INT NOT NULL,                   -- ID of the customer placing the order.
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp of when the order was placed.
    total_amount DECIMAL(10, 2) NOT NULL,       -- Total price of the order.
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) -- Ensures customer_id exists in "customers" table.
);

--  Create a table named "order_items" to store details of items in an order.
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each order item.
    order_id INT NOT NULL,                        -- ID of the associated order.
    product_id INT NOT NULL,                      -- ID of the associated product.
    quantity INT NOT NULL,                        -- Number of units of the product in the order.
    unit_price DECIMAL(10, 2) NOT NULL,           -- Price per unit of the product.
    FOREIGN KEY (order_id) REFERENCES orders(order_id), -- Ensures order_id exists in "orders" table.
    FOREIGN KEY (product_id) REFERENCES products(product_id) -- Ensures product_id exists in "products" table.
);

--  Insert sample data into the "customers" table.
INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Mike', 'Johnson', 'mike.johnson@example.com'),
('Emily', 'Brown', 'emily.brown@example.com');

--  Insert sample data into the "products" table.
INSERT INTO products (name, description, price, stock_quantity) VALUES
('Laptop', 'High-performance laptop', 999.99, 50),
('Smartphone', 'Latest model smartphone', 699.99, 100),
('Headphones', 'Noise-cancelling headphones', 199.99, 75),
('Tablet', '10-inch tablet', 299.99, 30),
('Smart Watch', 'Fitness tracking smart watch', 149.99, 60);

-- Insert sample data into the "orders" table.
INSERT INTO orders (customer_id, total_amount) VALUES
(1, 1199.98),
(2, 699.99),
(3, 349.98),
(4, 999.99),
(1, 449.97);

-- Insert sample data into the "order_items" table.
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 999.99), -- Order #1 includes 1 Laptop.
(1, 3, 1, 199.99), -- Order #1 includes 1 Headphone.
(2, 2, 1, 699.99), -- Order #2 includes 1 Smartphone.
(3, 3, 1, 199.99), -- Order #3 includes 1 Headphone.
(3, 5, 1, 149.99), -- Order #3 includes 1 Smart Watch.
(4, 1, 1, 999.99), -- Order #4 includes 1 Laptop.
(5, 2, 1, 699.99), -- Order #5 includes 1 Smartphone.
(5, 5, 1, 149.99), -- Order #5 includes 1 Smart Watch.
(5, 3, 1, 199.99); -- Order #5 includes 1 Headphone.

--  Retrieve a list of orders with customer details.
SELECT o.order_id, o.order_date, o.total_amount, 
       c.first_name, c.last_name, c.email
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

--  Retrieve detailed order items with product and subtotal information.
SELECT oi.order_id, o.order_date, p.name AS product_name, 
       oi.quantity, oi.unit_price, (oi.quantity * oi.unit_price) AS subtotal
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id;

--  Calculate total revenue for each customer.
SELECT c.customer_id, c.first_name, c.last_name, 
       SUM(o.total_amount) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Calculate the total revenue across all orders.
SELECT SUM(total_amount) AS total_revenue
FROM orders;

--  Calculate the average value of all orders.
SELECT AVG(total_amount) AS average_order_value
FROM orders;

-- Count the number of orders placed by each customer.
SELECT c.customer_id, c.first_name, c.last_name, 
       COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
