{{ config(schema="inventory_raw", materialized="view") }}

SELECT
    product_id,
    product_name,
    category,
    current_stock,
    reorder_level
FROM {{ source('inventory_raw', 'products') }}
