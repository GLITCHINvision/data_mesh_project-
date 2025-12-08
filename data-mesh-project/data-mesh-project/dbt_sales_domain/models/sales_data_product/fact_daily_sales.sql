{{ config(schema="analytics_sales", materialized="table") }}

SELECT
    order_date,
    product_id,
    SUM(quantity) AS total_quantity,
    SUM(order_amount) AS total_revenue,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM {{ ref('stg_raw_orders') }}
GROUP BY order_date, product_id
