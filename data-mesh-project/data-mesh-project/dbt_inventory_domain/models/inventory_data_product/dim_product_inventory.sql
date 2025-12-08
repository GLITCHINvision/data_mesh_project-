{{ config(schema="analytics_inventory", materialized="table") }}

SELECT
    product_id,
    product_name,
    category,
    current_stock,
    reorder_level,
    CASE
        WHEN current_stock <= reorder_level THEN TRUE
        ELSE FALSE
    END AS is_low_stock
FROM {{ ref('stg_raw_products') }}
