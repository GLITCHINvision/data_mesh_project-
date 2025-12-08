-- 01_setup_schemas.sql
-- Create schemas and base tables for the demo project

CREATE SCHEMA IF NOT EXISTS sales_raw;
CREATE SCHEMA IF NOT EXISTS inventory_raw;
CREATE SCHEMA IF NOT EXISTS analytics_sales;
CREATE SCHEMA IF NOT EXISTS analytics_inventory;

-- Raw sales orders table
CREATE TABLE IF NOT EXISTS sales_raw.orders (
    order_id        SERIAL PRIMARY KEY,
    order_date      DATE        NOT NULL,
    customer_id     INTEGER     NOT NULL,
    product_id      INTEGER     NOT NULL,
    quantity        INTEGER     NOT NULL,
    unit_price      NUMERIC(10,2) NOT NULL
);

-- Raw products / inventory table
CREATE TABLE IF NOT EXISTS inventory_raw.products (
    product_id      INTEGER     PRIMARY KEY,
    product_name    TEXT        NOT NULL,
    category        TEXT        NOT NULL,
    current_stock   INTEGER     NOT NULL,
    reorder_level   INTEGER     NOT NULL
);
