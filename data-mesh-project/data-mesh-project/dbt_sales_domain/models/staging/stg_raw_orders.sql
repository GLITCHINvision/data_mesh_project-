{{ config(schema="sales_raw", materialized="view") }}

SELECT
    order_id,
    order_date,
    customer_id,
    product_id,
    quantity,
    unit_price,
    quantity * unit_price AS order_amount
FROM {{ source('sales_raw', 'orders') }}
