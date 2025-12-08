-- 02_seed_raw_data.sql
-- Insert some dummy data into the raw tables

INSERT INTO sales_raw.orders (order_date, customer_id, product_id, quantity, unit_price)
VALUES
    ('2025-01-01', 1, 101, 2, 499.99),
    ('2025-01-01', 2, 102, 1, 299.50),
    ('2025-01-02', 1, 103, 3, 99.99),
    ('2025-01-02', 3, 101, 1, 499.99)
ON CONFLICT DO NOTHING;

INSERT INTO inventory_raw.products (product_id, product_name, category, current_stock, reorder_level)
VALUES
    (101, 'Gaming Laptop', 'Electronics', 25, 10),
    (102, 'Mechanical Keyboard', 'Accessories', 50, 15),
    (103, 'Wireless Mouse', 'Accessories', 60, 20)
ON CONFLICT (product_id) DO UPDATE
    SET current_stock = EXCLUDED.current_stock;
